class StaticPagesController < ApplicationController
  def home
    @updated_items = Item.includes(:projections).recently_updated
    @popular_items = Item.includes(:projections).popular
    @new_items = Item.new_items
  end
end
