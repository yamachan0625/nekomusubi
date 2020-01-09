require 'rails_helper'

describe PostsController do

  let(:user) { create(:user) }
  
  describe '#index' do

  let!(:posts) { create_list(:post, 3) }

    it 'ステータスコードが200である' do
      expect(response).to have_http_status(:ok)
    end

    it "created_at ascで並べ替えられたpostの配列＠posts" do
      get :index
      expect(assigns(:posts)).to match(posts.sort{|a, b| a.created_at <=> b.created_at })
    end

    it "created_at descで並べ替えられたpostの配列＠new_posts" do
      get :index
      expect(assigns(:new_posts)).to match(posts.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "＠new_postsの返される数は5件以下のlimitがかかっていること" do
      get :index
      expect(assigns(:new_posts).count(true) <= 5).to eq true
    end

    it "＠posts2を割当てる" do
      get :index
      expect(assigns(:posts2)).to match(posts)
    end

    it "indexテンプレートをレンダリング" do
      get :index
      expect(response).to render_template :index
    end

  end

  # describe '#show' do

  # let!(:post) { create(:post) }

  #   context 'ログインしている時' do

  #     before do
  #       login user
  #     end

  #     it 'ステータスコードが200である' do
  #       expect(response).to have_http_status(:ok)
  #     end

  #     it "@postを割り当てる" do
  #       get :show, params: {id: post.id}
  #       expect(assigns(:post)).to match(post)
  #     end

  #     it "@userを割り当てる" do
  #       get :show, params: {id: post.id}
  #       expect(assigns(:user)).to match(post.user)
  #     end

  #     it "@currentUserEntryを割り当てる" do
  #       get :show, params: {id: post.id}
  #       expect(assigns(:user)).to match(post.user)
  #     end

  #     it "@userEntryを割り当てる" do
  #       get :show, params: {id: post.id}
  #       expect(assigns(:user)).to match(post.user)
  #     end

  #     it "showテンプレートをレンダリング" do
  #       get :show, params: {id: post.id}
  #       expect(response).to render_template :show
  #     end

  #   end

  #   context 'ログインしていない時' do

  #     it "new_user_session_pathにリダイレクト" do
  #       get :show, params: {id: post.id}
  #       expect(response).to redirect_to(new_user_session_path)
  #     end
      
  #   end

  # end

end