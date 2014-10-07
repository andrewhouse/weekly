class UsersController < ApplicationController
  def profile
    @profile = User.includes(:posted_items, :projections).find(params[:id])
    authorize! :artist, @profile
  end

  def ban
    authorize! :admin, User
    user = User.find(params[:id])
    user.role = 'banned'
    user.save!
    redirect_to :back
  end
end
