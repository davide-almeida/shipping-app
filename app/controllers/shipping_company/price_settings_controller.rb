class ShippingCompany::PriceSettingsController < ShippingCompanyController
    before_action :set_price_setting, only: [:edit, :update]

    def new
        if current_user.shipping_company.price_setting.nil?
            @price_setting = PriceSetting.new
        else
            redirect_to edit_shipping_company_price_setting_path(current_user.shipping_company.price_setting.id)
        end
    end

    def create
        @price_setting = PriceSetting.new(price_setting_params)
        @price_setting.shipping_company_id = current_user.shipping_company.id
        if @price_setting.save
            redirect_to edit_shipping_company_price_setting_path(@price_setting.id), notice: 'Configuração de preço cadastrada com sucesso.'
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
        if (@price_setting.shipping_company_id != current_user.shipping_company_id)
            redirect_to edit_shipping_company_price_setting_path(current_user.shipping_company.price_setting.id), alert: "Você tentou acessar uma informação inexistente."
        end
    end

    def price_setting_params
        params.require(:price_setting).permit(:value_min, :shipping_company_id)
    end
end
