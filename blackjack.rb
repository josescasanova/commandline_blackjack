## Blackjack game Steps
## 1. Ask player their name, save it.
## 2. Are you ready to play? Your initial bank roll is $X.
## 3. Place your bet
## 3.5. Define deck of cards method, shuffle.
## 4. Deal 4 random cards, two dealer + two gamer
# 5. Gamer goes first on hitting/staying
# 6. If 21, blackjack.. if over, bust
# 7. Dealer: if under 17, must hit
# 8. Compare dealer + gamer if they both staying
# 9. Declare winner, +/- bankroll
# 10. if bankroll 0 you lose
# 11. ask if you want to play again or exit

def calculate_total(cards)
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  # Correct for Aces
  arr.select{|e| e == "A"}.count.times do
    if total > 21
      total -= 10 
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

deck = deck.shuffle

puts "Welcome to BlackJack!"
# puts "Hey there, welcome to Blackhack! What is your name?"
# name = gets.chomp.capitalize

# puts "Hey #{name}, lets play some BlackJack. Your starting bankroll is $1,000. Place your bet:"
# bet = gets.chomp
# bankroll = 1000
# puts "#{name} is placing a bet of #{bankroll}."

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)

puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}."
puts "You have: #{mycards[0]} and #{mycards[1]}, for a total of #{mytotal}"
puts ""

if mytotal == 21
  puts "Congrats, you got BlackJack! You win!"
  exit
end

while mytotal < 21
  puts "What would you like to do? 1) hit 2) stay"
  hit_or_stay = gets.chomp

  if !['1', '2'].include?(hit_or_stay)
    puts "Error: you must enter 1 or 2."
    next
  end

  if hit_or_stay == "2"
    puts "You chose to stay."
    break
  end

  # Hit
  new_card = deck.pop
  puts "Dealing card to player: #{new_card}"
  mycards << new_card
  mytotal = calculate_total(mycards)
  puts "Your total is now: #{mytotal}"

  if mytotal == 21
    puts "Congrats, you hit BlackJack! You win!"
    exit
  elsif mytotal > 21
    puts "Sorry, looks like you busted!"
    exit
  end
end

if dealertotal == 21
  puts "Sorry, dealer hit blackjack. You lose."
  exit
end

while dealertotal < 17
  new_card = deck.pop
  puts "Dealing new car for dealer: #{new_card}"
  dealercards << new_card
  dealertotal = calculate_total(dealercards)
  puts "Dealer total is now: #{dealertotal}"

  if dealertotal == 21
    puts "Sorry, dealer hit BlackJack. You lose."
  elsif dealertotal > 21
    puts "Congrats, dealer busted! You win!"
    exit
  end
end

# Compare hands

puts "Dealer's cards:"
dealercards.each do  |card|
  puts "=> #{card}"
end
puts ""

puts "Your cards:"
mycards.each do |card|
  puts "=> #{card}"
end
puts ""

if dealertotal > mytotal
  puts "Sorry, dealer won."
elsif dealertotal < mytotal
  puts "Congrats, you win!"
else
  puts "It's a tie!"
end








