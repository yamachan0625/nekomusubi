require 'rails_helper'

describe RoomsController do
  let(:user) { create(:user) }

  describe '#create' do
    let(:room) { create(:room) }
    let(:another_user) { create(:user) }
    let!(:params) { { entry: attributes_for(:entry, user_id: another_user.id)} }

    subject {
      post :create,
      params: params
    }
    
    context 'ログインしている時' do

      before do
        login user
      end

        it 'entryが2増える' do
          expect{ subject }.to change(Entry, :count).by(2)
        end

        it 'room_pathにリダレクト' do
          subject
          expect(response).to redirect_to room_path(assigns(:room).id)
        end

    end

    context 'ログインしていない時' do

      it "new_user_session_pathにリダイレクト" do
        subject
        expect(response).to redirect_to(new_user_session_path)
      end

    end

  end

  describe '#show' do
    let!(:room) { create(:room) }
    let!(:messages) { create_list(:message, 3, room_id: room.id, user_id: user.id) }

    context 'ログインしている時' do

      before do
        login user
      end

      it 'ステータスコードが200である' do
        expect(response).to have_http_status(:ok)
      end

      it "@roomを割り当てる" do
        get :show, params: {id: room.id}
        expect(assigns(:room)).to match(room)
      end

    end

    context 'ログインしていない時' do

      it "new_user_session_pathにリダイレクト" do
        get :show, params: {id: room.id}
        expect(response).to redirect_to(new_user_session_path)
      end

    end
  end

  describe '#new_message' do

  context 'ログインしている時' do

    before do
      login user
    end

    it 'ステータスコードが200である' do
      expect(response).to have_http_status(:ok)
    end

  end

  end

  context 'ログインしていない時' do

    it "new_user_session_pathにリダイレクト" do
      get :new_message
      expect(response).to redirect_to(new_user_session_path)
    end

  end

end