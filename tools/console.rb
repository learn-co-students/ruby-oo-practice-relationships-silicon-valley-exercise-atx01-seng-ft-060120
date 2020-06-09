require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

yeet = Startup.new("Yeet", "Sheezus", "Sports")
lol = Startup.new("LOL", "Emotican-my-man", "Memes")
egirl = Startup.new("EGIRL", "Neckbeards", "Premium Service")

monopoly = VentureCapitalist.new("Mr. Monopoly", 1000000000)
scrooge = VentureCapitalist.new("Scrooge McDuck", 99999999999999)
wayne = VentureCapitalist.new("Bruce Wayne", 9999999)

round1 = FundingRound.new(yeet, monopoly, "Angel", 99999)
round2 = FundingRound.new(lol, wayne, "Series A", 10000)
round3= FundingRound.new(egirl, scrooge, "Seed", 1000000)
round4 = FundingRound.new(egirl, wayne, "Series B", 3000000)
round5 = FundingRound.new(egirl, scrooge, "Series C", 1000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line