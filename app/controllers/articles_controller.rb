class ArticlesController < ApplicationController

  def show
    #byebug
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    #byebug
    @article = Article.find(params[:id])
  end

  def create
    #render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))

    #render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was created successfully."
      #redirtect to the "show" page to show the results of this "create" to the creating user. Either of the below lines will work.
      #redirect_to article_path(@article)
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    #byebug
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
        flash[:notice] = "Article was updated successfully."
        redirect_to @article
    else
      render 'edit'
    end
  end

end
