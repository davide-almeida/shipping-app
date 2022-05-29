class App::OrderServicesController < AppController
    def index
        @order_services = OrderService.all
    end

    def new
        @order_service = OrderService.new
        @order_service.build_receiver
    end

    def create
        @order_service = OrderService.new(order_service_params)
        @order_service.status = "Pendente"
        @order_service.code = SecureRandom.alphanumeric(15)
        @order_service.shipping_company_id = params[:shipping_company_id]

        if @order_service.save
            redirect_to app_order_service_path(@order_service), notice: 'Ordem de serviço cadastrada com sucesso.'
        else
            flash.now[:alert] = "Não foi possível cadastrar a ordem de serviço."
            render :new
        end
    end

    def show
        @order_service = OrderService.find(params[:id])
    end
    

    private
    def order_service_params
        params.require(:order_service).permit(
            :status, :code, :full_address, :width, :height, :depth, :weight, :range, :total_value_cents, :shipping_company_id,
            receiver_attributes: [:full_address, :first_name, :last_name, :registration_code, :_destroy, :id]
        )
    end
end
