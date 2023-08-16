class Api::V1::FacilitiesController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /facilities or /facilities.json
  def index
    @facilities = Facility.all
    render.json: @facilities
  end

  def show
    @facility = Facility.find(params[:id])
    render json: @facility
  end


  def new
    @facility = Facility.new
  end

  def edit
    @facility = Facility.find(params[:id])
  end
  
  def create
    @facility = Facility.new(facility_params)

    if @facility.save
      render json: @facility, status: :created, location: @facility
    else
      render json: @facility.errors, status: :unprocessable_entity
    end
  end

  def update
    @facility = Facility.find(params[:id])
    if @facility.update(facility_params)
      render json: @facility
    else
      render json: @facility.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
  end

  private

  def set_facility
    @facility = Facility.find(params[:id])
  end

  def facility_params
    params.require(:facility).permit(:facility_name, :facility_phone_number, :facility_location, :facility_description)
  end
end
