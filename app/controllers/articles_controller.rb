class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    #byebug
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    #byebug
  end

  def create
    #render plain: params[:article]
    @article = Article.new(article_params)

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
    if @article.update(article_params)
        flash[:notice] = "Article was updated successfully."
        redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
