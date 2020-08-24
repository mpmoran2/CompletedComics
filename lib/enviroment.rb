require "nokogiri"
#require "pry"
require "open-uri"

require_relative "./CompletedComics/version"
require_relative "./CompletedComics/cli"
require_relative "./CompletedComics/genre"
require_relative "./CompletedComics/title"
require_relative "./CompletedComics/scraper"


#require and require_relative only looks at files, not folders. dont have to put .rb
#require = direct path through home folder and navigate through it
#if it was require_relative it would just look like "./webtoon_schedule/cli" because you are in Lib already. 
#require just more direct, use that 
