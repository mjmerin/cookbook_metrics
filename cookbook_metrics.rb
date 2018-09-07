require_relative 'cookbook'
require_relative 'metrics'

if ARGV.empty?
  printf 'Please specify a Chef Supermarket cookbook to see metrics. \n'
  exit
end

cookbook = Cookbook.new(ARGV[0])
metrics = Metrics.new(cookbook.name)
highest_download = ['0.0.0', 0]

total = cookbook.total_downloads
ver_array = cookbook.ver_array

metrics.header(cookbook.name, cookbook.desc, cookbook.source_url)

printf "Version Downloads\n"
printf "------- ---------\n"
ver_array.each do |version|
  highest_download = version if version[1] > highest_download[1]
  printf "%-08s %-10s\n", version[0], version[1]
end

metrics.print(total, highest_download[0], highest_download[1])

metrics.log_to_csv(sorted) if ARGV[1] == 'csv'
