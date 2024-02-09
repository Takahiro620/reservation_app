class Admin::DashboardsController < ApplicationController
    before_action :authenticate_admin!
    
    layout 'admin' # ここを追加
    before_action :authenticate_admin!
    def index
        @customers = Customer.all
    end
end
