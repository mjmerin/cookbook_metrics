# cookbook metrics
class Metrics
  attr_reader :total_downloads
  attr_reader :followers
  attr_reader :collaborators
  attr_reader :ver_array

  def initialize(data)
    @accessor = data['metrics']
    @total_downloads = @accessor['downloads']['total']
    @followers = @accessor['followers']
    @collaborators = @accessor['collaborators']
    @raw_version_array = @accessor['downloads']['versions']
    @ver_array = @raw_version_array.sort_by { |a, _b| Gem::Version.new(a) }
  end

  def calculate_most_downloaded
    highest_download = ['0.0.0', 0]

    @ver_array.to_a.each do |version|
      highest_download = version if version[1] > highest_download[1]
    end
    highest_download
  end
end
