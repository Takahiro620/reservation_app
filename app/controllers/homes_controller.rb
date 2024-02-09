class HomesController < ApplicationController
  def top
    @customer = Customer.current_customer
  end
  
  
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
    end 
  
    def is_matching_login_customer
        customer = Customer.find(params[:id])
        unless customer.id == current_customer.id
        redirect_to customer_path(current_customer)
        end
    end
end
