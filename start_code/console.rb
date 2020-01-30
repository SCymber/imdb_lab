require_relative('models/movie')
require_relative('models/star')
require_relative('models/casting')

require('pry-byebug')

# Casting.delete_all()
# Star.delete_all()
# Movie.delete_all()

star1 = Star.new({
  'first_name' => 'Will',
  'last_name' => 'Smith'
})
star1.save()

star2 = Star.new({
  'first_name' => 'Matt',
  'last_name' => 'Damon'
})
star2.save()

star3 = Star.new({
  'first_name' => 'Martin',
  'last_name' => 'Lawrence'
})
star3.save()


movie1 = Movie.new({
  'title' => 'Bad Boys',
  'genre' => 'Action'
  })
movie1.save()

movie2 = Movie.new({
  'title' => 'Martian',
  'genre' => 'Sci-Fi'
  })
movie2.save()

movie3 = Movie.new({
  'title' => 'Blue Streak',
  'genre' => 'Action'
  })
movie3.save()


casting1 = Casting.new({
  'movie_id' => movie1.id,
  'star_id' => star1.id,
  'fee' => 300000
  })
casting1.save()

casting2 = Casting.new({
  'movie_id' => movie1.id,
  'star_id' => star3.id,
  'fee' => 200000
  })
casting2.save()

casting3 = Casting.new({
  'movie_id' => movie3.id,
  'star_id' => star3.id,
  'fee' => 100000
  })
casting3.save()

casting4 = Casting.new({
  'movie_id' => movie2.id,
  'star_id' => star2.id,
  'fee' => 250000
  })
casting4.save()


binding.pry
nil
