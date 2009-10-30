require 'spec'
require 'group'
describe Group do
  before(:each) do

  end

  it "should create a group" do
    group = Group.new(:one)
  end

  it "should add a book" do
    group = Group.new(:one)
    group.can_add?(:two).should == true
    group.add(:two)
  end

  it "should not allow adding a duplicate" do
    group = Group.new(:one)
    group.can_add?(:one).should == false
    lambda {group.add(:one)}.should raise_error
  end

  it "should calculate the cost of a group" do
    group = Group.new(:one)
    group.cost.should == 8
    group.add(:two)
    group.cost.should == 16 * 0.95
    group.add(:four)
    group.cost.should == 24 * 0.90
    group.add(:three)
    group.cost.should == 32 * 0.80
    group.add(:five)
    group.cost.should == 30.0
  end

  it "should remove a book" do
    group = Group.new(:one)
    group.add(:two)
    group.remove(:one)
    group.cost.should == 8
    group.can_add?(:one).should == true
  end

  it "should duplicate" do
    group = Group.new(:two)
    group.add(:three)

    new_group = group.dup
    group.add(:one)
    new_group.can_add?(:one).should == true
  end

end
