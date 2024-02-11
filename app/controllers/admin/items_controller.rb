class Admin::ItemsController < ApplicationController
    before_action :authenticate_admin!
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        if @item.save
            flash[:notice] = "successfully"
            redirect_to admin_item_path(@item)
        else
            render :new
        end
    end
    
    def show
        @items = Item.find(params[:id])
    end
    
    def index
        @items = Item.all
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            flash[:notice] = "successfully"
            redirect_to admin_item_path(@item.id)
        else
            render :edit
        end
    end
    
    def destroy
        item = Item.find(params[:id])
        item.destroy
        redirect_to admin_items_path
    end
    
    private
    def item_params
        params.require(:item).permit(:name, :introduction, :price)
    end
end