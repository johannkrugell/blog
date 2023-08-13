# frozen_string_literal: true

# Controller for Articles
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    # params is a hash with the key :id
    @article = Article.find(params[:id])
  end

  def new
    # Create a new Article object
    @article = Article.new
  end

  def create
    # Create a new Article object with the title and body
    @article = Article.new(article_params)
    # Save the Article object
    if @article.save
      # Redirect to the article show page
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Find the Article object
    @article = Article.find(params[:id])
  end

  def update
    # Find the Article object
    @article = Article.find(params[:id])
    # Update the Article object with the title and body
    if @article.update(article_params)
      # Redirect to the article show page
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # Find the Article object
    @article = Article.find(params[:id])
    # Destroy the Article object
    @article.destroy
    # Redirect to the articles index page
    redirect_to root_path status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
