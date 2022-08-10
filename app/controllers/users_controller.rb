class UsersController < ApplicationController
  def index
    @users = User.all
    render template: "users/index"
  end

  def show 
    id = params[:id]
    @u = User.find_by(id: id)
    @rounds = @u.user_rounds
    render template: "users/show"
  end

  def home 
    render "users/home"
  end 

  def create
    render template: 'users/create'
    u = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if u.save
      flash[:success] = "User Created"
    
    else 
      flash[:danger] =  u.errors.full_messages
     
    
    end 
     
  end

  def destroy
    render json: "users destroy"
  end

  def update
    u = User.find_by(id: params[:id])
    u.name = params[:name] || u.name
    u.email = params[:email] || u.email
    u.password_digest = params[:password_digest] || u.password_digest
    u.save 
    render template: "users/update"

  end
end