class RoundsController < ApplicationController


  def index 
    @round = Round.all
  end 

  def create 
    r = Round.new 
    r.course = params[:course]
    r.bet_per_hole = params[:bet_per_hole]
    r.bet_per_kp = params[:bet_per_kp]
    r.bet_per_ld = params[:bet_per_ld]
    r.save 
    p r 
    redirect_to "/rounds"
  end 

end
