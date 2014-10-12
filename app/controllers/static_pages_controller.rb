class StaticPagesController < ApplicationController
  def home
    @updated_items = Item.includes(:projections).recently_updated
    @popular_items = Item.includes(:projections).popular
    @new_items = Item.new_items
    up = []
    @updated_items.each do |i|
     up << i.images.first
    end
    @home = {
      updated: @updated_items,
      up: up,
      popular: @popular_items,
      new: @new_items
    }
  end
end
