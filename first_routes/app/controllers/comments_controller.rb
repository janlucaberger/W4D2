class CommentsController < ApplicationController
  def index
    if params[:user_id]
      user_comments = Comment.where({commenter_id: params[:user_id]})
      render json: user_comments
    elsif params[:artwork_id]
      artwork_comments = Comment.where({artwork_id: params[:artwork_id]})
      render json: artwork_comments
    end
  end

  def create

  end

  def destroy
  end
end
