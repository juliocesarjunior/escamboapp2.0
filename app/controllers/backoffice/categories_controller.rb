class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    if @category.save
      redirect_to backoffice_categories_path 
      flash[:success] =  "A categoria #{@category.description} foi criado com Sucesso."
    else
      render :new
      flash[:alert] = "A categoria não foi cadastrado!"
    end
  end

  def edit
  end

  def update
    if @category.update(params_category)
      redirect_to backoffice_categories_path
      flash[:success] = "A categoria #{@category.description} foi atualizado com Sucesso."
    else
      render :edit
      flash[:alert] = "A categoria não foi atualizado!"
    end
  end
  
  private

  def set_category
    @category = Category.find(params[:id])
  end

  def params_category
    params.require(:category).permit(:description)
  end
end
