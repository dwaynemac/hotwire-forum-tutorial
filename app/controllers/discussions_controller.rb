class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  def index
    @discussions = Discussion.order(updated_at: :desc).all
  end

  def new
    @discussion = Discussion.new
  end

  def show

  end

  def create
    @discussion = Discussion.new(discussion_params)
    respond_to do |format|
      if @discussion.save
        format.html do
          redirect_to @discussion, notice: "discussion created"
        end
      else
        format.html do
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        @discussion.broadcast_replace(partial: "discussions/header", locals: {discussion: @discussion})
        format.html do
          redirect_to @discussion, notice: "discussion updated"
        end
      else
        format.html do
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @discussion.destroy!
    redirect_to discussions_path, notice: "discussion deleted"
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def discussion_params
    params.require(:discussion).permit(:name, :closed, :pinned)
  end
end
