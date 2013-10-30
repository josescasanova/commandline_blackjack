# Built blackjack game w/out instructional video.
# Did use help from blackjack.rb though.

def card_total(cards)
  array = cards.map {|e| e[1]}
  total = 0
  array.each do |x|
    if x == "2"
      total = total + 2
    elsif x == "3"
      total = total + 3
    elsif x == "4"
      total = total + 4
    elsif x == "5"
      total = total + 5
    elsif x == "6"
      total = total + 6
    elsif x == "7"
      total = total + 7
    elsif x == "8"
      total = total + 8
    elsif x == "9"
      total = total + 9
    elsif x == "10"
      total = total + 10
    elsif x == "J"
      total = total + 10
    elsif x == "Q"
      total = total + 10
    elsif x == "K"
      total = total + 10
    else x == "A"
      total = total + 11
    end
  end

  array.select{|e| e == "A"}.count.times do
    if total > 21
      total -= 10 
    end
  end
  total
end

suits = ['H', 'D', 'C', 'S']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
deck =[]

suits.each do |suit|
	cards.each do |card|
		deck << [suit, card]
	end
end

deck = deck * 5
deck.shuffle!
deck.shuffle!

puts 'Welcome to BlackJack'

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = card_total(dealercards)
mytotal = card_total(mycards)

puts "The Dealer has #{dealercards} for a total of: #{dealertotal}"
puts "You have #{mycards} for a total of: #{mytotal}"
puts ''

if mytotal.to_i && dealertotal.to_i == 21
  puts "Tie! Game over"
  exit
end

while mytotal < 21
  puts "Would you like to 1) hit or 2) stay?"
  hit_or_stay = gets.chomp

  if hit_or_stay == "1"
    mycards << deck.pop
    mytotal = card_total(mycards)
    if mytotal > 21
      puts "You have #{mycards} for a total of: #{mytotal}"
      puts "You bust! Dealer wins!"
      exit
    end
    puts "You have #{mycards} for a total of: #{mytotal}"
    if mytotal == 21
      puts "You got blackjack!"
    end
  elsif hit_or_stay == "2"
    puts "You stayed, You have #{mycards} for a total of: #{mytotal}"
    break
  else 
    puts "You must enter 1 or 2."
  end
end

while dealertotal < 17 || dealertotal < mytotal
  puts "Dealer Hits"
  dealercards << deck.pop
  dealertotal = card_total(dealercards)
  if dealertotal > 21
    puts "Dealer has #{dealercards} for a total of: #{dealertotal}"
    puts "Dealer busts!, you win!"
    exit
  end
  puts "Dealer has #{dealercards} for a total of: #{dealertotal}"
end

if dealertotal > mytotal
  puts "Dealer wins!"
end

if mytotal > dealertotal
  puts "You win!"
end

if mytotal == dealertotal
  puts "You tie."
end

