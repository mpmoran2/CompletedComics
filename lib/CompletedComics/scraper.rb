require 'nokogiri'
require 'open-uri'

class Scraper

    def self.scrape_genres
        doc = Nokogiri::HTML(open("https://www.webtoons.com/en/dailySchedule"))
        genre_type = doc.css("div.comp ul.daily_card li p.genre").children
        type = []
        genre_type.each do |g| 
            type << g.to_s
        end
        type.uniq.each do |gen|   
            Genre.new(gen.to_s)
        end 
      
    end
          
    def self.scrape_titles(title)
        doc = Nokogiri::HTML(open("https://www.webtoons.com/en/dailySchedule"))
        genre_comic = doc.css("div.comp ul.daily_card li").children
        comic = []

        genre_comic.each do |t|  
            if t.css(".genre").text == title
                name = t.css("p.subj").text.to_s
                author = t.css("p.author").text.to_s
                Title.new(name, author)      
            end  
        end  
    end
end 