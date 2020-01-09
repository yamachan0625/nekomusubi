require 'rails_helper'

describe PostsController do

  let(:user) { create(:user) }

  # describe '#index' do

  # let!(:posts) { create_list(:post, 3) }

  #   it 'ステータスコードが200である' do
  #     expect(response).to have_http_status(:ok)
  #   end

  #   it "created_at ascで並べ替えられたpostの配列＠posts" do
  #     get :index
  #     expect(assigns(:posts)).to match(posts.sort{|a, b| a.created_at <=> b.created_at })
  #   end

  #   it "created_at descで並べ替えられたpostの配列＠new_posts" do
  #     get :index
  #     expect(assigns(:new_posts)).to match(posts.sort{|a, b| b.created_at <=> a.created_at })
  #   end

  #   it "＠new_postsの返される数は5件以下のlimitがかかっていること" do
  #     get :index
  #     expect(assigns(:new_posts).count(true) <= 5).to eq true
  #   end

  #   it "＠posts2を割当てる" do
  #     get :index
  #     expect(assigns(:posts2)).to match(posts)
  #   end

  #   it "indexテンプレートをレンダリング" do
  #     get :index
  #     expect(response).to render_template :index
  #   end

  # end

  # describe '#show' do

  #   let!(:post) { create(:post) }
  #   let!(:currentUserEntry) { create(:entry, user_id: user.id) }
  #   let!(:userEntry) { create(:entry, user_id: post.user.id) }

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
  #       expect(assigns(:currentUserEntry)).to match([currentUserEntry])
  #     end

  #     it "@userEntryを割り当てる" do
  #       get :show, params: {id: post.id}
  #       expect(assigns(:userEntry)).to match([userEntry])
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

  # describe '#create' do
  # let(:params) { { user_id: user.id, post: attributes_for(:post)} }

  #   context 'ログインしている時' do

  #     before do
  #       login user
  #     end

  #       context '保存に成功した時' do

  #         subject {
  #           post :create,
  #           params: params
  #         }

  #         it 'postが1増える' do
  #           expect{ subject }.to change(Post, :count).by(1)
  #         end

  #         it 'posts_pathにリダレクト' do
  #           subject
  #           expect(response).to redirect_to(posts_path)
  #         end

  #       end
    
  #       context '保存に失敗した時' do
  #         let(:invalid_params) { { user_id: user.id, post: attributes_for(:post, title: nil, address: nil)} }

  #         subject {
  #           post :create,
  #           params: invalid_params
  #         }

  #         it 'postが増えない' do
  #           expect{ subject }.not_to change(Post, :count)
  #         end

  #         it 'posts_pathにリダレクト' do
  #           subject
  #           expect(response).to redirect_to(posts_path)
  #         end
        
  #       end


  #   end

  #   context 'ログインしていない時' do

  #     it "new_user_session_pathにリダイレクト" do
  #       post :create, params: params
  #       expect(response).to redirect_to(new_user_session_path)
  #     end
      
  #   end

  # end

  # describe '#destroy' do
  #   let!(:post) { create(:post, user_id: user.id) }

  #   context 'ログインしている時' do

  #     before do
  #       login user
  #     end

  #     context '削除に成功した時' do

  #       subject {
  #           delete :destroy,
  #           params: {id: post.id}
  #         }

  #       it 'postが1減る' do
  #         expect{ subject }.to change(Post, :count).by( -1 )
  #       end

  #       it "user_pathにリダイレクト" do
  #         subject
  #         expect(response).to redirect_to(user_path(user.id))
  #       end

  #     end

  #     context '削除に失敗した時' do
  #       let(:another_user) { create(:user) }
  #       let(:post) { create(:post, user_id: another_user.id) }
        
  #       subject {
  #           delete :destroy,
  #           params: {id: post.id}
  #         }

  #       it 'postが減らない' do
  #         expect{ subject }.not_to change(Post, :count)
  #       end

  #       it "user_pathにリダイレクト" do
  #         subject
  #         expect(response).to redirect_to(post_path(post.id))
  #       end

        
  #     end

  #   end

  #   context 'ログインしていない時' do

  #     it "new_user_session_pathにリダイレクト" do
  #       delete :destroy, params: {id: post.id}
  #       expect(response).to redirect_to(new_user_session_path)
  #     end

  #   end

  # end

  describe '#search' do
    let!(:posts) { create_list(:post, 3, address: "新宿") }
      
    it "showテンプレートをレンダリング" do
      get :search, params: {search: "新宿"}
      expect(response).to render_template :search
    end

    it "@postsを割り当てる" do
      get :search, params: {search: "新宿"}
      expect(assigns(:posts)).to match(posts)
    end

  end

end