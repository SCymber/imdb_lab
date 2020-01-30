require_relative("../db/sql_runner")

class Star

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @id = options['id'].to_i() if options ['id']
  end

  def save()
    sql = "INSERT INTO stars
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    star = SqlRunner.run(sql, values).first()
    @id = star['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM stars"
    stars = SqlRunner.run(sql)
    return Star.map_items(stars)
  end

  def self.map_items(star_data)
    results = star_data.map { |star| Star.new(star)}
    return results
  end
end
