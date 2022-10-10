require 'open-uri'
require 'json'

URL = 'https://tmdb.lewagon.com/movie/top_rated'.freeze

fetched_movies = URI.open(URL).read
movies = JSON.parse(fetched_movies)['results']

puts 'Add 20 movies....'

movies.each do |movie|
  puts "Create #{movie['title']} movie"
  new_movie = Movie.new(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average'],
    year: movie['release_date'].split('-')[0]
  )
  puts 'Store it'
  new_movie.save!
end

puts '20 movies successfully added to DB!!'
