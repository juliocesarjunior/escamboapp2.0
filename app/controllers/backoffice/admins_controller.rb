class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.order("admins.id asc")
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path 
      flash[:success] =  "O Administrador #{@admin.email} foi criado com Sucesso."
    else
      render :new
      flash[:alert] = "O Administrador não foi cadastrado!"
    end
  end

  def edit
  end

  def update
    if @admin.update(params_admin)
      redirect_to backoffice_admins_path
      flash[:success] = "O Administrador #{@admin.email} foi atualizado com Sucesso."
    else
      render :edit
      flash[:alert] = "O Administrador não foi atualizado!"
    end
  end

  def destroy
    admin_email = @admin.email
    if @admin.destroy
      redirect_to backoffice_admins_path
      flash[:success] = "O Administrador #{admin_email} foi excluido com Sucesso."
    else
      render :index
      flash[:alert] = "O Administrador não foi excluido!"
    end

  end
  
  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    params[:admin].delete(:password) if params[:admin][:password].blank?
    params[:admin].delete(:password_confirmation) if params[:admin][:password].blank?      
    params.require(:admin).permit(:name, :email, :password, :password_confirmation, role_ids: [])
  end
end
