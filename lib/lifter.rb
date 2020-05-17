class Lifter
  attr_reader :name, :lift_total
  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  # - Get a list of all lifters
  def self.all
    @@all
  end

  # - Get a list of all the memberships that a specific lifter has
  def memberships
    Membership.all.select {|m| m.lifter == self}
  end

  # - Get a list of all the gyms that a specific lifter has memberships to
  def gyms
    memberships.map {|m| m.gym}
  end

  # - Get the average lift total of all lifters
  def self.average_lift
    lifts = self.all.map {|l| l.lift_total}
    lifts.sum / lifts.length
  end

  # - Get the total cost of a specific lifter's gym memberships
  def total_cost
    memberships.map{|m| m.cost}.sum
  end

  # Given a gym and a membership cost, 
  # sign a specific lifter up for a new gym
  def sign_up(gym, membership_cost)
    Membership.new(membership_cost, self, gym)
  end

end
