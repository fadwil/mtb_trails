class TrailSystemsController < ApplicationController
  def index
    @systems = TrailSystem.all
  end
end