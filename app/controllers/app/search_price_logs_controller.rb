class App::SearchPriceLogsController < AppController
    def index
        @search_price_logs = SearchPriceLog.all
    end
end