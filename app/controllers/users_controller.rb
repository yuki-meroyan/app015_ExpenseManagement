class UsersController < ApplicationController

  def index
    # @SearchUser = User.where('email = ? and id != ?', "%#{params[:gmail]}%", current_user.id).where.not(id: params[:selected_users])
    # binding.pry
    @searchUser = User.find_by(email: params[:gmail])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
