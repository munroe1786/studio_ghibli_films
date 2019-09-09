#puts "Hello from StudioGhibliFilms::CLI"
module StudioGhibliFilms
  class CLI
      def start
        puts "Hi there! Welcome to the Studio Ghibli CLI."
        @input = nil
        menu
        while @input != "exit" && @input != "quit"
          @input = gets.chomp
            if @input == "menu"
              menu
            elsif @input == "1"
              puts "Print list of films"
            elsif @input == "2"
              puts "Print list of species"
            end
        end
        puts "Thanks for stopping by!"
      end

      def menu
        puts <<-MENU
          1. Print list of films.
          2. Print list of species.
          3. Menu 
          type "exit" or "quit" any time to leave the program.
          MENU
      
      end

    
  end
  
   

end
