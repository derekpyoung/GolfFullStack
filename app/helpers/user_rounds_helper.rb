module UserRoundsHelper
  def get_players_in_round(users)
    p @current_round = users.where(round_id: 1)
    return @current_round
  end 
end
