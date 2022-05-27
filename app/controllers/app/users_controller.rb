class App::UsersController < AppController
    before_action :set_user, only: [:show, :edit, :update]
    include EmailValidatable

    def index
      @users = User.all
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to app_users_path, notice: "O cadastro #{@user.email} foi realizado com sucesso!"
      else
        flash.now[:alert] = "Não foi possível cadastrar o usuário."
        render :new
      end
    end
  
    def edit
    end
  
    def update
      passwd = params[:user][:password]
      passwd_confirmation = params[:user][:password_confirmation]
      if passwd.blank? && passwd_confirmation.blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
  
      if @user.update(set_user)
        redirect_to edit_app_user_path(current_user.id), notice: "O cadastro #{@user.email} foi atualizado com sucesso!"
      else
        flash.now[:alert] = "Não foi possível atualizar o usuário."
        render :edit
      end
    end
  
    def show
    end
  
    private
      def set_user
        @user = User.find(params[:id])
        
      end
  
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :firstname, :lastname)
      end
  
  end