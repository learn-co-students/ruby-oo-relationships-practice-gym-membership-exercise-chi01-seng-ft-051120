class Lifter
  attr_reader :name, :lift_total
  attr_accessor
  @@all = []
  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all 
    @@all 
  end 

  def self.avg_lift
    all_lifts = all.map{|lifter| lifter.lift_total}
    total = all_lifts.count
    sum_all = all_lifts.sum
    (sum_all / total)
  end
  
  def memberships
    Membership.all.select {|membership| membership.lifter.name == self.name}
  end

  def gym_memberships
    self.memberships.map{|membership| membership.gym}
  end

  def self.avg_lift
    all_lifts = all.map{|lifter| lifter.lift_total}
    total = all_lifts.count
    sum_all = all_lifts.sum
    (sum_all / total)
  end

  def total_cost
    prices = memberships.map {|membership| membership.cost}
    prices.reduce(0) {|sum, n| sum + n}
  end

  def new_sign_up(gym, cost)
    Membership.new(cost, gym, self)
  end





end
