# initial try, used instructional solutions video in a big way

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

deck = deck * 5
deck = deck.shuffle
deck = deck.shuffle

puts "Welcome to BlackJack! What is your name?"
name = gets.chomp.capitalize
puts "Hey #{name}, lets play some BlackJack. Your starting bankroll is $1,000."
bankroll = 1000
game_over = false
puts ""

while true
  puts "Bankroll: #{bankroll}"
  puts "How much would you like to bet?"
  bet = gets.chomp
  bet = bet.to_i
  puts ""

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
  puts "Congrats #{name}, you got BlackJack! You win #{bet}!"
  bankroll = bankroll + bet
  puts bankroll
  game_over = true
  next
end

while mytotal < 21
  puts "What would you like to do, #{name}? 1) hit 2) stay"
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
  puts "Dealing card to #{name}: #{new_card}"
  mycards << new_card
  mytotal = calculate_total(mycards)
  puts "Your total is now: #{mytotal}"

  if mytotal == 21
    puts "Congrats #{name}, you hit BlackJack! You win #{bet}!"
    bankroll = bankroll + bet
    puts bankroll
    game_over = true
    next
  elsif mytotal > 21
    puts "Sorry #{name}, looks like you busted! You lost #{bet}."
    bankroll = bankroll - bet
    puts bankroll
    game_over = true
    next
  end
end

if dealertotal == 21
  puts "Sorry, dealer hit blackjack. You lost #{bet}."
  bankroll = bankroll - bet
  puts bankroll
  game_over = true
  next
end

while dealertotal < 17
  new_card = deck.pop
  puts "Dealing new card for dealer: #{new_card}"
  dealercards << new_card
  dealertotal = calculate_total(dealercards)
  puts "Dealer total is now: #{dealertotal}"

  if dealertotal == 21
    puts "Sorry #{name}, dealer hit BlackJack. You lost #{bet}"
    bankroll = bankroll - bet
    puts bankroll
  elsif dealertotal > 21
    puts "Congrats #{name}, dealer busted! You win #{bet}!"
    bankroll = bankroll + bet
    puts bankroll
    game_over = true
    
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

if game_over == false
  if dealertotal > mytotal
    puts "Sorry #{name}, dealer won. You lost #{bet}"
    bankroll = bankroll - bet
    puts bankroll
  elsif dealertotal < mytotal
    puts "Congrats #{name}, you win #{bet}!"
    bankroll = bankroll + bet
    puts bankroll
  else
    puts "It's a tie!"
  end
end

# Play again?
puts "Would you like to play again?."
play_again = gets.chomp.downcase

if !['yes', 'no'].include?(play_again)
  puts "Error: you must enter yes or no"
  next
end

if play_again == "yes"
  game_over = false
  next
else play_again == "no"
  exit
end
end


