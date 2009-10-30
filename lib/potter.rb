require 'group'
require 'group_list'
class Potter

  def self.cost(cart)
    groups = GroupList.new

    cart.each do |book|      
      groups = ways_to_add_to(book, groups).min do |a, b|
        a.total <=> b.total
      end

    end

    return groups.total
  end


  def self.ways_to_add_to(book, groups)
    added_at = 0
    possibilities = []

    while added_at != -1
      possibility = groups.dup
      added_at = possibility.place_book(book, added_at)
      if added_at == -1
        possibility.add_new_for(book)
      else
        added_at += 1
      end
      possibilities << possibility
    end
    return possibilities
  end


end