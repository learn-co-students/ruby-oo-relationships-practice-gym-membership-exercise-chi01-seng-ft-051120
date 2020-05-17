# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

golds = Gym.new("Gold's Gym")
dieter = Lifter.new("Dieter", 100)
golds_memb = Membership.new(60, dieter, golds)

hometown = Gym.new("Hometown Gym")
binding.pry

puts "Gains!"
