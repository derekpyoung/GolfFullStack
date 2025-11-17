class UserRoundsController < ApplicationController
  before_action :set_user_round, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @user_round = UserRound.new
    @user_rounds = UserRound.all
    @rounds = Round.all
  end

  def current_round
    @user_rounds = UserRound.where(round_id: params[:id])
    @round = Round.find(params[:id])
  end

  def show
  end

  def new
    @user_round = UserRound.new
  end

  def create
    @user_round = UserRound.new(user_round_params)
    @user_round.user_id = current_user.id

    if @user_round.save
      flash[:success] = "Round entered successfully"
      redirect_to user_rounds_path
    else
      flash[:warning] = @user_round.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user_round.update(user_round_params)
      flash[:success] = "Round updated successfully"
      redirect_to @user_round
    else
      flash[:warning] = @user_round.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user_round.destroy
    flash[:success] = "Round deleted successfully"
    redirect_to user_rounds_path
  end

  private

  def set_user_round
    @user_round = UserRound.find(params[:id])
  end

  def user_round_params
    params.require(:user_round).permit(:round_id, :holes_won, :kp_won, :ld_won, :splits, :score)
  end

  def require_login
    unless current_user
      flash[:warning] = "You must be logged in"
      redirect_to login_path
    end
  end
end 

