class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :redirect_to_categories, only: %i[show index]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def redirect_to_categories
    redirect_to groups_url
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
