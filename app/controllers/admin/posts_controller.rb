class Admin::PostsController < Admin::BaseController
    def index
        @posts = Post.all
    end

    def create
        post = Post.new post_params
        if tags_params
            tags_params.each do |tag_params|
                post.tags << Tag.find_or_create_by(name: tag_params[:name])
            end
        end
        if post.save
            redirect_to admin_post_path(post)
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
        respond_to do |format|
            format.html
            format.json {
                render json: @post.to_json
            }
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :content)
    end
    def tags_params
        params[:post][:tags]
    end
end
