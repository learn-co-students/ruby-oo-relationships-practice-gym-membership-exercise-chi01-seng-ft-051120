class Membership
  attr_reader :cost, :lifter, :gym

  @@all = []

  def initialize(gym, lifter, cost)
    @gym = gym 
    @lifter = lifter
    @cost = cost
    @@all << self 
  end

  def self.all 
    @@all 
  end 
end
