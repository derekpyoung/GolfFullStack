class RoundsController < ApplicationController


  def index 
    @round = Round.all
  end 

  def create 
    r = Round.new 
    r.course = params[:course] || ""
    r.bet_per_hole = params[:bet_per_hole] || 0
    r.bet_per_kp = params[:bet_per_kp] || 0
    r.bet_per_ld = params[:bet_per_ld] || 0 
  
    if r.save
      flash[:success] = "Round Created"
      redirect_to "/rounds"
    else 
      flash[:warning] = "Enter valid bets"
      redirect_to "/rounds"
    end 
  end 

end
