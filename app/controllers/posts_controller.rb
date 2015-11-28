class PostsController < ApplicationController 
    def index
        @posts = Post.all.paginate(page: params[:page], per_page: 10).order("created_at desc")
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:success] = "The post is successfully created"
            redirect_to posts_path
        else
            render :new
        end
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :description, :username, :created_at, :updated_at)
    end
end