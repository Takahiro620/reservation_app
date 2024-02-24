class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!
    def index
        @cart_items = CartItem.all
    end
    
    def show
    end
    
    def new
        @cart_item = CartItem.new
    end
    
    def create
        # binding.pry
        @cart_item = CartItem.new(cart_item_params)
        if CartItem.find_by(item_id: params[:cart_item][:item_id])
            flash[:notice] = "すでにカートにあります"
        else
            flash[:notice] = "カートに追加しました"
            @cart_item.save
        end
        redirect_to public_cart_items_path
    end
    
    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to public_cart_items_path
    end
    
    def destroy_all
        cart_items = CartItem.all
        cart_items.destroy_all
        redirect_to public_cart_items_path
    end
    # def update
    #     @item = Item.find(cart_item_params[:item_id])
    #     if @item.update(cart_item_params)
    #         flash[:notice] = "successfully"
    #         redirect_to public_cart_items_path(@item.id)
    #     else
    #         render public_items_path
    #     end        
    # end
    private
 
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :name, :introduction, :price)
    end
end
