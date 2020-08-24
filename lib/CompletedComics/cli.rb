class CLI
 
    def welcome #✓ instance method to start it all. 
        puts ""
        puts "❀ ------------------------------------------❀ Welcome!❀ -------------------------------------------❀"
        puts "✦                               ~❀ This is the Completed Comics APP!❀ ~                            ✦"
        puts "❀                  ~ ❀Here, you find what comics have been completed by genre!❀ ~                  ❀"
        puts "✦                                  ~❀ Let us begin, Dear Reader.❀ ~                                ✦"
        puts "❀ ----------------------------------------------❀ -❀ ----------------------------------------------❀"
        puts ""
        sleep (1) # wait a few seconds before showing genre_menu
        genre_menu
    end 
    
    def genre_menu #✓
        puts ""
        puts "❀ ----------------------------------------❀ Select Genre❀ -----------------------------------------❀"
        puts "✦                  ~❀ Here are the following genres that have completed titles.❀ ~                 ✦"
        puts ""
        the_genres        
        give_genres
        puts ""
        puts "❀                ~❀ Please choose select a genre by number to see completed titles.❀ ~             ❀"
        puts ""

        choose_genre

        puts ""
        puts "❀ ----------------------------------------------❀ -❀ ----------------------------------------------❀"
        puts ""       
    end 

    def the_genres #✓ 
        Scraper.scrape_genres
        @genres = Genre.all
    end   

    def give_genres #✓
        @genres.each.with_index(1) do |genre, index| #prints them as a list of 14 so that user can pick from there to got to menue with titles in it for them
            puts "                                           #{index}. #{genre.type}"
        end 
    end 

    def choose_genre #✓
        chosen_genre = gets.strip.to_i
        titles_for(chosen_genre) if accepted(chosen_genre.to_i, @genres) #asks to validate answer based on the list given in give_genres
    end 

    def accepted(input, data)  #✓ validates an intiger input from choose_genre
        input.to_i <= data.length && input.to_i > 0        
    end 

    def titles_for(chosen_genre) #gets titles from the chosen_genre to show a list of completed titles from that genre
        genre = @genres[chosen_genre-1]    

        puts ""
        puts "✦ ----------------------------❀ Here are Comics for #{genre.type} ❀ ------------------------------------✦"
        puts ""
        Title.clear_all
        the_comics(genre.type)
        give_comics
        puts ""
        puts "❀ ----------------------------------------------❀ -❀ ----------------------------------------------❀"
        puts ""
        sleep (1)
        menu_return
    end 

    def the_comics(genre)
        Scraper.scrape_titles(genre)
        @comics = Title.all
    end 

    def give_comics
        @comics.each.with_index(1) do |comic, index|
            puts "                          #{index}. #{comic.title} by #{comic.author} "
        end
    end
    
    def menu_return #✓
        puts ""
        puts "❀ ------------------------------------❀ Where To Next?❀ -------------------------------------------❀"
        puts "✦                                  ~❀ Where would you like to go?❀ ~                               ✦"
        puts ""
        puts "❀                                    ❀ 1. Back to Genre menu ❀                                     ❀"   
        puts "✦                                    ❀ 2. Leave App          ❀                                     ✦" 
        puts ""
        puts "❀                                  ~❀ Please select by number.❀ ~                                  ❀"
        puts ""
        
        return_input = gets.strip.to_i

        puts ""
        puts "❀ ----------------------------------------------❀ -❀ ----------------------------------------------❀"
        

        if return_input == 1 
            Genre.clear_all 
            genre_menu
        elsif return_input == 2 
            exit_app
        else        
            puts ""
            puts "❀ ----------------------------------------------❀ -❀ ----------------------------------------------❀"
            puts "✦                                 ~❀ Please enter a valid option❀ ~                                ✦"
            puts "❀ ----------------------------------------------❀ -❀ ----------------------------------------------❀"
            puts ""
            menu_return    
        end
    end     

    def exit_app #✓
        puts ""
        puts "❀ -------------------------------------------❀ Goodbye❀ -------------------------------------------❀"
        puts "✦                     ~❀ Thank you for using Completed Comics. Happy reading!❀ ~                   ✦"
        puts "❀ ----------------------------------------------❀ -❀ ----------------------------------------------❀"
        exit
    end 

end 