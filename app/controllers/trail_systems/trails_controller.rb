class TrailSystems::TrailsController < ApplicationController
  def index
    @system = TrailSystem.find(params[:id])
    @trails = @system.trails
  end

  def new
    @system = TrailSystem.find(params[:id])
  end
  
  def create
    trail_system = TrailSystem.find(params[:id])
    trail = trail_system.trails.create!(
      name: params[:name],
      is_loop: params[:is_loop],
      distance: params[:distance],
      difficulty: params[:difficulty])
    redirect_to "/trail_systems/#{trail_system.id}/trails"
  end

# private
#   def trail_params
#     params.permit(:name, :is_loop, :distance, :difficulty)
#   end
end