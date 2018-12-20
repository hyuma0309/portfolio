require 'uri'
require 'net/http'
require 'json'

class Movie < ApplicationRecord

  has_one :vod_info
  has_many :vod_services, through: :vod_info
  has_many :bookmarks,dependent: :destroy
  has_many :users, through: :bookmarks

  def self.search_and_get(name)
    # api検索
    encoded_url_string = URI.encode('https://api.themoviedb.org/3/search/movie?api_key=53ea4f986260fa27ae8ede7e3103c9d3&language=ja&query=' + name.to_s)
    url = URI(encoded_url_string)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)

    request.body = '{}'

    response = http.request(request)

    hash = JSON.parse(response.body)

    movies = []
    return movies if hash['results'].nil?
    hash['results'].each do |result|
      movie = find_or_create_by(title: result['title'])
      movie.title = result['title']
      movie.poster_path = result['poster_path']
      movie.overview = result['overview']
      movie.release_date = result['release_date']
      movie.save
      movies << movie
    end
    VodInfo.search_and_save(name)
     movies
  end
end
