require 'rails_helper'
#require 'spec_helper'

describe UsersController do

  # setup do
  #   @request.env["devise.mapping"] = Devise.mappings[:user]
  # end

  describe '#index' do

    #subject {get '/signup'}
    before { get :index }

    it 'has a 200 status code' do
      #request.env['PATH_INFO'] = 'signup'
      expect(response).to have_http_status(:ok)
      #binding.pry
      #is_expected.to be_success
      #expect(:get => "/").to route_to(:controller => "welcome")
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
    #let(:user) { build(:user) }
    before do
      post :confirm, params: { user: attributes_for(:user) }
      @user = User.new(request.params["user"])
    end
    #let(:user) { create(:user) }

    it 'has a 200 status code' do
      #post :confirm, params: { user: attributes_for(:user)}
      expect(response).to have_http_status(:ok)
    end

    it 'renders the :confirm template' do
      #post :confirm, params: { user: attributes_for(:user)}
      expect(response).to render_template :confirm
    end

    it 'assigns @user' do
      #post :confirm, params: { user: @user}
      #binding.pry
      id = 1
      @user.id = id
      assigns(:user).id = id
      expect(assigns(:user)).to eq @user
    end
  end

  # describe '#create' do

  #   it 'has a 200 status code' do
  #     post 'signup/create', params: { user: attributes_for(:user)}
  #     expect(response).to have_http_status(:ok)
  #   end

  #   it 'renders the :complete template' do
  #     post 'signup/create', params: { user: attributes_for(:user)}
  #     expect(response).to render_template :complete
  #   end
  # end

end
