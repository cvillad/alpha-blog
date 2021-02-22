class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only: [:create, :update]

    def index
        @articles = Article.all
    end
    
    def show
    end
  
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:notice] = "Article created successfully"
            redirect_to @article
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article updated successfully"
            render :show
        else
            render :new
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Article deleted successfully"
        redirect_to articles_path
    end

    private
    
    def article_params
        params.require(:article).permit(:title, :description)
    end

    def set_article
        @article = Article.find(params[:id])
    end

end
