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
                get :show, id: @post
            end
            
            it "assigns the requested post to @post" do
                expect(assigns(:post)).to eq @post
            end
    
            it "renders the :show view" do
                expect(response).to render_template :show
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
                it "save the new post" do
                    a_post = build(:post)
                    tags = %w{心情 天气 日记}.map do |tag_name|
                        build(:tag, name: tag_name).attributes
                    end
                    p_data = a_post.attributes
                    p_data[:tags] = tags

                    sub = expect{
                       post :create, post: p_data
                    }
                    
                    sub.to change(Post, :count).from(0).to(1)
                    sub.to change(Tag, :count).from(0).to(3)
                    expect(response).to redirect_to admin_post_path(Post.last.id)
                end
            end
        end
    end
end