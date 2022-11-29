class FlightsController < ApplicationController
  def index
    @pagy, @flights = pagy(Flight.search(params[:search]))
    @tickets_num = params[:search] ? params[:search][:tickets_num] : 0
  end
end
