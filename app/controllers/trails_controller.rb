class TrailsController < ApplicationController
  def index
    @trails = Trail.all.where(is_loop: true)
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    trail = Trail.find(params[:id])
    trail.update(trail_params)
    redirect_to "/trails/#{trail.id}"
  end

private
  def trail_params
    params.permit(:name, :is_loop, :distance, :difficulty)
  end
end