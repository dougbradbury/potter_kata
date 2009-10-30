class Group
  def initialize(starting_book)
    @books = [starting_book]
  end

  def can_add?(book)
    return !@books.include?(book)
  end

  def add(book)
    raise "Book already in this group" unless can_add?(book)
    @books << (book)
  end

  def remove(book)
    @books.delete(book)
  end

  def cost
    subtotal = @books.count * 8
    return subtotal * (1-discount)
  end

  def dup
    new_group = super
    new_group.instance_variable_set("@books", @books.dup)
    return new_group
  end

  private

  DISCOUNTS = {1 => 0.0, 2 => 0.05, 3 => 0.10, 4 => 0.20, 5 => 0.25}
  def discount
    return DISCOUNTS[@books.size]
  end


end