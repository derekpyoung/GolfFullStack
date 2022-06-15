module UsersHelper

  def holes_total
    @user = User.find_by(id: params[:id])
    @holes_total = @user.user_rounds.holes_total

  end 

  def kp_total

  end 

  def ld_total

  end 

  def split_total

  end 

  def score_total

  end 
end
