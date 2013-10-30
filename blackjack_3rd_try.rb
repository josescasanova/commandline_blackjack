# 3rd attempt at building blackjack game w/out instructional video
# used help from blackjack.rb

require 'pry'

def calculated_total(cards)
  card_array = cards.map { |e| e[1]}
  total = 0

  card_array.each do |x|
    if x == '2'
      total = total + 2
    elsif x == '3'
      total = total + 3
    elsif x == '4'
      total = total + 4
    elsif x == '5'
      total = total + 5
    elsif x == '6'
      total = total + 6
    elsif x == '7'
      total = total + 7
    elsif x == '8'
      total = total + 8
    elsif x == '9'
      total = total + 9
    elsif x == '10'
      total = total + 10
    elsif x == 'Q'
      total = total + 10
    elsif x == 'K'
      total = total + 10
    else x == 'A'
      total = total + 11
    end
  end
  card_array.select {|a| a == "A"}.count.times do
    if total > 21
      total = total - 10
    end
  end
  total
end

suits = ['H', 'D', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = []
suits.each do |suit|
  cards.each do |card|
    deck << [suit, card]
  end
end

deck = deck * 5
deck.shuffle!

puts '=> Welcome to BlackJack <='
puts ''

dealercards = []
mycards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculated_total(dealercards)
mytotal = calculated_total(mycards)

puts "Dealer has #{dealercards} for a total of #{dealertotal}"
puts "You have #{mycards} for a total of #{mytotal}"
puts ''
puts 'Would you like to 1) Hit or 2) Stay?'
hit_or_stay = gets.chomp

if hit_or_stay == '1'

elsif hit_or_stay == '2'
  
else
  puts 'You must pick 1 or 2.'
end













