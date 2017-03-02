class PostsController < ApplicationController
   before_action :set_post, only: [:show, :edit, :update, :destroy]
   
   def index
      @posts = Post.all
   end
   
   def show
      
   end
    
   def new
      @post = Post.new
   end
   def create
      @post = Post.new(post_params)
      if @post.save
         redirect_to @post, success: 'Article created successfully'
      else
         flash[:danger]= 'article does not created'
         render :new
      end
   end
   
   def edit
      
   end
   
   def update
      
      if @post.update_attributes(post_params)
         redirect_to @post, success: 'Article updated successfully'
      else
         flash[:danger]= 'article does not updated'
         render :edit
      end
   end
   
   def destroy
      
      @post.destroy
      redirect_to posts_path, success: 'Article deleted successfully'
   end
   
   private
   def set_post
      @post = Post.find(params[:id])
   end
   
   def post_params
      params.require(:post).permit(:title, :summary, :body)
   end
end