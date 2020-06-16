class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    # n = Event.find(params[:event])
    # @appointment = Appointment.new(attendee_id: current_user.id, event_id: n.id)
    @appointment = Appointment.create(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to events_path, notice: 'Appointment was successfully created.' }
        # format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity } end
    end


  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    @appointment = @appointment.update(appointment_params)

    redirect_back(fallback_location: root_path)
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.permit(:attendee_id, :event_id, :status)
    end
end
