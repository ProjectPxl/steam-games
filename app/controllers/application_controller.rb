class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :get_game_list, :get_game_getails

  def current_user
    @user ||= session[:current_user]
  end

  def logged_in?
    current_user != nil
  end

  def get_game_list
    source = 'http://api.steampowered.com/ISteamApps/GetAppList/v0001/'
    resp = Net::HTTP.get_response(URI.parse(source))
    data = resp.body
    JSON.parse(data)
  end

  def get_game_getails(steam_appid)
    source = "http://store.steampowered.com/api/appdetails?appids=#{steam_appid}"
    resp = Net::HTTP.get_response(URI.parse(source))
    data = resp.body
    JSON.parse(data)
  end
end
