require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

apple = Startup.new('Apple', 'Steve Jobs', 'computers')
amazon = Startup.new('Amazon', 'Jeff Bezos', 'e-commerce')

emmeline = VentureCapitalist.new('Emmeline', 2000000000)
brad = VentureCapitalist.new('Brad', 20)

apple.sign_contract(emmeline, 'Angel', 200)
apple.sign_contract(emmeline, 'Angel', 10)
apple.sign_contract(brad, 'Angel', 10)
amazon.sign_contract(emmeline, 'Angel', 1)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

