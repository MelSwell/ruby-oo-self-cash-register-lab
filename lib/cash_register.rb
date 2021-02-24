require 'pry'

class CashRegister
  attr_accessor :discount, :total, :items, :last_transaction_price
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction_price = 0
  end

  def add_item(item_name, item_price, quantity = 1)
    self.total += item_price * quantity
    quantity.times do 
      @items << item_name
    end
    self.last_transaction_price = item_price * quantity
  end

  def apply_discount
    if self.discount > 0
      self.total -= (self.discount.to_f/100) * self.total
      "After the discount, the total comes to $#{self.total.to_int}."
    elsif self.discount == 0
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction_price
  end

end
