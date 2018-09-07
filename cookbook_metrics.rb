require_relative 'cookbook'
require_relative 'metrics'

def validate_input
  if ARGV.empty?
    printf "Please specify a Chef Supermarket cookbook to see metrics. \n"
    printf "  Usage: ruby #{__FILE__} <cookbook name> \n"
    printf "  Usage: ruby #{__FILE__} <cookbook name> csv \n"
    exit(2)
  end
end

def display_cookbook_metrics
  validate_input

  cookbook = Cookbook.new(ARGV[0])
  metrics = Metrics.new(cookbook.name)

  metrics.header(cookbook.desc, cookbook.source_url)
  metrics.version_table(cookbook)

  total = cookbook.total_downloads
  metrics.print(total, cookbook.most_downloaded[0], cookbook.most_downloaded[1])
  metrics.log_to_csv(sorted) if ARGV[1] == 'csv'
end

display_cookbook_metrics
