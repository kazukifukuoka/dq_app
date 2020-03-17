# require './brave.rb'
# require './monster.rb'

# brave = Brave.new(name: "勇者", hp: 500, offense: 150, defense: 100)
# monster = Monster.new(name: "モンスター", hp: 250, offense: 200, defense: 100)

# brave.status
# monster.status

# EXP_CONSTANT = 2
# GOLD_CONSTANT = 3
# loop do
#   brave.attack(monster)
#   break if monster.hp <= 0
#   monster.attack(brave)
#   break if brave.hp <= 0
# end

# battle_result = brave.hp > 0

# if battle_result
#   exp = (monster.offense + monster.defense) * EXP_CONSTANT
#   gold = (monster.offense + monster.defense) * GOLD_CONSTANT
#   puts "#{brave.name}はたたかいに勝った"
#   puts "#{exp}の経験値と#{gold}ゴールドを獲得した"
# else
#   puts "#{brave.name}はたたかいに負けた"
#   puts "目の前が真っ暗になった"
# end

class Game
  def janken
    puts "最初はグー、じゃんけん……"
    puts "[0]:グー\n[1]:チョキ\n[2]:パー"
    player_hand = gets.to_i
    program_hand = rand(3)
    jankens = ["グー", "チョキ", "パー"]
    puts "あなたの手:#{jankens[player_hand]}, プログラムの手:#{jankens[program_hand]}"
    if player_hand == program_hand
          next_game = true
      puts "あいこで"
      # じゃんけんを繰り返す
     while next_game do
       next_game = janken
     end
    elsif (program_hand - player_hand == 1 || program_hand - player_hand == -2 )
      puts "あなたの勝ちです"
      janken = false # 返り値を返す
    else
      puts "あなたの負けです"
      janken = false # 返り値を返す
    end
  end
end
Game.new.janken