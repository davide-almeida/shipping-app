class ShippingCompany::PriceSettingsController < ShippingCompanyController
    before_action :set_price_setting, only: [:edit, :update]

    def index
        @price_settings = current_user.shipping_company.price_setting
    end

    def new
        @price_setting = PriceSetting.new
    end

    def create
        @price_setting = PriceSetting.new(price_setting_params)
        @price_setting.shipping_company_id = current_user.shipping_company.id
        if @price_setting.save
            redirect_to new_shipping_company_price_setting_path, notice: 'Configuração de preço cadastrada com sucesso.'
        else
            flash.now[:alert] = "Não foi possível cadastrar a configuração de preço."
            render :new
        end
    end

    def edit
    end

    def update
        if @price_setting.update(price_setting_params)
            redirect_to edit_shipping_company_price_setting_path(@price_setting.id), notice: 'Configuração de preço atualizada com sucesso.'
        else
            flash.now[:alert] = "Não foi possível atualizar a configuração de preço."
            render :edit
        end
    end

    private
    def set_price_setting
        @price_setting = PriceSetting.find(params[:id])
    end

    def price_setting_params
        params.require(:price_setting).permit(:value_min, :shipping_company_id)
    end
end
