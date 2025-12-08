module Admin
  class BlogController < ApplicationController
    http_basic_authenticate_with name: ENV.fetch("ADMIN_USERNAME", "admin"), password: ENV.fetch("ADMIN_PASSWORD", "password")

    before_action :set_blog_post, only: [:edit, :update, :destroy]

    def index
      @blog_posts = BlogPost.all.order(created_at: :desc)
    end

    def new
      @blog_post = BlogPost.new
    end

    def create
      @blog_post = BlogPost.new(blog_params)
      if @blog_post.save
        redirect_to admin_blog_index_path, notice: "Post criado com sucesso!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @blog_post.update(blog_params)
        redirect_to admin_blog_index_path, notice: "Post atualizado com sucesso!"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @blog_post.destroy
      redirect_to admin_blog_index_path, notice: "Post removido com sucesso!"
    end

    private

    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_params
      params.require(:blog_post).permit(:title, :category, :date, :summary, :body)
    end
  end
end
