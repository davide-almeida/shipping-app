class ShippingCompany::CarriersController < ShippingCompanyController
    before_action :set_carrier, only: [:show, :edit, :update]

    def index
        @carriers = ShippingCompany.find_by(domain: current_user.email.split("@").last).carriers.all
    end

    def new
        @carrier = Carrier.new
    end

    def create
        @carrier = Carrier.new(carrier_params)
        @carrier.shipping_company_id = current_user.shipping_company.id
        if @carrier.save
            redirect_to shipping_company_carrier_path(@carrier), notice: 'Veículo cadastrado com sucesso.'
        else
            flash.now[:alert] = "Não foi possível cadastrar o veículo."
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @carrier.update(carrier_params)
            redirect_to shipping_company_carrier_path(@carrier.id), notice: 'Veículo atualizado com sucesso.'
        else
            flash.now[:alert] = "Não foi possível atualizar o veículo."
            render :edit
        end
    end

    private
    def set_carrier
        @carrier = Carrier.find(params[:id])
    end

    def carrier_params
        params.require(:carrier).permit(:license_plate, :brand, :code_model, :manufact_year, :weight, :shipping_company_id)
    end
end