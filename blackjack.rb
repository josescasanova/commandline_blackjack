## Blackjack game Steps
## 1. Ask player their name, save it.
## 2. Are you ready to play? Your initial bank roll is $X.
## 3. Place your bet
## 3.5. Define deck of cards method, shuffle.
# 4. Deal 4 random cards, two dealer + two gamer
# 5. Gamer goes first on hitting/staying
# 6. If 21, blackjack.. if over, bust
# 7. Dealer: if under 17, must hit
# 8. Compare dealer + gamer if they both staying
# 9. Declare winner, +/- bankroll
# 10. if bankroll 0 you lose
# 11. ask if you want to play again or exit

suits = ['H', 'D', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = []
suits.each do |suit|
  cards.each do |card|
    deck << [suit, card]
  end
end

deck = deck.shuffle

puts "Hey there, welcome to Blackhack! What is your name?"
name = gets.chomp.capitalize

puts "Hey #{name}, lets play some BlackJack. Your starting bankroll is $1,000. Place your bet:"
bet = gets.chomp
bankroll = 1000

puts "Ok #{name}, let's rock!"

# Deals out cards to dealer and #name


