class Admin::CategoriesController < Admin::BaseController
  cache_sweeper :blog_sweeper

  def index; redirect_to :action => 'new' ; end
  def edit; new_or_edit;  end

  def new 
    respond_to do |format|
      format.html { new_or_edit }
      format.js { 
        @category = Category.new
      }
    end
  end

  def destroy
    @record = Category.find(params[:id])
    return(render 'admin/shared/destroy') unless request.post?

    @record.destroy
    redirect_to :action => 'new'
  end

  private

  def new_or_edit
    @categories = Category.find(:all) 
    if params[:id]
      @category = Category.find(params[:id])
      @category.attributes = params[:category]
    else
      @category = Category.new
    end
    if request.post?
      @category.attributes = params[:category]
      respond_to do |format|
        format.html { save_category }
        format.js do 
          @category.save
          @article = Article.new
          @article.categories << @category
          return render(:partial => 'admin/content/categories')
        end
      end
      return
    end
    render 'new'
  end

  def save_category
    if @category.save
      flash[:notice] = _('Category was successfully saved.')
    else
      flash[:error] = @category.errors.full_messages.to_sentence
    end
    redirect_to :action => 'new'
  end

end
