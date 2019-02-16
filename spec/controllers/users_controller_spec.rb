require 'rails_helper'

describe UsersController do

  describe '#index' do

    before { get :index }

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end

  describe '#new' do
    before { get :new }

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end

    it 'assigns new @user' do
     expect(assigns(:user)).to be_a_new User
   end
  end

  describe '#confirm' do

    before do
      post :confirm, params: { user: attributes_for(:user) }
      @user = User.new(request.params["user"])
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the :confirm template' do
      expect(response).to render_template :confirm
    end

    it 'assigns @user' do
      id = 1
      @user.id = id
      assigns(:user).id = id
      expect(assigns(:user)).to eq @user
    end
  end

end
