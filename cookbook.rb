require 'rest-client'
require 'json'

# Chef cookbook class
class Cookbook
  def initialize(cookbook_name)
    @name = cookbook_name
    @url = "https://supermarket.chef.io/api/v1/cookbooks/#{cookbook_name}"
    @data = parse_data
    @source_url = @data['source_url']
    @desc = @data['description']
    @raw_ver_array = @data['metrics']['downloads']['versions']
    @ver_array = @raw_ver_array.sort_by { |a, _b| Gem::Version.new(a) }
    @total_downloads = @data['metrics']['downloads']['total']
    @most_downloaded = calculate_most_downloaded
  end

  attr_reader :name
  attr_reader :source_url
  attr_reader :desc
  attr_reader :ver_array
  attr_reader :total_downloads
  attr_reader :most_downloaded

  def parse_data
    response = RestClient.get(@url)
    JSON.parse(response)
  end

  def calculate_most_downloaded
    highest_download = ['0.0.0', 0]

    @ver_array.each do |version|
      highest_download = version if version[1] > highest_download[1]
    end

    highest_download
  end
end
