class ArticlesController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(paramas[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else 
            render 'new'
        end

        redirect_to @article
    end

    def destroy
        @article = Article.find(paramas[:id])
        @article.destroy

        redirect_to articles_path
    end

    def update
        @article = Article.find(paramas[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
