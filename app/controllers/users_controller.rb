class UsersController < ApplicationController
  def profile
    @profile = User.includes(:posted_items, :projections).find(params[:id])
  end
end
