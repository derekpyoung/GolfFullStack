module UserRoundsHelper

  def get_players_in_round(users)
     @current_round = users.where(round_id: 1)
    p @current_round
    return @current_round
  end 

  def get_round_ids(rounds)
    rounds_arr = []
    rounds.each do |round|
      rounds_arr.push(round.round_id)
    end 
    @round_ids = rounds_arr.uniq()
  end 

  def holes_won_pay(rounds)
    @users = []
    @course = []
    rounds.each do |round|
      round_id = round.round_id 
      @users.push(round.user.name)
      @course = round.round.course 
      # @score.push(round.round.score)
      p round.score
      round(round_id)
    end 
    p @users
    player_one_holes = rounds[0].holes_won
    player_two_holes = rounds[1].holes_won
    player_three_holes = rounds[2].holes_won
    player_four_holes = rounds[3].holes_won

    total_holes = player_one_holes + player_two_holes + player_three_holes + player_four_holes 

    player_one_lost_holes =  player_one_holes - total_holes
    player_one_wins_amount = (player_one_holes * @cur_round_bets.bet_per_hole) * (rounds.count - 1)
    player_one_loss_amount = player_one_lost_holes * @cur_round_bets.bet_per_hole
    @player_one_holes_final = player_one_wins_amount + player_one_loss_amount

    player_two_lost_holes =  player_two_holes - total_holes
    player_two_win_amount = (player_two_holes * @cur_round_bets.bet_per_hole) * (rounds.count - 1)
    player_two_loss_amount = player_two_lost_holes * @cur_round_bets.bet_per_hole
    @player_two_holes_final = player_two_win_amount + player_two_loss_amount
    
    player_three_lost_holes =  player_three_holes - total_holes
    player_three_win_amount = (player_three_holes * @cur_round_bets.bet_per_hole) * (rounds.count - 1)
    player_three_loss_amount = player_three_lost_holes * @cur_round_bets.bet_per_hole
    @player_three_holes_final = player_three_win_amount + player_three_loss_amount

    player_four_lost_holes =  player_four_holes - total_holes
    player_four_win_amount = (player_four_holes * @cur_round_bets.bet_per_hole) * (rounds.count - 1)
    player_four_loss_amount = player_four_lost_holes * @cur_round_bets.bet_per_hole
    @player_four_holes_final = player_four_win_amount + player_four_loss_amount



    @player_one_holes_total_payout = player_one_lost_holes * @cur_round_bets.bet_per_hole
    @player_one_holes_total_payout

    @player_two_holes_total_payout = player_two_lost_holes * @cur_round_bets.bet_per_hole
    @player_two_holes_total_payout

    @player_three_holes_total_payout = player_three_lost_holes * @cur_round_bets.bet_per_hole
    @player_three_holes_total_payout

    @player_four_holes_total_payout = player_four_lost_holes * @cur_round_bets.bet_per_hole
    @player_four_holes_total_payout


    @player_win_loss = Hash.new { |h, k| h[k] = h.dup.clear }
    @player_win_loss[:player_one][:holes_won] = @player_one_holes_final
    @player_win_loss[:player_two][:holes_won] = @player_two_holes_final
    @player_win_loss[:player_three][:holes_won] = @player_three_holes_final
    @player_win_loss[:player_four][:holes_won] = @player_four_holes_final

    @player_win_loss[:player_one][:name] = @users[0]
    @player_win_loss[:player_two][:name] = @users[1]
    @player_win_loss[:player_three][:name] = @users[2]
    @player_win_loss[:player_four][:name] = @users[3]

    @player_win_loss[:player_one][:course] = @course
    @player_win_loss[:player_two][:course] = @course
    @player_win_loss[:player_three][:course] = @course
    @player_win_loss[:player_four][:course] = @course

    # @player_win_loss[:player_one][:score] = @score[0]
    # @player_win_loss[:player_two][:score] = @score[1]
    # @player_win_loss[:player_three][:score] = @score[2]
    # @player_win_loss[:player_four][:score] = @score[3]

  

    p @player_win_loss

  end 
  
  def round(round_id)
    @cur_round_bets = Round.find_by(id: round_id)
  end 

  

 
end
