class ArticlesController < ApplicationController


  def create
    if request.post? then
      puts "toto"
    @article = Article.new
      @article.prix=params[:prix]
      @article.description=params[:description]
      @article.name=params[:name]
      @article.save()
    end
  end

  def show
    puts session[:user]
    if session[:user]
      @article=Article.all
    end
  end

  private
  def article_params
    params.permit(:name, :prix, :description)
  end



end


