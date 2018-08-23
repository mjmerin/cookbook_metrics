require 'rest-client'
require 'json'
require 'date'

cookbook = ARGV[0]
url = "https://supermarket.chef.io/api/v1/cookbooks/#{cookbook}"
response = RestClient.get(url)
parsed = JSON.parse(response)
highest_download = ['0.0.0', 0]

total = parsed['metrics']['downloads']['total']
version_array = parsed['metrics']['downloads']['versions']
sorted = version_array.sort_by { |a, _b| Gem::Version.new(a) }

sorted.each do |version|
  if version[1] > highest_download[1]
    highest_download = version
  end

  printf "%-08s %-03s\n", version[0], version[1]
end

current_time = DateTime.now
formatted_time = current_time.strftime '%m/%d/%Y %H:%M'

printf "\n"
printf "#{cookbook} cookbook metrics: \n"
printf "  Date/Time: #{formatted_time} \n"
printf "  Total Downloads: #{total} \n"
printf "  Most Popular Version: %s at %s downloads \n",
       highest_download[0], highest_download[1]
