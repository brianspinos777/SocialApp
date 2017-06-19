class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
    @friendship = Friendship.find(params[:id])
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
    @friendship = Friendship.find(params[:id])
  end


  #============

  def add_friend
    @friendship1 = Friendship.find_or_create_by(user_id: params[:user_id], friend_id: params[:friend_id])
    @friendship2 = Friendship.find_or_create_by(user_id: params[:friend_id], friend_id: params[:user_id])

    @friendship1.update_attributes(pending: true, initiator: 'u', accepted: false)
    @friendship2.update_attributes(pending: true, initiator: 'f', accepted: false)

    respond_to do |format|
      if true
        format.html { redirect_to root_url, notice: 'Successfully added user.' }
      else
        format.html { redirect_to root_url, notice: 'Error: friend was not added.' }
      end
    end
  end

  def unfriend
    @friendship1 = Friendship.find_or_create_by(user_id: params[:user_id], friend_id: params[:friend_id])
    @friendship2 = Friendship.find_or_create_by(user_id: params[:friend_id], friend_id: params[:user_id])

    @friendship1.update_attributes(pending: false, accepted: false)
    @friendship2.update_attributes(pending: false, accepted: false)

    respond_to do |format|
      if true
        format.html { redirect_to root_url, notice: 'Unfriended user.' }
      else
        format.html { redirect_to root_url, notice: 'Error: Friendship was not canceled.' }
      end
    end
  end

  def cancel_request
    @friendship1 = Friendship.find_or_create_by(user_id: params[:user_id], friend_id: params[:friend_id])
    @friendship2 = Friendship.find_or_create_by(user_id: params[:friend_id], friend_id: params[:user_id])

    @friendship1.update_attributes(pending: false, accepted: false)
    @friendship2.update_attributes(pending: false, accepted: false)

    respond_to do |format|
      if true
        format.html { redirect_to root_url, notice: 'Friendship successfully canceled.' }
      else
        format.html { redirect_to root_url, notice: 'Error: Friendship was not canceled.' }
      end
    end
  end

  def accept_friendship
    @friendship1 = Friendship.find_or_create_by(user_id: params[:user_id], friend_id: params[:friend_id])
    @friendship2 = Friendship.find_or_create_by(user_id: params[:friend_id], friend_id: params[:user_id])

    @friendship1.update_attributes(pending: false, accepted: true)
    @friendship2.update_attributes(pending: false, accepted: true)

    respond_to do |format|
      if true
        format.html { redirect_to root_url, notice: 'Friendship successfully canceled.' }
      else
        format.html { redirect_to root_url, notice: 'Error: Friendship was not canceled.' }
      end
    end
  end

#============



  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = Friendship.new(friendship_params)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to @friendship, notice: 'Friendship was successfully created.' }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { render :new }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :accepted, :pending, :initiator)
    end
end
