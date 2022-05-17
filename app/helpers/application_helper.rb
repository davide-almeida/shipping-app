module ApplicationHelper
     # select status on ShippingCompany page form
     SHIPPING_COMPANY_STATUS = [
        ["Ativo", "Ativo"],
        ["Inativo", "Inativo"]
    ]
    def options_for_shipping_company_status(selected)
        options_for_select(SHIPPING_COMPANY_STATUS, selected)
    end
end
