# frozen_string_literal: true

# Controller for Articles
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
end
