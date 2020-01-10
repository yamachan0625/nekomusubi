require 'rails_helper'

describe UsersController do

  let(:user) { create(:user) }
  let(:posts) { create_list(:post, 3, user: user) }

  describe '#show' do
    context 'ログインしている時' do

      before do
        login user
      end

      it 'ステータスコードが200である' do
        expect(response).to have_http_status(:ok)
      end

      it '@user' do
        get :show, params: {id: user}
        expect(assigns(:user)).to eq user
      end

      it "created_at DESCで並べ替えられた投稿の配列を作成" do
        get :show, params: {id: user}
        expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at } )
      end

      it "showテンプレートをレンダリング" do
        get :show, params: {id: user}
        expect(response).to render_template :show
      end

    end

    context 'ログインしていない時' do

      it "new_user_session_pathにリダイレクト" do
        get :show, params: {id: user}
        expect(response).to redirect_to(new_user_session_path)
      end

    end
  end


  describe '#update' do

    context 'ログインしていない時' do

      it "new_user_session_pathにリダイレクト" do
        patch :update, params: {id: user}
        expect(response).to redirect_to(new_user_session_path)
      end

    end

  end

end