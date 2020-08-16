class Api::V1::UsersController < ApplicationController

  def by_establishment_and_role
    users = User.joins(:establishments_users).where(
              establishments_users: { establishment_id: params[:establishment_id]},
              role: params[:role]
            )

    render json: users, status: :ok
  end


  def show
    user = User.find( params[:id] )
    render json: user, status: :ok
  end


  private
  def user_params
    params.require(:user).permit( :email, :role, :password, :password_confimartion, :name )
  end
end
