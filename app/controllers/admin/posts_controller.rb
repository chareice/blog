class Admin::PostsController < Admin::BaseController
    def index
        @posts = Post.all
        render :index
    end

    def create
        post = Post.new post_params

        if post.save
            redirect_to admin_posts_path
        end
    end

    def new
        @post = Post.new
    end

    def update
    end

    def edit
        @post = Post.find params[:id]
    end

    def show
        @post = Post.find params[:id]
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :content)
    end
end
