module StudioGhibliFilms
  class CLI
      def start
        puts "Hi there! Welcome to the Studio Ghibli CLI."
        @input = nil
        menu
        list_of_films
        while @input != "exit" && @input != "quit"
          @input = gets.chomp
            if @input == "1"
              puts "See list of films to learn more about"
            elsif @input == "2"
              puts "See release dates and Rotten Tomato rankings"
            end
        end
        puts "Thanks for stopping by!"
      end

      def menu
        puts <<-MENU
        1. "See list of films to learn more about"
        2. "See release dates and Rotten Tomato rankings"
          type "exit" or "quit" any time to leave the program.
          MENU
      end
    end

      def list_of_films
        Films.all.each.with_index(1) do |index, film|
          puts "#{index}. #{film.title}"
      end

      def film_choice
        while @input != "exit" && @input != "quit" 
          puts "Which film would you like to know more about? (type 'list' to see the list again)."
          puts "Type 'back to return to the main menu or 'exit' to quit."
        @ainput = gets.chomp
          #make sure it's valid input before doing this 
        index = @input.to_i - 1
        if index >= 0
          puts Films.all[index].description
        elsif @input == "list"
          list_of_films
        else 
          puts "Not sure what you mean.  Please type 'list' for list of shows or 'exit', 'quit' or 'back'."
        end
      end





  

      end
end
