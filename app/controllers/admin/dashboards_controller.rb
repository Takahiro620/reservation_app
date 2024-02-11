class Admin::DashboardsController < ApplicationController
    before_action :authenticate_admin!
    
    layout 'admin' # ここを追加

    def index
        @customers = Customer.all
        customer = Customer.find_by(email: params[:email])
        if customer.nil?
            render :index
            
        else
            redirect_to admin_dashboard_path(customer)
        end
    end
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    
    private
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,:is_active)
    end
end
