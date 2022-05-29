module ApplicationHelper
    # ======== SHIPPING_COMPANY Helpers - START =========
    # select status on OrderRoute page form
    ORDER_ROUTE_STATUS = [
        ["A caminho", "A caminho"],
        ["Concluída", "Concluída"]
    ]
    def options_for_order_route_status(selected)
        options_for_select(ORDER_ROUTE_STATUS, selected)
    end

    # ======== SHIPPING_COMPANY Helpers - END ===========

    # ======== APP Helpers - START =========
    # select status on ShippingCompany page form
    SHIPPING_COMPANY_STATUS = [
        ["Ativo", "Ativo"],
        ["Inativo", "Inativo"]
    ]
    def options_for_shipping_company_status(selected)
        options_for_select(SHIPPING_COMPANY_STATUS, selected)
    end

    # search_prices
    def find_price(shipping_company, cubic_meters, weight)
        shipping_company.prices.where('cubic_start <= ? AND cubic_end >= ?', cubic_meters, cubic_meters)
        .where('weight_start <= ? AND weight_end >= ?', weight, weight)
        .order(:value_kilometer_cents)
        .first
        .value_kilometer_cents/100.to_f
    end

    # total value calc
    def value_total(km, price_per_km, default_price)
        result = km.to_f * price_per_km.to_f

        default_price = default_price/100.to_f
        if result < default_price
            result = default_price
            # raise
        end
        result
        # raise
    end

    # working days
    def find_working_days(shipping_company, range)
        shipping_company.delivery_times.where('range_start <= ? AND range_end >= ?', @range, @range).order(:working_day).first.working_day
    end
    # ======== APP Helpers - END ===========
end
