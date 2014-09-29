class GiveawaysController < ApplicationController

  def index
    @all_giveaways = Giveaway.all
  end

  def show
    @show_giveaway = Giveaway.find(params[:id])
  end

  def new
    @new_giveaway = Giveaway.new

    respond_to do |format|
      format.html
      format.json { render json: get_game_list }
      # format.json  { render :json => { :gane_list => get_game_list, 
      #                                  :game_details => get_game_getails(20) }}
    end
  end

  def create
    @new_giveaway = Giveaway.create(giveaway_params)
    @new_giveaway.steam_user_id = current_user[:id]

    if @new_giveaway.save
      flash[:success] = "Giveaway created!"
      redirect_to root_url
    else
      flash[:error] = "Giveaway not created!"
      redirect_to root_url
    end
  end

  def new_participant
    @current_giveaway = Giveaway.find(params[:id])
    min_participants = @current_giveaway.min_participants
    no_participants = Giveaway.participants_empty?(@current_giveaway)
    @winner = "no winner"

    # @giveaway_participants.min_participants = 1
    # @current_giveaway.participants = nil


    #Save user id in participants field.
    # if no_participants
    #   @current_giveaway.participants = session[:current_user][:id].to_s
    # else
    #   @current_giveaway.participants += ',' + session[:current_user][:id].to_s
    # end

    if @current_giveaway.save
      flash[:success] = "You took part"
    else
      flash[:error] = "You didn't take part"
    end

    #Perform raffle if min_participants reached.
    if @current_giveaway.participants != nil && @current_giveaway.participants.length == min_participants
      @winner = perform_raffle(@current_giveaway.participants)
    end

    #Fetching user id's currently in giveaway
    # @participants = @giveaway_participants.participants.split(",").map { |user_id| user_id.to_i }
    # @participants.each do |id| 
    #   if id == session[:current_user][:id]
    #   end

  end

  def perform_raffle(participants)
    winner = participants.split(",").map { |user_id| user_id.to_i }[0]
    "winner is #{winner}"
  end

  def giveaway_params
      params.require(:giveaway).permit(:game_id, :game_name, :min_participants)
  end
end
