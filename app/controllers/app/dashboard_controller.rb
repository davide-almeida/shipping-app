class App::DashboardController < AppController
    def index
        @shipping_companies_ativas_count = ShippingCompany.where(status: "Ativo").count
        @shipping_companies_inativas_count = ShippingCompany.where(status: "Inativo").count

        @order_services_pendente_count = OrderService.where(status: "Pendente").count
        @order_services_aceitas_count = OrderService.where(status: "Aceita").count
        @order_services_recusadas_count = OrderService.where(status: "Recusada").count
        @order_services_concluidas_count = OrderService.where(status: "Concluida").count
    end
end
