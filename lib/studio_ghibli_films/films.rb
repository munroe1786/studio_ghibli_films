module StudioGhibliFilms
  class Films 
    attr_accessor :title, :description, :director, :release_year, :rotten_tomatoes_score

    @@all = [ ]

    def self.all
      @@all ||= self.load
    end

    def self.load
      API.list_films.collect do |show_hash|
        Films.new(show_hash)
      end
    end

    def initialize(attributes = {})
      @title = attributes["title"]
      @description = attributes["description"]
      @director = attributes["director"]
      @release_year = attributes["release_year"]
      @rotten_tomatoes_score = attributes["rotten_tomatoes_score"]
    end
  
  end

end
