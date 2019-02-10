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

  describe 'GET #show' do
    let!(:item) { create(:item) }
    let!(:image) { create(:image) }
    let!(:user) { create(:user) }
    context 'When show action excute' do
      before do
        get item_path(item.id), params: { id: item.id }
      end

      it 'has a 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end

      it 'value of @item is appropriate' do
        expect(assigns(:item)).to eq item
      end
    end
  end
end
