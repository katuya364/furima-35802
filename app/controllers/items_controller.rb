class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
      @item = Item.includes(:user)
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :image, :price, :category_id, :condition_id, :shipping_charge_id,
                                 :prefecture_id, :day_id).merge(user_id: current_user.id)
  end
end
