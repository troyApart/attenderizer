class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def isAttending(guest_id)
    rsvps = Rsvp.all
    rsvps.each do |rsvp|
      if guest_id == rsvp.guest_id
        if rsvp.answer != nil
          if rsvp.answer == true
            return true
          else
            return false
          end
        else
          return nil
        end
      else
        return "not found"
      end
    end
  end
  helper_method :isAttending

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @guests = @event.guests
  end

  # GET /events/new
  def new
    @event = Event.new
    @guests = Guest.all
  end

  # GET /events/1/edit
  def edit
    @guests = Guest.all
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    if params["invited"]
      invited_ids = params["invited"].map {|id_string| id_string.to_i}
      @event.guest_ids = invited_ids
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if params["invited"]
      invited_ids = params["invited"].map {|id_string| id_string.to_i}
      @event.guest_ids = invited_ids
      @event.save
    end
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:details, :date, :time_interval, :time_of_last_send, :time_for_first_send)
    end
end
