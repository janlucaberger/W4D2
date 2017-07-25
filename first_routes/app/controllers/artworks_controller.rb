class ArtworksController < ApplicationController
  def index
    artworks = Artwork.where({artist_id: params[:user_id]})
    artworks_shared = ArtworkShare.where({viewer_id: params[:user_id]})
    render json: {artworks_created: artworks, artworks_shared: artworks_shared}
  end

  def create
    new_artwork = Artwork.new(artwork_params)
    if new_artwork.save!
      render json: new_artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: {}

  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :img_url, :artist_id)
  end
end
