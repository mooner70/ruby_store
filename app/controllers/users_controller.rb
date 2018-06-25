class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
  end

  def show
    @products = Product.where(user_id:current_user.id).where(buyer_id:0)
    @sold = Product.where(user_id: current_user).where.not(buyer_id:0)
    @purchased = Product.where(buyer_id:current_user)
  end


  def create
    if new_user.valid?
      session[:user_id] = new_user.id
    return redirect_to "/users/#{@user.id}"
    end
    redirect_to :back, alert: new_user.errors.full_messages
  end


  private
    helper_method def user
      @user ||= User.find_by(id: params[:id])
    end

    helper_method def new_user
      @new_user ||= User.create(user_params)
    end

    def user_params
      params.require(:user).permit(:first_name,:last_name,:email,:password, :password_confirmation)
    end

end
