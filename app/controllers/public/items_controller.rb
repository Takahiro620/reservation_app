class Public::ItemsController < ApplicationController
    def show
        @items = Item.find(params[:id])
    end
    
    def index
        @items = Item.all
    end
    
    private
    def item_params
        params.require(:item).permit(:name, :introduction, :price)
    end
end
