module UserRoundsHelper
  def total_kp
    @total_kp = 0
    @user_rounds.each do |round|
      @total_kp += round[:kp_won].to_i
    end
    @total_kp
  end 

  def get_course_details 
    @round = Round.find(params[:id])
    p @round 

  end 

  def total_holes 
    total_holes = 0
    @user_rounds.each do |round|
      total_holes += round[:holes_won].to_i
    end
    total_holes 
  end 

  def total_ld 
    total_ld = 0
    @user_rounds.each do |rounds|
      total_ld += rounds[:ld_won].to_i
    end
    return total_ld
  end 

  def total_splits 
    total_splits = 0
    @user_rounds.each do |rounds|
      total_splits += rounds[:splits].to_i
    end
    return total_splits
  end 

  def kp_payout(total_kp)
    round = Round.find(params[:id])
    @per_kp = round.bet_per_kp 
    num_users = @user_rounds.size 
    @kp_payouts = {}
    @all_kp_payouts = []
    @user_rounds.each do |user_round|
      kp_wins = user_round.kp_won
      kp_losses = total_kp - kp_wins.to_i
      @payout = (kp_wins.to_i * ((num_users.to_i - 1) * @per_kp.to_i)) - (kp_losses.to_i * @per_kp.to_i).to_i
      @all_kp_payouts << @payout
    end 
    @all_kp_payouts
  end

  def get_splits_pay
    num_users = @user_rounds.size
    @all_split_payout = []
    @user_rounds.each do |user_round|
      split_wins = user_round.splits 
      if num_users == 3
        split_losses = (total_splits / 2) - split_wins
        split_losses = split_losses * @per_hole
        @payout = split_wins * (@per_hole / 2) - split_losses
        @all_split_payout.push(@payout)
      elsif num_users == 4
        split_losses = total_splits / 2 - split_wins
        split_losses = split_losses * @per_hole
        @payout = (split_wins * @per_hole) - (split_losses) 
        @all_split_payout.push(@payout)
      else 
        @all_split_payout = 0
      end 
    end 
    @all_split_payout
  end 
  
  def hole_payout(total_holes)
    round = Round.find(params[:id])
    @per_hole = round.bet_per_hole 
    num_users = @user_rounds.size 
    @hole_payouts = {}
    @all_hole_payouts = []
    @user_rounds.each do |user_round|
      holes_won = user_round.holes_won
      holes_lost = total_holes.to_i - holes_won.to_i
      @payout = (holes_won.to_i * ((num_users - 1) * @per_hole.to_i )) - (holes_lost.to_i * @per_hole.to_i ).to_i
      @all_hole_payouts << @payout
    end 
    @all_hole_payouts
  end

  def ld_payout(total_ld)
    round = Round.find(params[:id])
    @per_ld = round.bet_per_ld 
    num_users = @user_rounds.size 
    @ld_payouts = {}
    @all_ld_payouts = []
    @user_rounds.each do |user_round|
      ld_wins = user_round.ld_won
      ld_losses = total_ld.to_i - ld_wins.to_i
      payout = (ld_wins.to_i * ((num_users - 1) * @per_ld.to_i)) - (ld_losses.to_i * @per_ld.to_i).to_i
      @all_ld_payouts << payout
    end 
    @all_ld_payouts
  end

  
end


  
   
  

  
 

  

 

