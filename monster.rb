require './character.rb'

class Monster < Character
  POWER_UP_RATE = 1.5
  CALC_HALF_HP = 0.5
  def initialize(**params)
    super(
      name: params[:name],
      hp: params[:hp],
      offense: params[:offense],
      defense: params[:defense]
    )

    @transform_flag = false
    @trigger_of_transform = params[:hp] * CALC_HALF_HP
  end

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
    attack_message
    damage = caluculate_damage(brave)
    cause_damage(target: brave, damage: damage)

    damage_message(target: brave, damage: damage)
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

    # puts <<~TEXT
    # #{@name}は怒っている
    # #{@name}は#{transform_name}に変身した
    # TEXT
    transform_message(origin_name: @name, transform_name: transform_name)

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
    # puts "#{target.name}は#{damage}のダメージを受けた"
  end
end