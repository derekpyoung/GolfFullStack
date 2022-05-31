class UserRoundsController < ApplicationController

  def index 
    @user_round = UserRound.all 
    render template: "user_rounds/index"

  end

  def current_round 
    @user_rounds = UserRound.where(round_id: 1)
    p @user_rounds
  end 

 

  def show
    render json: 
       UserRound.find(params[:id])
  end

  def create
    name = params[:name]
    u = User.find_by(name: name)

    id = params[:round_id]
    r = Round.find_by(id: id)

    ur = UserRound.new
    ur.user_id = u.id 
    ur.round_id = r.id 
    ur.holes_won = params[:holes_won]
    ur.kp_won = params[:kp_won]
    ur.ld_won = params[:ld_won]
    ur.splits = params[:splits]
    ur.score = params[:score]
    ur.save
  end

  def destroy
    r = UserRound.find_by(id: params[:id])
    r.destroy
    render json: {
      message: "round destroyed"
    }
  end

  def update
    r = UserRound.find_by(id: params[:id])
    r.user_id = params[:user_id] || r.user_id
    r.round_id = params[:round_id] || r.round_id
    r.holes_won = params[:holes_won] || r.holes_won
    r.kp_won = params[:kp_won] || r.kp_won
    r.ld_won = params[:ld_won] || r.ld_won
    r.splits = params[:splits] || r.splits
    r.score = params[:score] || r.score
    r.save
    render json: r
  end

  private 



end
