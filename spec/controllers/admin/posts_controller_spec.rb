require 'spec_helper'

describe Admin::PostsController do
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
            expect(assigns(:post)).to eq Post.new
        end

        it "renders the :new view" do 
            get :new
            expect(response).to render_template :new
        end
    end

    describe 'GET #edit' do
        before :each do
            @post = create(:post)
            get :edit, id: post
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
    end
end