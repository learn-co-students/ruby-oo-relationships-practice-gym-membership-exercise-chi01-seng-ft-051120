# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

ben = Lifter.new("Ben", 200)
jimmy = Lifter.new("Jimmy", 600)
golds = Gym.new("Golds")
planet_fitness = Gym.new("Planet Fitness")
golds_membership = Membership.new(50, golds, ben)
new_golds_membership = Membership.new(100, golds, jimmy)
pf_memb_1 = Membership.new(200, planet_fitness, jimmy)



binding.pry

puts "Gains!"
