require 'spec_helper'

describe Admin::PostsController do
    
    context "with user login" do
        before :each do
            user = create(:user)
            session[:user_id] = user.id
        end

        describe 'GET #index' do
            it "renders the :index view" do
                get :index
                expect(response).to render_template :index
            end
        end
    
        describe 'GET #show' do
            before :each do
                @post = create(:post)
            end
            
            it "assigns the requested post to @post" do
                get :show, id: @post
                expect(assigns(:post)).to eq @post
            end
    
            it "renders the :show view" do
                get :show, id: @post
                expect(response).to render_template :show
            end

            it "response to json format" do
                get :show, id: @post, format: :json
                expect(response).not_to render_template :show
                expect(response.body).to eq @post.to_json
            end
        end
    
        describe 'GET #new' do
            it "assigns a new Post to @post" do
                get :new
                expect(assigns(:post).attributes).to eq Post.new.attributes
            end
    
            it "renders the :new view" do 
                get :new
                expect(response).to render_template :new
            end
        end
    
        describe 'GET #edit' do
            before :each do
                @post = create(:post)
                get :edit, id: @post
            end
            it "assigns the requested post to @post" do
                expect(assigns(:post)).to eq @post
            end
    
            it "renders the :edit view" do
                expect(response).to render_template :edit
            end
        end
    
        describe 'POST #ceate' do
            context 'with valid attributes' do
                it "saves the new post to the database" do
                    expect{
                        post :create, post: attributes_for(:post)
                    }.to change(Post, :count).by(1)
                end
            end

            context 'with valida post with tags' do
                it "save the new post with three tags" do
                    a_post = build(:post)
                    tags = %w{心情 天气 日记}.map do |tag_name|
                        build(:tag, name: tag_name).attributes
                    end
                    p_data = a_post.attributes
                    p_data[:tags] = tags
                    post :create, post: p_data
                    expect(response).to redirect_to admin_post_path(Post.last.id)
                    a_post = Post.last
                    expect(a_post.tags.count).to eq 3

                    o_post = build(:post, title: "other post")
                    tags = %w{心情 天气 气象台}.map do |tag_name|
                        build(:tag, name: tag_name).attributes
                    end
                    p_data = o_post.attributes
                    p_data[:tags] = tags
                    post :create, post: p_data
                    expect(response).to redirect_to admin_post_path(Post.last.id)
                    a_post = Post.last
                    expect(a_post.tags.count).to eq 3
                    expect(Tag.all.count).to eq 4
                end
            end
        end
    end
end