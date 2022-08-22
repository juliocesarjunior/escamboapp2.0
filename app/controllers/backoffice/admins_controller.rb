class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    #@admins = Admin.order("admins.id asc")
    @search = Admin.joins(:roles)

    if current_admin.has_role? :SuperAdmin    
      @admins = @search.order("admins.id asc")
    elsif current_admin.has_role? :Admin
      @admins = @search.where("roles.name=? or roles.name=?", 'Admin', 'NewUser').order("admins.name asc")
    else
      @admins = @search.where("admins.id=?", current_admin.id).order("admins.name asc")
    end
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path 
      flash[:success] =  "O Usuario #{@admin.email} foi criado com Sucesso."
    else
      render :new
      flash[:alert] = "O Usuario não foi cadastrado!"
    end
  end

  def edit
  end

  def update
    params[:admin].delete(:password) if params[:admin][:password].blank?
    params[:admin].delete(:password_confirmation) if params[:admin][:password].blank? 
    if @admin.update(params_admin)
      redirect_to backoffice_admins_path
      flash[:success] = "O Usuario #{@admin.email} foi atualizado com Sucesso."
    else
      render :edit
      flash[:alert] = "O Usuario não foi atualizado!"
    end
  end

  def destroy
    admin_email = @admin.email
    if @admin.destroy
      redirect_to backoffice_admins_path
      flash[:success] = "O Usuario #{admin_email} foi excluido com Sucesso."
    else
      render :index
      flash[:alert] = "O Usuario não foi excluido!"
    end

  end
  
  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    params.require(:admin).permit(:name, :email, :password, :password_confirmation, role_ids: [])
  end
end
