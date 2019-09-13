module StudioGhibliFilms
  class Film 
    attr_accessor :title, :description, :director, :producer, :release_date, :rt_score

    def self.all
      @@all ||= self.load
    end

    def self.load
      API.list_films.collect do |film_hash|
        Film.new(film_hash)
      end
    end

    def initialize(attributes = {})
      @title = attributes["title"]
      @description = attributes["description"]
      @director = attributes["director"]
      @producer = attributes["producer"]
      @release_date = attributes["release_date"]
      @rt_score = attributes["rt_score"]
    end
  
  end

end
