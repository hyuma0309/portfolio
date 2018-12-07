require 'uri'
require 'net/http'
require 'json'
require 'selenium-webdriver'
require 'nokogiri'

class Movie
  attr_accessor :title, :poster_path, :overview, :release_date, :vod
end

class Vod
  attr_accessor :title, :services
end

def get_movie_data(name)
  # api検索
  encoded_url_string = URI.encode("https://api.themoviedb.org/3/search/movie?api_key=53ea4f986260fa27ae8ede7e3103c9d3&language=ja&query="+name.to_s)
  url =URI(encoded_url_string)

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)

  request.body = "{}"

  response = http.request(request)

  hash= JSON.parse(response.body)

  movies = Array.new
  hash["results"].each do |result|
    movie = Movie.new
    movie.title = result['title']
    movie.poster_path = result['poster_path']
    movie.overview = result['overview']
    movie.release_date = result['release_date']
    movies << movie
  end
  return movies
end


def get_vod_data(name)
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')

  driver = Selenium::WebDriver.for :chrome, options: options
  
  driver.navigate.to 'https://www.justwatch.com/jp/検索?q=' +name.to_s 
  wait = Selenium::WebDriver::Wait.new(timeout: 300)

  vods = Array.new
  wait.until do driver.find_element(:class, 'main-content__list-element') end
  driver.find_elements(:class, 'main-content__list-element').each do |movie_element|
    vod = Vod.new
    vod.services = Array.new
    vod.title = movie_element.find_element(:class, 'main-content__list-element__title').find_element(:tag_name, 'span').text
    if movie_element.find_elements(:class, 'price-comparison__grid__row--stream').size > 0
      movie_element.find_element(:class, 'price-comparison__grid__row--stream')
        .find_elements(:class, 'price-comparison__grid__row__icon').each do |icon_element|
        vod.services << icon_element.attribute('alt')
      end
    end
    vods << vod
  end
  driver.quit
  return vods
end

name = ARGV[0]

movies = get_movie_data(name)
vods = get_vod_data(name)

movies.each do |movie|
  vods.each do |vod|
    if movie.title == vod.title
      movie.vod = vod
    end 
  end
end

movies.each do |movie|
  p movie
end