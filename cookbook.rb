require_relative 'Metrics'
require 'rest-client'
require 'json'

# Chef cookbook class
class Cookbook
  attr_reader :name
  attr_reader :ver_array
  attr_reader :c_metrics

  def initialize(cookbook_name)
    @name = cookbook_name
    @url = "https://supermarket.chef.io/api/v1/cookbooks/#{cookbook_name}"
    @data = parse_data
    @c_metrics = Metrics.new(@data)
  end

  def parse_data
    response = RestClient.get(@url)
    JSON.parse(response)
  end

  def description
    @data['description']
  end

  def source_url
    @data['source_url']
  end

  def maintainer
    @data['maintainer']
  end

  def category
    @data['category']
  end

  def latest_version
    @data['latest_version']
  end

  def external_url
    @data['external_url']
  end

  def issues_url
    @data['issues_url']
  end

  def created_at
    @data['created_at']
  end

  def updated_at
    @data['updated_at']
  end
end
