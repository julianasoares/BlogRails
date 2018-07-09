class ArticlesController < ApplicationController
	include ArticlesHelper
	
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Artigo '#{@article.title}' criado!" 
# Mensagem em flash

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Artigo '#{@article.title}' deletado!" 
# Mensagem em flash

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Artigo '#{@article.title} atualizado!" 
# Mensagem em flash

		redirect_to article_path(@article)
# Usando o article_params para atualizar somente os atributos permitidos.
	end

end