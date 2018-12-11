require 'selenium-webdriver'
require 'nokogiri'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
options.add_argument('--disable-gpu')

driver = Selenium::WebDriver.for :chrome, options: options
driver.navigate.to 'https://www.justwatch.com/jp/検索?q=プリズン・ブレイク'
wait = Selenium::WebDriver::Wait.new(timeout: 300)
wait.until { driver.find_element(xpath: '//div[2]/filter-bar/div[2]/div[2]/div[3]/div[2]/div') }
doc = Nokogiri::HTML.parse(driver.execute_script('return document.documentElement.innerHTML'))

# 検索結果のタイトルを表示
doc.xpath('//div[2]/filter-bar/ng-transclude/core-list/div/div/div').each do |node|
  puts node.xpath('/html/body/div[2]/filter-bar/ng-transclude/core-list/div').text
end