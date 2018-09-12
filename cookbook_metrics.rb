require_relative 'cookbook'
require_relative 'display'

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
  display = Display.new(cookbook.name)

  display.header(cookbook.description, cookbook.source_url)
  display.version_table(cookbook.metrics)

  total = cookbook.metrics.total_downloads
  most_downloaded = cookbook.metrics.calculate_most_downloaded
  display.print(total, most_downloaded[0], most_downloaded[1])
  display.log_to_csv(sorted) if ARGV[1] == 'csv'
end

display_cookbook_metrics
