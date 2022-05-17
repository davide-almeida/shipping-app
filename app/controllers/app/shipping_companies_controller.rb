class App::ShippingCompaniesController < AppController
    before_action :set_shipping_company, only: [:show, :edit, :update]

    def index
        @shipping_companies = ShippingCompany.all
    end

    def new
        @shipping_company = ShippingCompany.new
    end

    def create
        @shipping_company = ShippingCompany.new(shipping_company_params)
        if @shipping_company.save
            redirect_to app_shipping_company_path(@shipping_company), notice: 'Transportadora cadastrada com sucesso.'
        else
            flash.now[:alert] = "Não foi possível cadastrar a transportadora."
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @shipping_company.update(shipping_company_params)
            redirect_to app_shipping_company_path(@shipping_company.id), notice: 'Transportadora atualizada com sucesso.'
        else
            flash.now[:alert] = "Não foi possível atualizar a transportadora."
            render :edit
        end
    end

    private
    def set_shipping_company
        @shipping_company = ShippingCompany.find(params[:id])
    end

    def shipping_company_params
        params.require(:shipping_company).permit(:brand_name, :corporate_name, :domain, :registration_number, :full_address, :status)
    end
    
end
