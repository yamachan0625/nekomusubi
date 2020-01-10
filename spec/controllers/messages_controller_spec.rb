require 'rails_helper'

describe MessagesController do

  let(:user) { create(:user) }

  describe '#create' do
  let!(:entry) { create(:entry, user_id: user.id) }
  let!(:params) { { message: attributes_for(:message, user_id: user.id, room_id: entry.room_id)} }

    context 'ログインしている時' do

      before do
        login user
      end
      
      context '保存に成功した時' do

        subject {
          post :create,
          params: params
        }

        it 'messageが1増える' do
          expect{ subject }.to change(Message, :count).by(1)
        end

      end

      context '保存に失敗した時' do
        let!(:invalid_params) { { message: attributes_for(:message, user_id: user.id)} }

        subject {
          post :create,
          params: invalid_params
        }

        it 'messageが増えない' do
          expect{ subject }.not_to change(Message, :count)
        end

      end

    end

  end
end