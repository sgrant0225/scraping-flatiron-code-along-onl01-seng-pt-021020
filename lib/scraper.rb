require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'
#We are requiring our Course class file so that our Scraper can make new courses and give them attributes scraped from the web page.

class Scraper
  
# def get_page #responsible for using Nokogiri and open-uri to grab the entire HTML document from the web page
#   doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
#   # doc.css(".post").each do |post| 
#   #   course = Course.new
#   #   course.title = post.css("h2").text
#   #   course.schedule = post.css(".date").text 
#   #   course.description = post.css("p").text
#   #end
  
  
  
  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
  
  def get_courses
    self.get_page.css(".post")
  end
  
  def make_courses
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
 
end



