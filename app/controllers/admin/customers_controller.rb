class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!
    def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy
        redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
    end
    
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            flash[:notice] = "successfully"
            redirect_to admin_dashboard_path(@customer)
        else
            render :edit
        end
    end
    
    private
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,:is_active)
    end
end
