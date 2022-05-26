class UsersController < ApplicationController
  def index
    @users = User.all
    render template: "users/index"
  end

  def show 
    id = params[:id]
    u = User.find_by(id: id)
    render json: u.as_json
  end

  def create
    u = User.new(
      name: params[:name],
      email: params[:email],
      password_digest: params[:password]
    )
    u.save
    pp u 
   
  
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