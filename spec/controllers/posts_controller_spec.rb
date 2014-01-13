require 'spec_helper'

describe PostsController do
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
end