class PostsController < ApplicationController

  before_action :require_user, except:[:index, :show]
	before_action :set_post, except:[:index, :new, :create]

  def index
		@posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
  		flash['success'] = "Your post was created successfully"
  		redirect_to posts_path
  	else
  		render :new
  	end

  end

  def update
	 	if @post.update(post_params)
  		flash[:success] = "Post was updated successfully"
  		redirect_to post_path(@post)
  	else
  		render :edit
  	end

	end

	def destroy
		if @post.destroy
			flash[:notice] = "Post was deleted successfully"
  		redirect_to root_path
  	else
  		render :edit
  	end

	end

  def set_post
		@post = Post.find(params[:id])
	end

  private
    def post_params()
			params.require(:post).permit(:title, :tagline, :body, category_ids: [])
		end

end
