require_relative 'cookbook'

require 'date'
require 'csv'

def print_metrics(total, version, downloads)
  current_time = Time.now
  formatted_time = current_time.strftime '%m/%d/%Y - %H:%M'

  printf "\n"
  printf "Metrics: \n"
  printf "  Date/Time: #{formatted_time} \n"
  printf "  Total Downloads: #{total} \n"
  printf "  Most Downloaded Version: %s at %s downloads \n\n",
         version, downloads
  printf "===========================================================\n"
end

def generate_csv(data)
  CSV.open('cookbook_metrics.csv', 'a') do |csv|
    data.each do |version, downloads|
      csv << [version, downloads]
    end
  end
end

def log_to_csv(data)
  unless File.exist?('cookbook_metrics.csv')
    generate_csv(data)
    exit
  end

  CSV.open('cookbook_metrics.csv', 'a') do |csv|
    csv << %w[row of CSV data]
    csv << %w[another row]
  end
end

if ARGV.empty?
  printf 'Please specify a Chef Supermarket cookbook to see metrics. \n'
  exit
end

cookbook = Cookbook.new(ARGV[0])
highest_download = ['0.0.0', 0]

total = cookbook.total_downloads
source_url = cookbook.source_url
desc = cookbook.desc
ver_array = cookbook.ver_array

printf "\n==============  %s cookbook metrics  ==============\n", cookbook.name
printf "Description: #{desc}\n"
printf "Source URL:  #{source_url}\n\n"

printf "Version Downloads\n"
printf "------- ---------\n"
ver_array.each do |version|
  highest_download = version if version[1] > highest_download[1]
  printf "%-08s %-10s\n", version[0], version[1]
end

print_metrics(total, highest_download[0], highest_download[1])

log_to_csv(sorted) if ARGV[1] == 'csv'
