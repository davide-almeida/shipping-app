class App::SearchPricesController < AppController
    def index
    end

    def search
        # Validation data
        @search_errors = []
        params.each do |key, value|
            # puts "======="
            # puts "#{key} = #{value}"
            # puts "======="
            
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
