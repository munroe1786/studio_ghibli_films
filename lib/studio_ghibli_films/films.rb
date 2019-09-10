module StudioGhibliFilms
  class Films 
    attr_accessor :title, :description, :director, :species, :release_year, :rotten_tomatoes_score

    @@all = [ ]

    def initialize
    
    end

    def self.all
      @@all 
    end
  
  end

end
