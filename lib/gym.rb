class Gym
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  # Get a list of all gyms
  def self.all
    @@all
  end

  # Get a list of all memberships at 
  # a specific gym
  def memberships
    Membership.all.select {|m| m.gym == self}
  end

  # Get a list of all the lifters that have 
  # a membership to a specific gym
  def lifters
    memberships.map {|m| m.lifter}
  end

  # Get a list of the names of all lifters that 
  # have a membership to that gym
  def lifter_names
    lifters.map {|l| l.name}
  end

  # Get the combined lift total of every lifter 
  # has a membership to that gym
  def lifters_total
    total = 0
    lifters.each {|l| total += l.lift_total}
    total
  end
end
