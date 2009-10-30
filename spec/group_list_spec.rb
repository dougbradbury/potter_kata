require 'spec'
require 'group_list'
describe GroupList do
  before(:each) do
    @list = GroupList.new
  end

  it "should not be able to add without any groups" do
    @list.place_book(:one).should == -1
  end

  it "should add new" do
    @list.add_new_for(:one)
    @list.total.should == 8
    @list.size.should == 1
  end

  it "should place book in existing group" do
    @list.add_new_for(:one)
    @list.place_book(:two, 0).should == 0
  end

  it "should place book in second group" do
    @list.add_new_for(:two)
    @list.add_new_for(:one)
    @list.size.should == 2
    @list.place_book(:two).should == 1
  end

  it "should place book starting from index" do
    @list.add_new_for(:one)
    @list.add_new_for(:one)
    @list.place_book(:two, 1).should == 1
    @list.place_book(:two).should == 0
  end

  it "should duplicate" do
    @list.add_new_for(:one).should == 0
    @list.add_new_for(:two).should == 1

    list2 = @list.dup

    @list.place_book(:one).should == 1
    list2.place_book(:one).should == 1
  end

  it "should add at the end" do
    @list.add_new_for(:one)
    @list.place_book(:two, 2).should == -1
  end

end