class App::SearchPricesController < AppController
    include ApplicationHelper

    def index
    end

    def search
        # Validation data
        @search_errors = []
        params.each do |key, value|           
            case
            when key == "weight"
                check_present(key)
            when key == "width"
                check_present(key)
            when key == "height"
                check_present(key)
            when key == "depth"
                check_present(key)
            when key == "range"
                check_present(key)
            end
        end

        # Validation conditions
        if @search_errors.count > 0
            # if params are empty redirect to search form page
            redirect_to app_search_prices_path, alert: "A busca não pode ser realizada. Os campos #{@search_errors.join(', ')} não podem ficar em branco."
        else
            # show search
            @range = params[:range].to_f
            @weight = params[:weight].to_f * 1000
            @weight = @weight.to_i

            @height = params[:height].to_f
            @width = params[:width].to_f
            @depth = params[:depth].to_f
            @cubic_meters = cubic_meters_calc(@height, @width, @depth)

            @shipping_companies = ShippingCompany
                                    .where(status: "Ativo")
                                    .joins(:carriers)
                                        .where('weight >= ?', @weight)
                                        # .limit(1)
                                    .joins(:prices)
                                        .where('cubic_start <= ? AND cubic_end >= ?', @cubic_meters, @cubic_meters)
                                        .where('weight_start <= ? AND weight_end >= ?', @weight, @weight)
                                        .order(:value_kilometer)
                                    .joins(:delivery_times)
                                    .where('range_start <= ? AND range_end >= ?', @range, @range)
                                    .uniq

            # create log (SearchPriceLog)
            # raise
            @shipping_companies.each do |shipping_company|
                # raise
                SearchPriceLog.create!(
                    brand_name: shipping_company.brand_name, corporate_name: shipping_company.corporate_name,
                    domain: shipping_company.domain, registration_number: shipping_company.registration_number, cubic_meter: @cubic_meters.to_f,
                    value_kilometer_cents: (find_price(shipping_company, @cubic_meters, @weight)*100).to_i, value_min_cents: shipping_company.price_setting.value_min_cents,
                    deadline: find_working_days(shipping_company, @range), search_date: Time.now, range: @range,
                    total_value_cents: value_total(@range, find_price(shipping_company, @cubic_meters, @weight), shipping_company.price_setting.value_min_cents)
                )
            end
        end
    end

    # methods to calc and validations
    private
    def cubic_meters_calc(x, y, z)
        result = x * y * z
    end

    def check_present(param)
        if params["#{param}"].empty?
            @search_errors << t(param)
        end
    end
    
end
