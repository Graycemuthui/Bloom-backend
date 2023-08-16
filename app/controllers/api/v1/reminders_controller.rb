class Api::V1::RemindersController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    @reminders = Reminder.all
    render.json: @reminders
  end

  def show
    @reminder = Reminder.find(params[:id])
    render json: @reminder
  end


  def new
    @reminder = Reminder.new
  end

  def edit
    @reminder = Reminder.find(params[:id])
  end

  def create
    @reminder = Reminder.new(reminder_params)

    if @reminder.save
      render json: @reminder, status: :created, location: @reminder
    else
      render json: @reminder.errors, status: :unprocessable_entity
    end
  end

  def update
    @reminder = Reminder.find(params[:id])
    if @reminder.update(reminder_params)
      render json: @reminder
    else
      render json: @reminder.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reminder
    @reminder = Reminder.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reminder_params
   params.require(:reminder).permit(:reminder_date)
  end
end
