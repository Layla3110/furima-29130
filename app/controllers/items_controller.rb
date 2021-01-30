class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
  # 省略
    def edit
    end
  
    def update
      @item.update(item_params)
      redirect_to root_path
    end
  
    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      if @item.valid?
        @item.save
        redirect_to root_path
      else
        render :new
      end
    end

    private  

    def item_params
      params.require(:item).permit(:image, :item_name, :text, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :duration_id, :amount).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :prefecture_id)
    end
  end
