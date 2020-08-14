class ApplicationController < ActionController::API
  include ActionController::Helpers

  class NoTokenProvided < StandardError; end
  class CouldNotFindUser < StandardError; end

  # before_action :require_login
  # skip_before_action :require_login, only: :callback
  helper_method :current_user

  def login
    redirect_to Authentication.client.auth_code.authorize_url
  end

  def current_user
    token = request.headers["Authorization"].to_s
    raise NoTokenProvided if token.blank?

    @user = Authentication::AuthenticateUser.call(token)
    raise CouldNotFindUser if @user.blank?

    @user
  end

  def callback
    jwt_token = Authentication::TokenDispenserService.call(params[:code])
    render plain: jwt_token
  end
end
