class UsersController < ApplicationController
  layout "home"

  before_action :load_user, only: %i(show edit update)
  load_and_authorize_resource

  def show
    @score_bets = current_user.score_bets
    render "users/profile"
  end

  def edit
    render "users/edit"
  end

  def update
    if @user.update_attributes user_params
      sign_in @user, bypass: true
      flash[:success] = t ".success_update"
      redirect_to user_path
    else
      flash[:danger] = t ".fails_update"
      render "users/edit"
    end
  end

  private

  def load_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit :fullname, :email, :gender,
      :password
  end
end
