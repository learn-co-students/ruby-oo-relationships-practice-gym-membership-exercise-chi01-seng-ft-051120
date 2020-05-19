require 'pry'
class Gym
  attr_reader :name
  attr_accessor
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all 
  end

  def memberships
    Membership.all.select {|membership| membership.gym == self}
  end

  def members_list
    list_of_members = memberships.map {|membership| membership.lifter.name}
    list_of_members
  end

  def all_lift_total
      all_members = memberships.map{|membership| membership.lifter.lift_total}
      all_members.sum
  end

end
