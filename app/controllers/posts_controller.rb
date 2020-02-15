class PostsController < ApplicationController


def index
end

def new 
	
	@post=	Post.new
end

def edit	
	@post=Post.find(params[:id])
end

def update
	@post=Post.find(params[:id])
	if (@post.update(post_params))
		redirect_to (post_path(@post)), notice:"success! you are update tour post."
	else
		render 'edit'
	end
end

def create
	
	@post =Post.new(post_params)

	if @post.save
	redirect_to @post
else
	render 'new'
end

end

def form
end
def index
	@posts= Post.all
	
end
	def show
		@post= Post.find(params[:id])
		
	end 
	def destroy
		@post= Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
	def post_params
		params.required(:post).permit(:title, :text)

end
end