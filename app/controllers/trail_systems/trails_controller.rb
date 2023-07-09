class TrailSystems::TrailsController < ApplicationController
  def index
    @system = TrailSystem.find(params[:id])
    @trails = @system.trails
  end
end