# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating authors..."
authors = [
  Author.create(name: "Barack Obama"),
  Author.create(name: "Jim Rohn"),
  Author.create(name: "Brian Tracy"),
  Author.create(name: "Steve Jobs")
]

puts "creating quotes..."

Quote.create(
  content: "Change will not come if we wait for some other person or some other time. We are the ones we've been waiting for. We are the change that we seek.
  Read more at https://www.brainyquote.com/authors/barack-obama-quotes",
  author: authors.first
)
Quote.create(
  content: "The future rewards those who press on. I don't have time to feel sorry for myself. I don't have time to complain. I'm going to press on",
  author: authors.first
)

Quote.create(
  content: "Don’t wish it was easier, wish you were better. Don’t wish for less problems, wish for more skills. Don’t wish for less challenge, wish for more wisdom",
  author: authors.second
)
Quote.create(
  content: "Days are expensive. When you spend a day you have one less day to spend. So make sure you spend each one wisely",
  author: authors.second
)

Quote.create(
  content: "It Doesn’t Matter Where You Came From. All That Matters Is Where You Are Going",
  author: authors.third
)
Quote.create(
  content: "A Clear Vision, Backed By Definite Plans, Gives You A Tremendous Feeling Of Confidence And Personal Power",
  author: authors.third
)

Quote.create(
  content: "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma - which is living with the results of other people's thinking. Don't let the noise of others' opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.
  Read more at https://www.brainyquote.com/authors/steve-jobs-quotes",
  author: authors.last
)
Quote.create(
  content: "My favorite things in life don't cost any money. It's really clear that the most precious resource we all have is time.
  Read more at https://www.brainyquote.com/authors/steve-jobs-quotes",
  author: authors.last
)

puts "done! :)"
