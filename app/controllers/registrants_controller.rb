class RegistrantsController < ApplicationController
  respond_to :html, :json
  def new
    @registrant = Registrant.new
  end

  def create
    @registrant = Registrant.new(params[:registrant])
    @registrant.save
    respond_with @registrant

  end

  def show
  end

  def index
  end
end

