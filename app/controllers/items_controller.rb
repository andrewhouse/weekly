class ItemsController < ApplicationController
  before_action :get_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
    @projection = current_user.projections.new if current_user
  end

  def new
    authorize! :new, Item
    @item = current_user.posted_items.new
  end

  def create
    authorize! :create, Item
    @item = current_user.posted_items.create(item_params)
    if @item.save!
      redirect_to @item, notice: "Item was Successfully Created"
    else
      flash[:danger] = 'Item could not be saved'
      render :new
    end
  end

  def edit
    authorize! :edit, @item
  end

  def update
    authorize! :update, @item
    if @item.update item_params
      redirect_to @item, notice: "Item was Successfully Updated"
    else
      flash[:danger] = "Item could not be updated"
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, @item
    @item.destroy
    redirect_to items_path, notice: "Item was Successfully Destroyed"
  end

  private

  def get_item
    @item = Item.includes(:projections).find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :link, :max_price, :min_price)
  end
end
