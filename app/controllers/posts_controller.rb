class PostsController < ApplicationController 
    def index
        @posts = Post.all.paginate(page: params[:page], per_page: 6).order("created_at desc")
    end
end