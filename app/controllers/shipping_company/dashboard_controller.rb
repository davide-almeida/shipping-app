class ShippingCompany::DashboardController < ShippingCompanyController
    include EmailValidatable
    def index
        @carriers_count = Carrier.where(shipping_company_id: current_user.shipping_company_id).count

        @order_services_pendente_count = current_user.shipping_company.order_services.where(status: "Pendente").count
        @order_services_aceitas_count = current_user.shipping_company.order_services.where(status: "Aceita").count
        @order_services_recusadas_count = current_user.shipping_company.order_services.where(status: "Recusada").count
        @order_services_concluidas_count = current_user.shipping_company.order_services.where(status: "Concluida").count
    end
end
