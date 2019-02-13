require 'rails_helper'

describe ItemsController, type: :request do
  describe 'GET #index' do
    let(:items) { create_list(:item) }
    before { get '/' }

    it 'has a 200 status code' do
      binding.pry
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @item' do
      expect(assigns(:items)).to match_array(@items)
    end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end
end
