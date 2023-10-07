class SessionsController < ApplicationController
  skip_before_action :login_required
  def new
  end

  def create
    @user = User.find_by(name: session_params[:name])

    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to admin_products_path, notice: 'ログインしました'
    else
      flash.now[:alert] = 'ユーザーネームまたはパスワードが正しいか確認してください'
      render :new, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
