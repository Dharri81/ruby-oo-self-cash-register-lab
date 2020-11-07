class CashRegister 
    attr_accessor :discount, :total
  
    def initialize(discount=0)
      @discount = discount 
      @total = 0
      @items = []
      @last_item = [] 
    end 
    
    def apply_discount
      if discount != 0 
        @total -= (@total * (@discount / 100.to_f))
        "After the discount, the total comes to $#{@total.to_i}."
      else 
        "There is no discount to apply."
      end 
    end 
    
    def add_item(title, price, quantity=1)
      @total += price * quantity 
      quantity.times do 
        @items << title 
      end 
      @last_item = price * quantity 
    end 
    
    def items 
      @items 
    end 
    
    def void_last_transaction 
       @items.delete_at(-1)
      self.total = self.total - @last_item
    end 
  end 
  
  list = CashRegister.new(20) #=>#<CashRegister:0x005616084063b0 @discount=20, @total=0>
  list.add_item("eggs", 1.50, 3) #=> 4.50
  list.add_item("skirt steak", 7.99) #=> 7.99 
  list.add_item("apple pie", 3.99, 2) #=> 7.98
  list.total #=> 20.47
  list.items #=> ["eggs", "eggs", "eggs", "skirt steak", "apple pie", "apple pie"]
  list.apply_discount #=> "After the discount, the total comes to $16."
  list.void_last_transaction
  list.items  #=> ["eggs", "eggs", "eggs", "skirt steak", "apple pie"]
  list.total #=> 8.02
  list #=> #<CashRegister:0x0055d3156eb598 @discount=20, @total=8.395999999999997, @items=["eggs", "eggs", "eggs", "skirt steak", "apple pie"], @last_item=7.98>