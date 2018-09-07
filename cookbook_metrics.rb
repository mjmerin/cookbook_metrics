require 'rest-client'
require 'json'
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

cookbook = ARGV[0]
url = "https://supermarket.chef.io/api/v1/cookbooks/#{cookbook}"
response = RestClient.get(url)
parsed = JSON.parse(response)
highest_download = ['0.0.0', 0]

total = parsed['metrics']['downloads']['total']
version_array = parsed['metrics']['downloads']['versions']
source_url = parsed['source_url']
desc = parsed['description']
sorted = version_array.sort_by { |a, _b| Gem::Version.new(a) }

printf "\n==============  #{cookbook} cookbook metrics  ==============\n"
printf "Description: #{desc}\n"
printf "Source URL:  #{source_url}\n\n"

printf "Version Downloads\n"
printf "------- ---------\n"
sorted.each do |version|
  highest_download = version if version[1] > highest_download[1]

  printf "%-08s %-10s\n", version[0], version[1]
end

print_metrics(total, highest_download[0], highest_download[1])

log_to_csv(sorted) if ARGV[1] == 'csv'
