class ShippingCompany::DashboardController < ShippingCompanyController
    include EmailValidatable
    def index
        @email_validated = email_validate("davide@gmail..com")
    end
end