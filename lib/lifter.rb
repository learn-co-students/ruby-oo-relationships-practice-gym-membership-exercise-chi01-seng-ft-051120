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
    Membership.all.select {|membership| membership.lifter == self}
  end

  def gyms
    self.memberships.map {|membership| membership.gym}
  end

  def self.avg_lift_total
    all_totals = all.reduce(0) do |total_weight, lifter|
      total_weight += lifter.lift_total
    end
    all_totals.to_f / self.all.size
  end
  
  def total_cost
    self.memberships.sum {|membership| membership.cost}
  end

  def sign_up(cost, gym)
    Membership.new(cost, self, gym)
  end

end
