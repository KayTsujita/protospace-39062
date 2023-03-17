class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  private
  
  def prototype_params
    params.require(:user).permit(:name, :profile, :occupation, :position)
  end

end
