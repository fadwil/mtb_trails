class TrailSystemsController < ApplicationController
  def index
    @systems = TrailSystem.all
  end

  def show
    @system = TrailSystem.find(params[:id])
  end

  def trails_index
    @system = TrailSystem.find(params[:id])
    @trails = @system.trails
  end
end