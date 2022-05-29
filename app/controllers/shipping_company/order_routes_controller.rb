class ShippingCompany::OrderRoutesController < ShippingCompanyController
    before_action :set_order_route, only: [:show]

    def index
       @order_services = current_user.shipping_company.order_services.joins(:order_routes).uniq
    end

    def show
        @order_routes = @order_route.order_service.order_routes.order("created_at DESC")
    end

    def new
        @order_service = OrderService.find(params[:order_service_id])
        if current_user.shipping_company_id != OrderService.find(params[:order_service_id]).shipping_company_id
            redirect_to shipping_company_order_routes_path, alert: "Você tentou acessar uma informação inexistente."
        elsif @order_service.order_routes.last.status == "Concluída"
            redirect_to shipping_company_order_route_path(params[:order_service_id]), alert: "Esta rota já foi concluída."
        else
            @order_route = OrderRoute.new
        end
    end

    def create
        if current_user.shipping_company_id != OrderService.find(params[:order_service_id]).shipping_company_id
            redirect_to shipping_company_order_routes_path, alert: "Você tentou acessar uma informação inexistente."
        else
            @order_route = OrderRoute.new(order_route_params)
            @order_route.current_time = Time.now
            @order_route.order_service_id = params[:order_service_id]

            if @order_route.save
                redirect_to shipping_company_order_route_path(@order_route.id), notice: 'Rota atualizada com sucesso.'
                if @order_route.status == "Concluída"
                    @order_route.order_service.update_attribute(:status, 'Concluida')
                end
            else
                flash.now[:alert] = "Não foi possível atualizar a rota."
                render :new
            end
        end
    end

    private
    def set_order_route
        @order_route = OrderRoute.find(params[:id])
        if (@order_route.order_service.shipping_company_id != current_user.shipping_company_id)
            redirect_to shipping_company_order_routes_path, alert: "Você tentou acessar uma informação inexistente."
        end
    end

    def order_route_params
        params.require(:order_route).permit(:current_location, :current_time, :status, :order_service_id)
    end
end