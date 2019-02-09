require 'rails_helper'

describe ItemsController, type: :request do
  describe 'GET #index' do
    let(:items) { create_list(:item) }
    before { get '/' }

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end   

    it 'assigns @item' do
      expect(assigns(:items)).to match_array(@items)
    end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end

  describe 'DELETE #destroy' do
   # let(:item) { create(:item) } が反映されない意味を知りたい

    it 'is successful to request' do
      item = create(:item)
      delete item_path(id: item.id)
      expect(response.status).to eq 302
    end

    it 'deletes a item' do
      item = create(:item)
      expect{
        delete item_path(id: item.id)
      }.to change(Item,:count).by(-1)
    end

    it 'redirect to user mypage' do
      item = create(:item)
      delete item_path(id: item.id)
      expect(response).to redirect_to(users_mypage_path)
    end
  end
end
