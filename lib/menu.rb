require 'csv'

class Menu
  attr_reader :items

  def initialize(items = "./lib/menu.csv") 
    @items = []
    load_menu(items)
  end

  def load_menu(items)
    CSV.foreach(items) do |item|
      dish, price = item
      @items << { dish: dish, price: price.to_f }
    end
  end

  def to_s
    str = ""
    @items.each_with_index do |item, index| 
      str << "#{index + 1}. #{item[:dish]} - £#{'%.2f' % item[:price]}\n"
    end
    str
  end
end
