class ShippingCompany::DeliveryTimesController < ShippingCompanyController
    before_action :set_delivery_time, only: [:edit, :update]

    def index
        @delivery_times = current_user.shipping_company.delivery_times.all
    end

    def new
        @delivery_time = DeliveryTime.new
    end

    def create
        @delivery_time = DeliveryTime.new(delivery_time_params)
        @delivery_time.shipping_company_id = current_user.shipping_company.id
        if @delivery_time.save
            redirect_to shipping_company_delivery_times_path, notice: 'Prazo de entrega cadastrado com sucesso.'
        else
            flash.now[:alert] = "Não foi possível cadastrar o prazo de entrega."
            render :new
        end
    end

    def edit
    end

    def update
        if @delivery_time.update(delivery_time_params)
            redirect_to shipping_company_delivery_times_path, notice: 'Prazo de entrega atualizado com sucesso.'
        else
            flash.now[:alert] = "Não foi possível atualizar o prazo de entrega."
            render :edit
        end
    end

    private
    def set_delivery_time
        @delivery_time = DeliveryTime.find(params[:id])
        if (@delivery_time.shipping_company_id != current_user.shipping_company_id)
            redirect_to shipping_company_delivery_times_path, alert: "Você tentou acessar uma informação inexistente."
        end
    end

    def delivery_time_params
        params.require(:delivery_time).permit(:range_start, :range_end, :working_day, :shipping_company_id)
    end
end
