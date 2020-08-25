class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render json: UserBlueprint.render(@users), status: :ok
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if @user
      render json: @user, status: :ok
    else
      render json: {
        error: "User with id #{params[:id]} not found."
      }, status: :not_found
    end
  end

  def show_top
    @users = User.order(diff: :desc).first(10)
    render json: UserBlueprint.render(@users), status: :ok
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
binding.pry
    if @user.save
      redirect_to users_path
    else
      render "new"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.update(user_params)
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      def show
        @user = User.find(params[:id])
        if @user
          render json: @user, status: :ok
        else
          render json: {
            error: "User with id #{params[:id]} not found."
          }, status: :not_found
        end
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params      
      params.require(:user).permit(:username, :password, :name)
    end

end
