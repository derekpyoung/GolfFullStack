class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  def index
    @round = Round.new
    @rounds = Round.all
  end

  def show
  end

  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params)
    if @round.save
      flash[:success] = "Round created successfully"
      redirect_to rounds_path
    else
      flash[:warning] = @round.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @round.update(round_params)
      flash[:success] = "Round updated successfully"
      redirect_to @round
    else
      flash[:warning] = @round.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @round.destroy
    flash[:success] = "Round deleted successfully"
    redirect_to rounds_path
  end

  private

  def set_round
    @round = Round.find(params[:id])
  end

  def round_params
    params.require(:round).permit(:course, :bet_per_hole, :bet_per_kp, :bet_per_ld)
  end
end
