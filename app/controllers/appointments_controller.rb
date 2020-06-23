class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    @appointments = Appointment.all
  end

  def show; end

  def new
    @appointment = Appointment.new
  end

  def edit; end

  def create
    @appointment = Appointment.create(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to events_path, notice: 'Appointment was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity } end
    end
  end

  def update
    @appointment = @appointment.update(appointment_params)

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.permit(:attendee_id, :event_id, :status)
  end
end
