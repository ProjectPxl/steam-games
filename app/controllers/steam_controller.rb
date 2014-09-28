class SteamController < ApplicationController
  before_action :authenticate_user, :except => [:index, :destroy]
  skip_before_action :verify_authenticity_token, :only => :create
  
  def index
    @all_users = SteamUser.all
  end

  def create
    auth = request.env['omniauth.auth']
    user = SteamUser.find_by_nickname( auth.info['nickname'] ) || SteamUser.create_new_user(auth)
    session[:current_user] = { :nickname => auth.info['nickname'],
                               :image => auth.info['image'],
                               :uid => auth.uid,
                               :currency => user.currency,
                               :id => user.id }
    @session = session[:current_user]
    redirect_to root_url
  end

  def show
    @user = SteamUser.find( session[:current_user][:id] )
    @giveaways = @user.giveaways
    # @new_giveaway = @user.giveaways.build
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
