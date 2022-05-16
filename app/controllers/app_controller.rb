class AppController < ApplicationController
    before_action :authenticate_admin!
    layout 'app'
end