
require 'rest-client'
require 'json'
require 'pry'
require "pry-awesome_print"


def get_character_movies_from_api(_character)
  # make the web request

  all_characters_json = RestClient.get('http://www.swapi.co/api/people/')
  people_api_result = JSON.parse(all_characters_json)
  all_characters = people_api_result['results']
    all_characters.each do |character|
      if character['name'].downcase == _character
        return get_character_films_hash(character)
      end
    end
    puts "Sorry, that is not a valid character."





  # iterate over the character hash to find the collection of `films` for the given
  #   `character`

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def get_character_films_hash(character)
  character['films'].each.with_index(1) do |film_uri, index|
    film_json = RestClient.get(film_uri)
    film_hash = JSON.parse(film_json)
    puts "#{index}. #{film_hash['title']}"
  end
end


# def character_films(character)
#   films = character_hash['films']
# end
#
# def parse_character_movies(films_hash)
#   # some iteration magic and puts out the movies in a nice list
# end

def show_character_movies(character)
  get_character_movies_from_api(character)
  # parse_character_movies(films_hash)
end

# BONUS

## that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
### can you split it up into helper methods?
