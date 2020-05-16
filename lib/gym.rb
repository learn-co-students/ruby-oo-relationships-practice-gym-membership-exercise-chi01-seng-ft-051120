class Gym
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all 
    @@all 
  end 

  def memberships 
    Membership.all.select do |membership|
      membership.gym == self 
    end 
  end 

  def lifters
    memberships.map do |membership|
      membership.lifter 
    end 
  end 

  def lifter_name 
    lifters.map do |lifter|
      lifter.name 
    end 
  end 

  def lift_total 
    lifts = lifters.map do |lifter| 
      lifter.lift_total 
    end 
    lifts.reduce(0) do |sum, lift|
      sum + lift
    end 
  end 
end
