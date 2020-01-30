require_relative("../db/sql_runner")
require_relative("movie")
require_relative("star")

class Casting

  attr_reader :id
  attr_accessor :fee, :movie_id, :star_id

  def initialize(options)
    @movie_id = options['movie_id'].to_i()
    @star_id = options['star_id'].to_i()
    @fee = options['fee'].to_i()
    @id = options['id'].to_i() if options['id']
  end

  def save()
    sql = "INSERT INTO castings
    (
      movie_id,
      star_id,
      fee
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run(sql, values).first()
    @id = casting['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM castings"
    casting_data = SqlRunner.run(sql)
    return Casting.map_items(casting_data)
  end

  def self.map_items(casting_data)
    results = casting_data.map { |casting| Casting.new(casting)}
    return results
  end
end
