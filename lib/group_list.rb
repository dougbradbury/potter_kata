require 'group'

class GroupList
  def initialize
    @groups = []
  end

  def total
    @groups.inject(0) do |sum, group|
      sum + group.cost
    end
  end

  def size
    return @groups.size
  end

  def dup
    new_list = GroupList.new
    @groups.each do |group|
      new_list.instance_eval { @groups << group.dup }
    end
    return new_list
  end

  def place_book(book, starting_at = 0)
    sub_list = @groups[starting_at .. -1]
    return -1 if sub_list.nil?
    sub_list.each_with_index do |group, index|
      if group.can_add?(book)
        group.add(book)
        return index + starting_at
      end
    end
    return -1
  end

  def add_new_for(book)
    @groups << Group.new(book)
    return @groups.size - 1
  end

end

