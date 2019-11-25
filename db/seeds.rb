puts "creating authors..."
authors = [
  Author.create(name: "Barack Obama"),
  Author.create(name: "Jim Rohn"),
  Author.create(name: "Brian Tracy"),
  Author.create(name: "Steve Jobs"),
  Author.create(name: "Cristiano Ronaldo"),
  Author.create(name: "Lionel Messi"),
  Author.create(name: "Albert Einstein"),
  Author.create(name: "Robert Kiyosaki"),
  Author.create(name: "Bill Gates"),
  Author.create(name: "Mohammad Ali")
]

puts "creating quotes..."

quotes = Quote.create([
  {
    content: "Change will not come if we wait for some other person or some other time. We are the ones we've been waiting for. We are the change that we seek.",
    author: authors[0]
  },
  {
    content: "The future rewards those who press on. I don't have time to feel sorry for myself. I don't have time to complain. I'm going to press on.",
    author: authors[0]
  },
  {
    content: "We proved that we are still a people capable of doing big things and tackling our biggest challenges.",
    author: authors[0]
  },
  {
    content: "Don’t wish it was easier, wish you were better. Don’t wish for less problems, wish for more skills. Don’t wish for less challenge, wish for more wisdom.",
    author: authors[1]
  },
  {
    content: "Days are expensive. When you spend a day you have one less day to spend. So make sure you spend each one wisely.",
    author: authors[1]
  },
  {
    content: "Happiness is not something you postpone for the future; it is something you design for the present.",
    author: authors[1]
  },
  {
    content: "It Doesn’t Matter Where You Came From. All That Matters Is Where You Are Going.",
    author: authors[2]
  },
  {
    content: "A Clear Vision, Backed By Definite Plans, Gives You A Tremendous Feeling Of Confidence And Personal Power.",
    author: authors[2]
  },
  {
    content: "People with clear, written goals, accomplish far more in a shorter period of time than people without them could ever imagine.",
    author: authors[2]
  },
  {
    content: "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma - which is living with the results of other people's thinking. Don't let the noise of others' opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.",
    author: authors[3]
  },
  {
    content: "My favorite things in life don't cost any money. It's really clear that the most precious resource we all have is time.",
    author: authors[3]
  },
  {
    content: "Be a yardstick of quality. Some people aren't used to an environment where excellence is expected.",
    author: authors[3]
  },
  {
    content: "I am not a perfectionist, but I like to feel that things are done well. More important than that, I feel an endless need to learn, to improve, to evolve, not only to please the coach and the fans, but also to feel satisfied with myself. It is my conviction that here are no limits to learning, and that it can never stop, no matter what our age.",
    author: authors[4]
  },
  {
    content: "I see football as an art and all players are artists. If you are a top artist, the last thing you would do is paint a picture somebody else has already painted.",
    author: authors[4]
  },
  {
    content: "If you think you’re perfect already, then you never will be.",
    author: authors[4]
  },
  {
    content: "Money is not a motivating factor…My motivation comes from playing the game I love. If I wasn’t paid to be a professional footballer, I would willingly play for nothing.",
    author: authors[5]
  },
  {
    content: "Every year I try to grow as a player and not get stuck in a rut. I try to improve my game in every way possible. But that trait is not something I’ve worked on, it’s part of me.",
    author: authors[5]
  },
  {
    content: "The best decisions aren’t made with your mind, but with your instinct.",
    author: authors[5]
  },
  {
    content: "I salute the man who is going through life always helpful, knowing no fear, and to whom aggressiveness and resentment are alien.",
    author: authors[6]
  },
  {
    content: "A calm and modest life brings more happiness than the pursuit of success combined with constant restlessness.",
    author: authors[6]
  },
  {
    content: "Life is like riding a bicycle. To keep your balance you must keep moving.",
    author: authors[6]
  },
  {
    content: "The size of your success is measured by the strength of your desire; the size of your dream; and how you handle disappointment along the way.",
    author: authors[7]
  },
  {
    content: "Academic qualifications are important and so is financial education. They're both important and schools are forgetting one of them.",
    author: authors[7]
  },
  {
    content: "A lot of people are afraid to tell the truth, to say no. That's where toughness comes into play. Toughness is not being a bully. It's having backbone.",
    author: authors[7]
  },
  {
    content: "Technology is just a tool. In terms of getting the kids working together and motivating them, the teacher is the most important.",
    author: authors[8]
  },
  {
    content: "Just in terms of allocation of time resources, religion is not very efficient. There's a lot more I could be doing on a Sunday morning.",
    author: authors[8]
  },
  {
    content: "It's fine to celebrate success but it is more important to heed the lessons of failure.",
    author: authors[8]
  },
  {
    content: "The fight is won or lost far away from witnesses - behind the lines, in the gym, and out there on the road, long before I dance under those lights.",
    author: authors[9]
  },
  {
    content: "It isn't the mountains ahead to climb that wear you out; it's the pebble in your shoe.",
    author: authors[9]
  },
  {
    content: "He who is not courageous enough to take risks will accomplish nothing in life.",
    author: authors[9]
  },
])

puts "done! :)"
