class Site::TrackRoutesController < SiteController
    def index
    end

    def search
        @order_service = OrderService.where.not(status:"Pendente").find_by(code: params[:search_code])
        if @order_service.nil?
            redirect_to site_track_routes_path, alert: "Código não encontrado."
        end
    end
    
end
