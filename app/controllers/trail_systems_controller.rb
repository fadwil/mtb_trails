class TrailSystemsController < ApplicationController
  def index
    @systems = TrailSystem.all
  end

  def show
    @system = TrailSystem.find(params[:id])
  end
end