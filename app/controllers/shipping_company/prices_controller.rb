class ShippingCompany::PricesController < ShippingCompanyController
    before_action :set_price, only: [:show, :edit, :update]

    def index
        @prices = ShippingCompany.find_by(domain: current_user.email.split("@").last).prices.all
        @price_settings = current_user.shipping_company.price_setting
    end

    def new
        @price = Price.new
    end

    def create
        @price = Price.new(price_params)
        @price.shipping_company_id = current_user.shipping_company.id
        if @price.save
            redirect_to shipping_company_price_path(@price), notice: 'Preço cadastrado com sucesso.'
        else
            flash.now[:alert] = "Não foi possível cadastrar o preço."
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @price.update(price_params)
            redirect_to shipping_company_price_path(@price.id), notice: 'Preço atualizado com sucesso.'
        else
            flash.now[:alert] = "Não foi possível atualizar o preço."
            render :edit
        end
    end

    private
    def set_price
        @price = Price.find(params[:id])
    end

    def price_params
        params.require(:price).permit(:cubic_start, :cubic_end, :weight_start, :weight_end, :value_kilometer, :shipping_company_id)
    end
end
