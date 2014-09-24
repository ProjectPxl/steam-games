class SteamController < ApplicationController
  before_action :authenticate_user, :except => [:index, :destroy]
  skip_before_action :verify_authenticity_token, :only => :create
  
  def index
    @all_users = SteamUser.all
  end

  def create
    # auth = request.env['omniauth.auth']
    auth = request.env['omniauth.auth']
    user = SteamUser.find_by_provider_and_uid(auth.provider, auth.uid) || SteamUser.create_new_user(auth)
    session[:current_user] = { :nickname => auth.info['nickname'],
                               :image => auth.info['image'],
                               :uid => auth.uid,
                               :currency => user.currency,
                               :id => user.id }
    @session = session[:current_user]
    redirect_to root_url
  end

  def show
    
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_url
  end

  def authenticate_user
    # if session[:current_user] == nil
    #   redirect_to root_url
    # end
  end

end
