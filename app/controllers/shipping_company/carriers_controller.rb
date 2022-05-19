class ShippingCompany::CarriersController < ShippingCompanyController
    def index
        # @carriers = current_user.shipping_company.carriers.all
        @carriers = ShippingCompany.find_by(domain: "acme.com").carriers.all
    end
end