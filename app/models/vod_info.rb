require 'selenium-webdriver'
require 'nokogiri'

class VodInfo < ApplicationRecord
  belongs_to :movie
  has_many :vod_services

  def self.search_and_save(name)
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')

    driver = Selenium::WebDriver.for :chrome, options: options

    driver.navigate.to 'https://www.justwatch.com/jp/検索?q=' + name.to_s
    wait = Selenium::WebDriver::Wait.new(timeout: 300)

    wait.until { driver.find_element(:class, 'main-content__list-element') }
    driver.find_elements(:class, 'main-content__list-element').each do |movie_element|
      title = movie_element.find_element(:class, 'main-content__list-element__title').find_element(:tag_name, 'span').text
      movie = Movie.find_by(title: title)
      if !movie.nil?
      vod_info = find_or_create_by(title: title)
      vod_info.title = title
      vod_info.movie = movie
      vod_info.save #APIとスクレイピングのタイトルが一致するものを保存
      unless movie_element.find_elements(:class, 'price-comparison__grid__row--stream').empty?
        movie_element.find_element(:class, 'price-comparison__grid__row--stream')
                     .find_elements(:class, 'price-comparison__grid__row__icon').each do |icon_element|
          service_name = icon_element.attribute('alt')
          vod_service = VodService.find_or_create_by(name: service_name, vod_info: vod_info)
          vod_service.vod_info = vod_info
          vod_service.name = service_name
          vod_service.save #vodの名前とAPIとスクレイピングのタイトルが一致するものを保存
        end
      end
      end
    end
    driver.quit
  end
end
