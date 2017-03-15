class CreditCard

 def initialize(num)
   @num = num.to_s.split("").map{|x| x.to_i}
   if @num.length != 16
     raise ArgumentError.new ("The card Number most 16 digits long")
   end
 end

 def double
   @num_double = @num.each_with_index.map do |value, index|
     if (index+1).odd?
       value*2
     else
       value
     end
   end
 end

 def break
   self.double
   @num_double.map! {|x| x.to_s}
   @num_double.map! {|num| num.length >1? num.split("") : num}
   @num_double
 end

  def sum
    self.double
    self.break
    @num_sum = @num_double.flatten.reduce(:+)
  end

  def valid
    if @num_sum % 10 == 0
      true
    else
      false
    end
  end

 def check_card
   self.double
   self.sum
      sel.valid
 end

end

# 2. Solucion con Refactor



###### DRIVER CODE #########
