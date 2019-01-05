class ApplicationController < ActionController::Base
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  # before_action :basic_auth, if: :production?
  # protect_from_forgery with: :exception
=======
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
>>>>>>> ono0satoshi/create-toppage
=======
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
>>>>>>> ono0satoshi/master
=======
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
>>>>>>> ono0satoshi/master

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
