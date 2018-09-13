require 'rest-client'
require 'json'

# Cookbook version info
class Version
  attr_reader :quality_metrics
  attr_reader :supports
  attr_reader :dependencies

  def initialize(data, version_url)
    @version_url = version_url
    @data = parse_data
    @quality_metrics = data['quality_metrics']
    @supports = data['supports']
    @dependencies = data['dependencies']
  end

  def license
    data['license']
  end

  def file_size
    data['tarball_file_size']
  end

  def version_number
    data['version']
  end

  def published
    data['published_at']
  end

  def cookbook
    data['cookbook']
  end

  def file
    data['versions']['file']
  end

  private

  def parse_data
    response = RestClient.get(@version_url)
    JSON.parse(response)
  end

end
