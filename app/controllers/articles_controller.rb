class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @comments = @article.comments
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: '更新されました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :eyecatch)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
