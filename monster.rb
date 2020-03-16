require './character.rb'

class Monster < Character
  POWER_UP_RATE = 1.5

  def status
    puts <<~TEXT
    #{@name}
      体力：#{@hp}
      攻撃力：#{@offense}
      守備力：#{@defense}
    TEXT
  end

  def attack(brave)

    monster_type = decision_transform
    puts "#{@name}の攻撃"
    damage = caluculate_damage(brave)
    cause_damage(target: brave, damage: damage)

    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  private
  def decision_transform
    if @hp <= @trigger_of_transform && @transform_flag == false
      @transform_flag = true
      transform
      "power_up_type"
    else
      "previous_power_up_type"
    end
  end

  def transform
    transform_name = "ドラゴン"

    puts <<~TEXT
    #{@name}は怒っている
    #{@name}は#{transform_name}に変身した
    TEXT

    @offense *= POWER_UP_RATE
    @name = transform_name
  end

  def caluculate_damage(target)
    @offense - target.defense
  end

  def cause_damage(**params)
    damage = params[:damage]
    target = params[:target]

    target.hp -= damage
    target.hp = 0 if target.hp < 0
    puts "#{target.name}は#{damage}のダメージを受けた"
  end
end