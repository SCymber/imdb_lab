require_relative("../db/sql_runner")

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i() if options ['id']
  end

  def save()
    sql = "INSERT INTO movies
    (
      title,
      genre
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @genre]
    movie = SqlRunner.run(sql, values).first()
    @id = movie['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM movies"
    movies = SqlRunner.run(sql)
    return Movie.map_items(movies)
  end

  def self.map_items(movie_data)
    results = movie_data.map { |movie| Movie.new(movie)}
    return results
  end

end
