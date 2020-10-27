class CurrencyConvert


def initialize

@amount=nil
@currency=nil
@to_euro= lambda{|amount| amount*0.85}
@to_aud= lambda{|amount| amount*1.4}
@to_cad= lambda{|amount| amount*1.32}
@to_rupee= lambda{|amount| amount*73.70}
@to_yuan= lambda{|amount| amount*6.71}
@to_ruble= lambda{|amount| amount*76.34}

end


def welcome
puts "welcome to simple currency converter"
sleep 1
puts "you can convert dollar amount to euro,australian dollar, canadian dollar, indian rupee,Chinese Yuan and Russian ruble"
end


def taking_input

puts "Please enter the amount you want to convert"
amount=gets.chomp

unless amount.empty?
@amount=amount.to_i
else
until !amount.empty? do
puts "Please enter an amount"
amount=gets.chomp
@amount=amount.to_i
end
end

puts "Please enter the currency name you want to covert your amount to"
currency=gets.chomp

unless currency.empty?
@currency=currency
else
until !currency.empty? do
puts "Please enter a valid currency"
currency=gets.chomp
@currency=currency.downcase
end
end
end

def conversion(amount,currency_lamda)
currency_lamda.call(amount) if amount.is_a?(Numeric)
end

def convert
case @currency
when "australian dollar"
puts "Your amount in australian dollar is #{conversion(@amount, @to_aud).round(2)}"
when "canadian dollar"
puts "Your amount in canadian dollar is #{conversion(@amount, @to_cad).round(2)}"
when "euro"
puts "Your amount in euro is #{conversion(@amount, @to_euro).round(2)}"
when "rupee"
puts "Your amount in indian rupee is #{conversion(@amount, @to_rupee).round(2)}"
when "yuan"
puts "Your amount in yuan is #{conversion(@amount, @to_yuan).round(2)}"
when "ruble"
puts "Your amount in ruble is #{conversion(@amount, @to_ruble).round(2)}"
else
  puts "Your amount can not be converted in the given currency because it doesnt exists in out application"
end

end


def start
welcome
taking_input
convert

end

end


convert= CurrencyConvert.new

convert.start
