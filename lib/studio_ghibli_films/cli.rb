require 'pry'
module StudioGhibliFilms
  class CLI
      def start
        puts "Hi there! Welcome to the Studio Ghibli CLI."
        @input = nil
        menu
        while @input != "exit" && @input != "quit"
          @input = gets.strip
            if @input == "1"
              list_of_films
              film_description
            elsif @input == "2"
              puts "See release dates and Rotten Tomato rankings"
            end
        end
        puts "Thanks for stopping by!"
      end

      def menu
        puts <<-MENU
        1. See list of films to learn more about
        2. See release dates and Rotten Tomato rankings
          Type 'exit' or 'quit' any time to leave the program.
          MENU
      end
  

      def list_of_films
        #binding.pry
        puts "Please enter the number of a film to read its description."
        StudioGhibliFilms::Film.all.each.with_index(1) do |movie, index|
          puts "#{index}. #{movie.title}"
        end
      end  

      def film_description
        #@input = gets.strip
        #until @input.to_i.between?(1,20) || @input == "exit" 
          #puts "I'm not sure what you meant. Please type 'list' for list of films or 'exit', 'back' for the menu or 'exit'."
          #@input = gets.strip
        #end
        #puts "Please enter the number of a film to read its description."
        while @input != "exit" && @input != "quit"
            @input = gets.strip
            index = @input.to_i - 1
            if index.between?(0,19)
              puts StudioGhibliFilms::Film.all[index].description
              puts "Which film would you like to know more about? (type 'list' to see the list again)."
              puts "Type 'menu' to return to the main menu or 'exit' to quit."
            elsif @input == "list"
              list_of_films
            elsif @input == "menu"
              menu
            else 
              puts "Not sure what you mean.  Please type 'list' for list of shows, 'menu' or 'exit'."
          end
        end
      end
    end    
end