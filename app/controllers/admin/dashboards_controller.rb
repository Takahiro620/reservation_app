class Admin::DashboardsController < ApplicationController
    before_action :authenticate_admin!
    
    layout 'admin' # ここを追加
    before_action :authenticate_admin!
    def index
        @customers = Customer.all
    end
    
    
    private
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,:is_active)
    end
end
