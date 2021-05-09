require 'pry'
require 'colorize'
module StudioGhibliFilms
  class CLI
      def start
        puts ""
        puts "Hi there! Welcome to the Studio Ghibli CLI.".colorize(:cyan).bold
        puts ""
        @input = nil
        menu
      end

      def menu
        puts <<~MENU
          Menu

          1. See the list of Studio Ghibli films and read the descriptions. 

          2. See more information about the films.

          Type 'exit' or 'quit' any time to leave the program.
        MENU
        while @input != "exit" && @input != "quit"
          @input = gets.strip
            if @input == "1" 
              puts ""
              list_of_films
              film_description
            elsif @input == "2"
              list_of_films
              film_director_producer_and_release_date
            else
              user_options
            end
        end
      end
  
      def list_of_films
        binding.pry
        Film.all.each.with_index(1) do |movie, index|
          puts "#{index}. #{movie.title}"
        end
      end 

      def rt_scores
        Film.all.each.with_index(1) do |ranking, index|
          puts "#{index}. #{ranking.title} - #{ranking.rt_score}% fresh"
        end
      end  

      def user_options
        if @input == "menu" || @input.downcase == "n"
          menu
        elsif @input == "list"
          list_of_films
          puts ""
          puts "Please type a film number to read the description.".colorize(:light_blue).bold
        elsif @input == "exit" || @input == "quit"
          puts "Thanks for stopping by!".colorize(:cyan).bold
          exit
        else
          puts "Oops! Please type a film number, 'list', 'menu' or 'exit'.".colorize(:magenta).bold
        end
      end

      def film_description
        puts ""
        puts "Please type a film number to read the description.".colorize(:light_blue).bold
        while @input != "exit" && @input != "quit" 
            @input = gets.strip
            index = @input.to_i - 1
            if index.between?(0,19)
              puts ""
              puts Film.all[index].title.colorize(:green).bold
              puts ""
              puts Film.all[index].description.colorize(:blue)
              puts ""
              puts "Please type a film number to read the description or 'list' to see the list again.".colorize(:cyan)
              puts ""
              puts "Type 'menu' to return to the main menu or 'exit' to quit."
            else
              user_options
            end
          end
        end
      end

      def film_director_producer_and_release_date
        puts ""
        puts "Please type a film number to see the director, producer and release date.".colorize(:blue).bold
        while @input != "exit" && @input != "quit"
          @input = gets.strip
          index = @input.to_i - 1
          if index.between?(0,19)
            puts ""
            puts Film.all[index].title.colorize(:green).bold
            puts ""
            puts "  Director: #{Film.all[index].director}".colorize(:light_blue)
            puts ""
            puts "  Producer: #{Film.all[index].producer}".colorize(:light_blue)
            puts ""
            puts "  Release Date: #{Film.all[index].release_date}".colorize(:light_blue)
            puts ""
            puts "Please type a film number or 'list', 'menu' or 'exit'."
            puts ""
            puts "Or would you like to see the Rotten Tomatoes scores for these films?  Type 'Y' to see the scores or 'N' to return to the menu.".colorize(:cyan).bold
          elsif @input == "list"
            list_of_films
            puts ""
            puts "Please type a film number to see the director, producer and release date.".colorize(:blue).bold
          elsif @input.downcase == "y"
            rt_scores
            puts ""
            puts "Type 'list' or 'menu' to go back or 'exit'".colorize(:blue).bold
          else
            user_options
          end  
        end  
      end
    end 
