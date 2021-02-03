class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :checkuser, only: [:edit]

    def index
      @items = Item.all.order("created_at ASC")
    end

    def edit
    end
  
    def update
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
    end
  
    def new
      @item = Item.new
    end

    def show
      @item = Item.find(params[:id])
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

    def destroy
      @item = Item.find(params[:id])
        if @item.user_id == current_user.id
          @item.destroy
          redirect_to root_path
        end
    end

    private  

    def item_params
      params.require(:item).permit(:image, :item_name, :text, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :duration_id, :amount).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def checkuser
      if current_user.id =! @item.user.id 
        redirect_to item_path
      end
    end
end
