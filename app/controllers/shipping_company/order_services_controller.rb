class ShippingCompany::OrderServicesController < ShippingCompanyController
    before_action :set_order_service, only: [:edit, :update, :show]

    def index
       @order_services = current_user.shipping_company.order_services.all 
    end

    def show
        @cubic_meters = cubic_meters_calc(@order_service.height, @order_service.width, @order_service.depth)
    end

    def edit
        if @order_service.status != "Pendente"
            redirect_to shipping_company_order_services_path, notice: 'Esta ordem de serviço já foi aceita/recusada/concluída.'
        else
            options_for_select
        end
    end

    def update
        @order_service.status = "Aceita"
        
        if @order_service.update(order_service_params)
            OrderRoute.create!(status: "A caminho", current_location: @order_service.full_address, current_time: Time.now, order_service_id: @order_service.id)
            redirect_to shipping_company_order_services_path, notice: 'Ordem de serviço aceita, veículo vinculado e uma nova rota foi criada com sucesso.'
        else
            flash.now[:alert] = "Não foi possível aceitar a ordem de serviço e o veículo não foi vinculado."
            render :edit
        end
    end

    private
    def cubic_meters_calc(x, y, z)
        result = x * y * z
    end

    def options_for_select
        # convert 'kg' to 'g'
        @weight_integer = (@order_service.weight*1000).to_i
        # and get the right cars
        @carriers = current_user.shipping_company.carriers.where('weight >= ?', @weight_integer)
    end

    def set_order_service
        @order_service = OrderService.find(params[:id])
        if (@order_service.shipping_company_id != current_user.shipping_company_id)
            redirect_to shipping_company_order_services_path, alert: "Você tentou acessar uma informação inexistente."
        end
    end

    def order_service_params
        params.require(:order_service).permit(:carrier_id)
    end
end