class CLI
 
    def welcome #✓ 
        puts ""
        puts "❀ ------------------------------------------❀ Welcome!❀ -------------------------------------------❀"
        puts "✦                               ~❀ This is the Completed Comics APP!❀ ~                            ✦"
        puts "❀                  ~ ❀Here, you find what comics have been completed by genre!❀ ~                  ❀"
        puts "✦                                  ~❀ Let us begin, Dear Reader.❀ ~                                ✦"
        puts "❀ ----------------------------------------------❀ -❀ ----------------------------------------------❀"
        puts ""
        sleep (1) #✓ 
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
        @genres.each.with_index(1) do |genre, index| 
            puts "                                           #{index}. #{genre.type}"
        end 
    end 

    def choose_genre #✓
        chosen_genre = gets.strip.to_i
        titles_for(chosen_genre) if accepted(chosen_genre.to_i, @genres) 
    end 

    def accepted(input, data)  #✓ 
        if input <= data.length && input > 0
            true
        else 
        puts ""
        puts "❀ ----------------------------------------------❀ -❀ ----------------------------------------------❀"
        puts "✦                                 ~❀ Please enter a number 1 to 14❀ ~                              ✦"
        puts "❀ ----------------------------------------------❀ -❀ ----------------------------------------------❀"
        puts ""
        Genre.clear_all
        genre_menu
        end 
    end 

    def titles_for(chosen_genre) #✓ 
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

    def the_comics(genre) #✓
        Scraper.scrape_titles(genre)
        @comics = Title.sort_alpha
    end 

    def give_comics #✓
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