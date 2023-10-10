class Auth::RegistrationsController < ApplicationController
  def create
    user = User.new(sign_up_params)
    if user.save
      render json: { status: "ユーザー登録が完了しました" }, status: 201
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end


  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation, :name)
  end
end
