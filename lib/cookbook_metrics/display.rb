require 'date'
require 'csv'

# Metrics class for printing out cookbook stats
class Display
  def initialize(cookbook_name)
    @cookbook_name = cookbook_name
    @current_time = Time.now.strftime '%m/%d/%Y - %H:%M'
    @csv_file = "#{@cookbook_name}_cookbook_metrics.csv"
  end

  def header(desc, source_url)
    printf "\n==============  #{@cookbook_name} cookbook metrics  ==============\n"
    printf "Description: #{desc}\n"
    printf "Source URL:  #{source_url}\n\n"
  end

  def print(total, version, downloads)
    printf "\n"
    printf "Metrics: \n"
    printf "  Date/Time: %s \n", @current_time
    printf "  Total Downloads: #{total} \n"
    printf "  Most Downloaded Version: %s at %s downloads \n\n",
           version, downloads
    printf "===========================================================\n"
  end

  def version_table(metrics)
    printf "Version Downloads\n"
    printf "------- ---------\n"
    metrics.ver_array.each do |version|
      printf "%-08s %-10s\n", version[0], version[1]
    end
  end

  def generate_csv(data)
    CSV.open(@csv_file, 'a') do |csv|
      data.each do |version, downloads|
        csv << [version, downloads]
      end
    end
  end

  def log_to_csv(data)
    unless File.exist?(@csv_file)
      generate_csv(data)
      exit
    end

    CSV.open(@csv_file, 'a') do |csv|
      csv << %w[row of CSV data]
      csv << %w[another row]
    end
  end
end
