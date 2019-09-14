require 'pry'
module StudioGhibliFilms
  class CLI
      def start
        puts "Hi there! Welcome to the Studio Ghibli CLI."
        puts ""
        @input = nil
        menu
        while @input != "exit" && @input != "quit"
          @input = gets.strip
            if @input == "1"
              list_of_films
              puts ""
              puts "Please type the number of a film to read its description."
              film_description
            elsif @input == "2"
              list_of_films
              film_director_producer_and_release_date
            elsif @input == "menu"
              menu
            elsif @input == "exit" || @input == "quit"
              puts "Thanks for stopping by!"
              exit
            else
              puts "Oops, didn't catch that! Please type '1' for list of shows, '2' for film info or 'exit'."
            end
        end
      end

      def menu
        puts <<-MENU.gsub /^\s*/,''
        1. See list of films and their descriptions.
        2. See the director, producer and release date of films.
          Type 'exit' or 'quit' any time to leave the program.
          MENU
      end
  
      def list_of_films
        StudioGhibliFilms::Film.all.each.with_index(1) do |movie, index|
          puts "#{index}. #{movie.title}"
        end
      end 

      def rt_scores
        StudioGhibliFilms::Film.all.each.with_index(1) do |ranking, index|
          puts "#{index}. #{ranking.title} - #{ranking.rt_score}% fresh"
        end
      end  

      def film_description
        while @input != "exit" && @input != "quit"
            @input = gets.strip
            index = @input.to_i - 1
            if index.between?(0,19)
              puts StudioGhibliFilms::Film.all[index].title
              puts StudioGhibliFilms::Film.all[index].description
              puts "Which film would you like to know more about? (type 'list' to see the list again)."
              puts "Type 'menu' to return to the main menu or 'exit' to quit."
            elsif @input == "list"
              list_of_films
              puts ""
              puts "Please type the number of a film to read its description."
            elsif @input == "menu"
              menu
            elsif @input == "exit" || @input == "quit"
              puts "Thanks for stopping by!"
              exit
            else 
              puts "Uh-oh! Please type a film number, 'list', 'menu' or 'exit'."
          end
        end
      end

      def film_director_producer_and_release_date
        puts ""
        puts "Please select a film number to see the director, producer and release date."
        puts ""
        while @input != "exit" && @input != "quit"
          @input = gets.strip
          index = @input.to_i - 1
          if index.between?(0,19)
            puts StudioGhibliFilms::Film.all[index].title
            puts "Director: #{StudioGhibliFilms::Film.all[index].director}"
            puts "Producer: #{StudioGhibliFilms::Film.all[index].producer}"
            puts "Release Date: #{StudioGhibliFilms::Film.all[index].release_date}"
            puts ""
            puts "Which film would you like to know more about? (type 'list' to see the list again)."
            puts ""
            puts "Type 'menu' to return to the main menu or 'exit' to quit."
            puts ""
            puts "Would you like to see the Rotten Tomatoes scores for these films?  Press 'Y' to see the scores or 'N' to return to the menu."
          elsif @input == "list"
            list_of_films  
          elsif @input == "menu" || @input.downcase == "n"
            menu
          elsif @input.downcase == "y"
            rt_scores
          elsif @input == "exit" || @input == "quit"
            puts "Thanks for stopping by!"
            exit
          else
            puts "Not sure what you mean.  Please type 'list', 'menu' or 'exit'."
          end  
        end  
      end
    end    
end