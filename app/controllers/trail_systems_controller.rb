class TrailSystemsController < ApplicationController
  def index
    @systems = TrailSystem.all.order(created_at: :desc)
  end

  def show
    @system = TrailSystem.find(params[:id])
  end

  def create
    system = TrailSystem.create(system_params)
    redirect_to "/trail_systems"
  end

private
  def system_params
    params.permit(:name, :has_fee, :highest_trailhead)
  end
end