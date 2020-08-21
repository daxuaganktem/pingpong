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
  end

  def show_top
    @users = User.order(:diff).last(10)
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
      if @user.save
        redirect_to users_path
      else
        render "new"
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
        redirect_to users_path
      else
        render "new"
      end
  end

  def update_score_win
    @user = User.find(params[:id])
    new_win = @user.win.next
    @user.update!(win: new_win)
  end

  def update_score_loss
    @user = User.find(params[:id])
    new_loss = @user.loss.next
    @user.update!(win: new_loss)
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
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :name)
    end

end
