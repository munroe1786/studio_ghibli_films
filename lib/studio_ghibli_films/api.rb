require 'open-uri'
require 'json'

module StudioGhibliFilms
  class API
    def self.list_films
      doc = open('https://ghibliapi.herokuapp.com/films').read
      info = JSON.parse(doc)
    end
  end
end



