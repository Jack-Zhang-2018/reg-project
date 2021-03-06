class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :account]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    cookies[:username] = @user.username
    cookies[:password] = @user.password

    respond_to do |format|
      if @user.save
        cookies[:id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def login
    if !params.has_key?(:password) || params[:password].strip.empty? ||
      !params.has_key?(:username) || params[:username].strip.empty?

    elsif cookies[:password] == params[:password] && cookies[:username] == params[:username]
      @error = "Enter your information"
      redirect_to "/account/#{cookies[:id]}"
    else
      @error = "You are wrong"
      # redirect_to '/login'
    end
  end

  def account
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :street_address, :city, :state, :postal_code, :country, :email_address, :username, :password)
    end
end
