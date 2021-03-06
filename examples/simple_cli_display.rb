require 'cookbook_metrics'

def validate_cli_input
  if ARGV.empty?
    printf "Please specify a Chef Supermarket cookbook to see metrics. \n"
    printf "  Usage: ruby #{__FILE__} <cookbook name> \n"
    printf "  Usage: ruby #{__FILE__} <cookbook name> csv \n"
    exit(2)
  end
end

validate_cli_input
CookbookMetrics.display_cookbook_metrics(ARGV[0], ARGV[1])
