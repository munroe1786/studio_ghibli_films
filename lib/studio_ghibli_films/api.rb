require 'open-uri'
require 'json'
require 'pry'

module StudioGhibliFilms
  class API
    #binding.pry
    def self.list_films
      json_string = open('https://ghibliapi.herokuapp.com/films').read
      JSON.parse(json_string)
    end
  end
end



