class Lifter
  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all 
    @@all 
  end 

  def memberships
    Membership.all.select do |membership|
      membership.lifter == self 
    end 
  end 

  def gyms 
    memberships.map do |membership|
      membership.gym 
    end 
  end 

  def self.average_lift
    lifts = self.all.map do |lifter|
      lifter.lift_total 
    end 
    lift_total = lifts.reduce(0) do |sum, lift|
      sum + lift 
    end 
    lift_total / self.all.count
  end 

  def total_cost 
    costs = memberships.map do |membership|
      membership.cost 
    end 
    costs.reduce(0) do |sum, cost|
      sum + cost 
    end 
  end 

  def new_gym(name, cost)
    new_gym = Gym.new(name)
    Membership.new(new_gym, self, cost)
  end  

end
