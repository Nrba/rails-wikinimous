# frozen_string_literal: false

# This is a child class
class ArticleController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def edit; end
  def show; end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    return flash.alert = %(Fields can't be blank!) unless @article.valid?

    @article.save
    redirect_to article_path(@article)
  end

  def update
    @article.update(article_params)
    return flash.alert = %(Fields can't be blank!) unless @article.valid?

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
