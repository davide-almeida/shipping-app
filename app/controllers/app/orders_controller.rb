class App::OrdersController < AppController
    def index
        @orders = Order.where(status: "Pendente")
    end

    def new
        @order = Order.new
        @order.build_receiver
    end

    def create
        @order = Order.new(order_params)
        @order.status = "Pendente"
        @order.code = SecureRandom.alphanumeric(15)
        @order.shipping_company_id = params[:shipping_company_id]

        if @order.save
            redirect_to app_order_path(@order), notice: 'Ordem de serviço cadastrada com sucesso.'
        else
            flash.now[:alert] = "Não foi possível cadastrar a ordem de serviço."
            render :new
        end
    end

    def show
        @order = Order.find(params[:id])
    end
    

    private
    def order_params
        params.require(:order).permit(
            :status, :code, :full_address, :width, :height, :depth, :weight, :range, :total_value_cents, :shipping_company_id,
            receiver_attributes: [:full_address, :first_name, :last_name, :registration_code, :_destroy, :id]
        )
    end
end
