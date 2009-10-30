require 'spec'
require 'potter'
describe Potter do
  before(:each) do

  end

  it "should calculate cost of empty cart" do
    Potter.cost([]).should == 0
  end

  it "should caluculate one book" do
    Potter.cost([:one]).should == 8
    Potter.cost([:two]).should == 8
    Potter.cost([:three]).should == 8
    Potter.cost([:four]).should == 8
    Potter.cost([:five]).should == 8
  end

  it "should discount two book purchase" do
    Potter.cost([:one, :two]).should == 16 - 16 * 0.05
  end

  it "should not discount two of the same book" do
    Potter.cost([:one, :one]).should == 16
  end

  it "should discount three different books" do
    Potter.cost([:one, :two, :three]).should == 24 - 24 * 0.10
    Potter.cost([:one, :one, :one]).should == 24
  end

  it "should discount four different books" do
    Potter.cost([:one, :two, :three, :four]).should == 32 - 32 * 0.20
    Potter.cost([:one, :one, :one, :one]).should == 32
  end

  it "should discount five different books" do
    Potter.cost([:one, :two, :three, :four, :five]).should == 40 - 40 * 0.25
    Potter.cost([:one, :one, :one, :one, :one]).should == 40
  end

  it "should group discounts" do
    Potter.cost([:one, :one, :two]).should == 8 + 16 * 0.95
  end

  it "should optimize discounts" do
    Potter.cost([:one, :one, :two, :two, :three, :three, :four, :five]).should == 51.20
  end


end