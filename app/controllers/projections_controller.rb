class ProjectionsController < ApplicationController
  def create
    @projection = current_user.projections.create(item_id: params["projection"]["item_id"], price: params["projection"]["price"])
    if @projection.save
      redirect_to :back
    else
      redirect_to :back
      flash[:danger] = "Only One Projection Per Item"
    end
  end
end
