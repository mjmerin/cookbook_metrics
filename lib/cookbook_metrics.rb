require_relative 'cookbook_metrics/cookbook'
require_relative 'cookbook_metrics/display'

module CookbookMetrics
  VERSION = '0.1.0'.freeze

  def display_cookbook_metrics(cookbook_name, option)
    cookbook = Cookbook.new(cookbook_name)
    display = Display.new(cookbook.name)

    display.header(cookbook.description, cookbook.source_url)
    display.version_table(cookbook.metrics)

    total = cookbook.metrics.total_downloads
    most_downloaded = cookbook.metrics.calculate_most_downloaded
    display.print(total, most_downloaded[0], most_downloaded[1])
    display.log_to_csv(sorted) if option == 'csv'
  end
end
