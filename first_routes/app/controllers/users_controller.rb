class UsersController < ApplicationController
  def index
    if params[:query]
      query = params[:query]
      query_string =  "%" + query + "%"
      user = User.where('username LIKE ? ', query_string)
      render json: user
      # hash = params[:user].to_unsafe_h
      # user = User.where(hash)
      # render json: user
    else
      users = User.all
      render json: users
    end
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render plain: "could not update"
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {}
  end

  def favorite_artwork
    favs = Artwork.joins("JOIN artwork_shares on artworks.id = artwork_shares.artwork_id")
    .where('artist_id = ? OR viewer_id = ? AND artist_favorite = true OR viewer_favorite = true', params[:id], params[:id] ).distinct
    render json: favs
  end



  private

  def user_params
    params.require(:user).permit(:username)
  end
end
