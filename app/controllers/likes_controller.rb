require_relative '../helpers/likes_helper'
class LikesController < ApplicationController
  before_action :set_like, only: [:show, :update, :destroy]

  # GET /likes, returns a number of likes for the specified post id
  def index
    count = LikesHelper::LikesHelperService.new.get_likes_with_post_id(params[:post_id])
    render json: { 'likes': count }
  end

#   def get_post_likes
#     count = LikesHelper::LikesHelperService.new.get_likes_with_post_id(params[:post_id])
#     render json: { 'likes': count}
#
#   end

  # GET /likes/1
  def show
    render json: @like
  end

  # POST /likes
  def create
    @like = Like.new(like_params)

    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /likes/1
  def update
    if @like.update(like_params)
      render json: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def like_params
      params.require(:like).permit(:post_id, :user_id)
    end
end
