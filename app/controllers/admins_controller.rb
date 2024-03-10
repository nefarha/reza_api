class AdminsController < ApplicationController
  before_action :set_admin, only: %i[ show update destroy ]

  # GET /admins
  def index
    @admins = Admin.all

    render json: @admins
  end

  # GET /admins/1
  def show
    render json: @admin
  end

  def sign_in_admin
    email = params['email']
    pass = params['password']

    @admin = Admin.find_by(email: email)

    if @admin == nil
      data = {"data" => "admin not found","status" => 404}
      render json: data, status: :ok
    else
       if @admin.password == pass
        data = {"data" => @admin,"status" => 200}
        render json: data, status: :ok
      else
        data = {"data" => "password doesn't match", "status" => 404}
        render json: data, status: :ok
      end
    end
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      data = {"data" => @admin,"status" => 200}
      render json: data, location: @admin
    else
      data = {"data" => "email has been already taken","status" => 401}
      render json: data
    end
  end

  # PATCH/PUT /admins/1
  def update
    if @admin.update(admin_params)
      render json: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:email, :name, :password, :account_type)
    end
end
