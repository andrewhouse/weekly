class StaticPagesController < ApplicationController
  def home
    @updated_items = Item.includes(:images, :projections).recently_updated
    @popular_items = Item.includes(:images, :projections).popular
    @new_items = Item.new_items
    @home = {
      updated: @updated_items,
      popular: @popular_items,
      new: @new_items
    }
  end
end
