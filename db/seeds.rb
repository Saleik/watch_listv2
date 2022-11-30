require 'open-uri'
require 'json'

Bookmark.delete_all
MovieType.delete_all
List.delete_all
Type.delete_all
Movie.delete_all

URL = 'https://tmdb.lewagon.com/movie/top_rated'.freeze

fetched_movies = URI.open(URL).read
movies = JSON.parse(fetched_movies)['results']

puts '****Add 20 movies....******'
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

puts '****Adding movie types name****'
type_list = ['thriller', 'sci-fi', 'romance', 'action', 'biopic', 'history', 'horror', 'dramatic', 'gangster', 'war', 'comedy']
type_list.each do |type|
  puts "Create new type => #{type}"
  new_type = Type.new(name: type)
  new_type.save!
end
puts 'All types added to DB!!'

puts '****Adding types to each movie****'
types = Type.all
movie_list = Movie.all
movie_list.each do |movie|
  rand(2..4).times do
    puts "add a type to #{movie.title}"
    movie_type = MovieType.new(
      type: types[rand(0..(types.size - 1))],
      movie: movie
    )
    movie_type.save!
  end
end
puts 'All movies have a type!!'
