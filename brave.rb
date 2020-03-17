require './character.rb'

class Brave < Character
  SPECIAL_ATTACK_CONST = 1.5

  def status
    puts <<~TEXT
    #{@name}
      体力：#{@hp}
      攻撃力：#{@offense}
      守備力：#{@defense}
    TEXT
  end

  def attack(monster)
    # puts "#{@name}の攻撃"

    attack_type = decision_attack_type
    damage = calculate_damage(target: monster, attack_type: attack_type)
    cause_damage(target: monster, damage: damage)

    attack_message(attack_type: attack_type)
    damage_message(target: monster, damage: damage)
  end

  private

    def decision_attack_type
      attack_num = rand(4)

      if attack_num == 0
        # puts "必殺攻撃"
        "special_attack"
      else
        # puts "通常攻撃"
        "normal_attack"
      end
    end

    def calculate_damage(**params)
      target = params[:target]
      attack_type = params[:attack_type]

      if attack_type == "special_attack"
        calculate_special_attack - target.defense
      else
        @offense - target.defense
      end
    end

    def cause_damage(**params)
      damage = params[:damage]
      target = params[:target]

      target.hp -= damage
      target.hp = 0 if target.hp < 0
      # puts "#{target.name}は#{damage}のダメージを受けた"
    end

    def calculate_special_attack
      @offense * SPECIAL_ATTACK_CONST
    end
end