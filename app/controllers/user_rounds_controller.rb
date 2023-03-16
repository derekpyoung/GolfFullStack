class UserRoundsController < ApplicationController
  def index 
    @user_round = UserRound.all
    @round = Round.all 
  end

  def current_round
    @user_rounds = UserRound.all.where(round_id: params[:id])
    @round = Round.where(id: params[:id])

  end 

  def show
    UserRound.find(params[:id])
  end

  def create
    flash.clear
    if current_user
      course = params[:round_id]
      course = Round.find_by(course: course)
      ur = UserRound.new
      ur.user_id = current_user.id 
      ur.round_id = params[:round_id] 
      ur.holes_won = params[:holes_won]
      ur.kp_won = params[:kp_won] 
      ur.ld_won = params[:ld_won] 
      ur.splits = params[:splits] 
      ur.score = params[:score] 
      if ur.save
        flash[:success] = "Round entered"
        redirect_to "/user_rounds"
      else 
        flash[:warning] = "Enter all details"
        redirect_to "/user_rounds"
      end 
    else 

      flash[:warning] = "You must be logged in"
      redirect_to '/login'
    end 
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
end 

