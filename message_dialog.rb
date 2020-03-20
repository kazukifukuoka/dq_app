module MessageDialog
  def attack_message(**params)
    attack_type = params[:attack_type]
    puts "#{@name}の攻撃"
    puts "必殺攻撃" if attack_type == "special_attack"
  end

  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    puts <<~TEXT

    #{target.name}は#{damage}のダメージを受けた
    #{target.name}は#{damage}のダメージを受けた

    TEXT
  end

  def end_message(result)
    if result[:brave_win_flag]
      puts <<~TEXT

      勇者は勝った
      #{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した
      TEXT
    else
      puts <<~TEXT

      勇者は負けた
      目の前が真っ暗になった

      TEXT
    end
  end

  def transform_message(**params)
    origin_name = params[:origin_name]
    transform_name = params[:transform_name]
    puts <<~TEXT

    #{origin_name}は怒っている
    #{origin_name}は#{transform_name}に変身した

    TEXT
  end
end