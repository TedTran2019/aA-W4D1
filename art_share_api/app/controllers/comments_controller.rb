class CommentsController < ApplicationController
  # artwork_id or user_id
  def index
    if params[:artwork_id]
      artwork = Artwork.find_by(id: params[:artwork_id])
      if artwork
        render json: artwork.comments
      else
        render json: "Artwork not found!", status: :not_found
      end
    elsif params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user
        render json: user.comments
      else
        render json: "User not found!", status: :not_found
      end
    else
      render json: Comment.all
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment
      render json: comment
    else
      render json: "Not found", status: :not_found
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author_id, :artwork_id)
  end
end
