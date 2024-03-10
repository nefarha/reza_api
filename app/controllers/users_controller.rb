class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    data = {
      "params" => params['email'],
      "data" => @user
    }
    render json: data
  end

  def sign_in_user
    email = params['email']
    pass = params['password']

    @user = User.find_by(email: email)

    if @user == nil
      data = {"data" => "user not found","status" => 404}
      render json: data, status: :ok
    else
       if @user.password == pass
        data = {"data" => @user,"status" => 200}
        render json: data, status: :ok
      else
        data = {"data" => "password doesn't match", "status" => 404}
        render json: data, status: :ok
      end
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      data = {"data" => @user,"status" => 201}
      render json: data, location: @user
    else
      data = {"data" => "email has been already taken","status" => 401}
      render json: data
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password,)
    end
end
