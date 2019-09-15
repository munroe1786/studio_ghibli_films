require 'pry'
module StudioGhibliFilms
  class CLI
      def start
        puts "Hi there! Welcome to the Studio Ghibli CLI."
        @input = nil
        menu
      end

      def menu
        puts <<~MENU
          1. See list of films and their descriptions. 
          2. See the director, producer and release date of films.
          Type 'exit' or 'quit' any time to leave the program.
        MENU
        while @input != "exit" && @input != "quit"
          @input = gets.strip
            if @input == "menu"
              menu
            elsif @input == "1"
              list_of_films
              film_description
            elsif @input == "2"
              list_of_films
              film_director_producer_and_release_date
             else
              puts "Oops, didn't catch that! Please type '1' for list of films, '2' for film info or 'exit'."
            end
        end
        puts "Thanks for stopping by!"
        exit
      end
  
      def list_of_films
        Film.all.each.with_index(1) do |movie, index|
          puts "#{index}. #{movie.title}"
        end
      end 

      def rt_scores
        Film.all.each.with_index(1) do |ranking, index|
          puts "#{index}. #{ranking.title} - #{ranking.rt_score}% fresh"
        end
      end  

      def film_description
        while @input != "exit" && @input != "quit" 
            @input = gets.strip
            index = @input.to_i - 1
            if index.between?(0,19)
              #binding.pry
              puts Film.all[index].title
              puts Film.all[index].description
              puts "Which film would you like to know more about? (type 'list' to see the list again)."
              puts "Type 'menu' to return to the main menu or 'exit' to quit."
            elsif @input == "menu"
              menu
            elsif @input == "list"
              list_of_films
            elsif @input == "exit" || @input == "quit"
              puts "Thanks for stopping by!"
              exit
            else
              puts "2 Uh-oh! Please type a film number, 'list', 'menu' or 'exit'."
          end
        end
      end

      def film_director_producer_and_release_date
        puts "Please select a film number to see the director, producer and release date."
        while @input != "exit" && @input != "quit"
          @input = gets.strip
          index = @input.to_i - 1
          if index.between?(0,19)
            puts Film.all[index].title
            puts "Director: #{Film.all[index].director}"
            puts "Producer: #{Film.all[index].producer}"
            puts "Release Date: #{Film.all[index].release_date}"
            puts "Which film would you like to know more about? (type 'list' to see the list again)."
            puts "Type 'menu' to return to the main menu or 'exit' to quit."
            puts "Would you like to see the Rotten Tomatoes scores for these films?  Press 'Y' to see the scores or 'N' to return to the menu."
          elsif @input == "list"
            list_of_films  
          elsif @input == "menu" 
            menu
          elsif @input.downcase == "n"
            menu
          elsif @input.downcase == "y"
            rt_scores
          else
            puts "3 Uh-oh! Please type a film number, 'list', 'menu' or 'exit'."
          end  
        end  
      end
    end 
end