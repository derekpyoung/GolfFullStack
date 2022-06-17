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

  def rounds
    @rounds = Rounds.all 
    p @rounds
  end 

  def get_course(round)
    @course = round.course
  end 


  def holes_won_pay(rounds)
    @users = []
    @course = []
    @score = []
    @longest = []
    @closest = []
    @splits = []
    rounds.each do |round|
      round_id = round.round_id 
      @users.push(round.user.name)
      @course = round.round.course 
      @score.push(round.score)
      @longest.push(round.ld_won)
      @closest.push(round.kp_won)
      @splits.push(round.splits)
    
      round(round_id)
    end 
   
    player_one_holes = rounds[0].holes_won
    player_two_holes = rounds[1].holes_won
    player_three_holes = rounds[2].holes_won
    player_four_holes = rounds[3].holes_won




    total_holes = player_one_holes + player_two_holes + player_three_holes + player_four_holes 


    #splits---------------------------------------------------------------
    total_splits = @splits.sum 

    player_one_loss_split = total_splits - @splits[0]
    player_one_won_split = @splits[0]
    @player_one_split = (@splits[0] * @cur_round_bets.bet_per_hole) - ((total_splits / 2) - @splits[0]) * @cur_round_bets.bet_per_hole

    player_two_loss_split = total_splits - @splits[1]
    player_two_won_split = @splits[1]
    @player_two_split = (@splits[1] * @cur_round_bets.bet_per_hole) - ((total_splits / 2) - @splits[1]) * @cur_round_bets.bet_per_hole

    player_three_loss_split = total_splits - @splits[2]
    player_three_won_split = @splits[2]
    @player_three_split = (@splits[2] * @cur_round_bets.bet_per_hole) - ((total_splits / 2) - @splits[2]) * @cur_round_bets.bet_per_hole

    player_four_loss_split = total_splits - @splits[3]
    player_four_won_split = @splits[3]
    @player_four_split = (@splits[3] * @cur_round_bets.bet_per_hole) - ((total_splits / 2) - @splits[3]) * @cur_round_bets.bet_per_hole

    p @player_one_split
    p @player_two_split
    p @player_three_split
    p @player_four_split
    #closest--------------------------------------------------------------

    total_closest = @closest.sum 

    player_one_loss_kp =  ( @closest[0] - total_closest)  * @cur_round_bets.bet_per_kp
    player_one_win_kp =  (@closest[0] * @cur_round_bets.bet_per_kp) * (rounds.count - 1)
    @player_one_kp_total = player_one_loss_kp + player_one_win_kp

    player_two_loss_kp =  ( @closest[1] - total_closest)  * @cur_round_bets.bet_per_kp
    player_two_win_kp =  (@closest[1] * @cur_round_bets.bet_per_kp) * (rounds.count - 1)
    @player_two_kp_total = player_two_loss_kp + player_two_win_kp

    player_three_loss_kp =  (  @closest[2] - total_closest)  * @cur_round_bets.bet_per_kp
    player_three_win_kp =  (@closest[2] * @cur_round_bets.bet_per_kp) * (rounds.count - 1)
    @player_three_kp_total = player_three_loss_kp + player_three_win_kp

    player_four_loss_kp =  ( @closest[3] - total_closest)  * @cur_round_bets.bet_per_kp
    player_four_win_kp =  (@closest[3] * @cur_round_bets.bet_per_kp) * (rounds.count - 1)
    @player_four_kp_total = player_four_loss_kp + player_four_win_kp


    #longest----------------------------------------------------------------
    total_longest = @longest.sum 
 

    player_one_loss_ld =  ( @longest[0] - total_longest)  * @cur_round_bets.bet_per_ld
    player_one_win_ld =  (@longest[0] * @cur_round_bets.bet_per_ld) * (rounds.count - 1)
    @player_one_ld_total = player_one_loss_ld + player_one_win_ld

    player_two_loss_ld =  ( @longest[1] - total_longest)  * @cur_round_bets.bet_per_ld
    player_two_win_ld =  (@longest[1] * @cur_round_bets.bet_per_ld) * (rounds.count - 1)
    @player_two_ld_total = player_two_loss_ld + player_two_win_ld

    player_three_loss_ld =  ( @longest[2] - total_longest)  * @cur_round_bets.bet_per_ld
    player_three_win_ld =  (@longest[2] * @cur_round_bets.bet_per_ld) * (rounds.count - 1)
    @player_three_ld_total = player_three_loss_ld + player_three_win_ld

    player_four_loss_ld =  ( @longest[3] - total_longest)  * @cur_round_bets.bet_per_ld
    player_four_win_ld =  (@longest[3] * @cur_round_bets.bet_per_ld) * (rounds.count - 1)
    @player_four_ld_total = player_four_loss_ld + player_four_win_ld
    
    
    

    #holes won---------------------------------------------------------------
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

    @player_win_loss[:player_one][:score] = @score[0]
    @player_win_loss[:player_two][:score] = @score[1]
    @player_win_loss[:player_three][:score] = @score[2]
    @player_win_loss[:player_four][:score] = @score[3]

    @player_win_loss[:player_one][:longest] = @player_one_ld_total
    @player_win_loss[:player_two][:longest] = @player_two_ld_total
    @player_win_loss[:player_three][:longest] =  @player_three_ld_total
    @player_win_loss[:player_four][:longest] =  @player_four_ld_total

    @player_win_loss[:player_one][:closest] = @player_one_kp_total
    @player_win_loss[:player_two][:closest] = @player_two_kp_total
    @player_win_loss[:player_three][:closest] =  @player_three_kp_total
    @player_win_loss[:player_four][:closest] =  @player_four_kp_total

    @player_win_loss[:player_one][:splits] = @player_one_split
    @player_win_loss[:player_two][:splits] = @player_two_split
    @player_win_loss[:player_three][:splits] = @player_three_split
    @player_win_loss[:player_four][:splits] = @player_four_split
    

    @player_win_loss[:player_one][:total] = @player_one_kp_total + @player_one_ld_total + @player_one_holes_final + @player_one_split
    @player_win_loss[:player_two][:total] = @player_two_kp_total + @player_two_holes_final + @player_two_ld_total + @player_two_split
    @player_win_loss[:player_three][:total] =  @player_three_kp_total + @player_three_holes_final + @player_three_ld_total + @player_three_split
    @player_win_loss[:player_four][:total] =  @player_four_kp_total + @player_four_ld_total + @player_four_holes_final + @player_four_split

    

  
    
     @player_win_loss
  
  end 
  
  def round(round_id)
    @cur_round_bets = Round.find_by(id: round_id)
  end 

  

 
end
