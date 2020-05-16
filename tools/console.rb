# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

gym_a = Gym.new("Gold's Gym")
gym_b = Gym.new("24hour Fitness")
gym_c = Gym.new("Local Gym")

john = Lifter.new("John", 300)
greg = Lifter.new("Greg", 50)
tim = Lifter.new("Greg", 200)

membership_a = Membership.new(99, john, gym_a)
membership_ab = Membership.new(25, john, gym_b)
membership_b = Membership.new(25, greg, gym_b)
membership_c = Membership.new(5, tim, gym_c)


binding.pry

puts "Gains!"
