class ShippingCompanyController < ApplicationController
    before_action :authenticate_user!
    layout 'shipping_company'
end