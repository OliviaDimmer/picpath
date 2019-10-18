class ShootsController < ApplicationController
  before_action :set_shoot, only: [:show, :edit, :update, :destroy]

  # GET /shoots
  # GET /shoots.json
  def index
    @shoots = Shoot.all
  end

  # GET /shoots/1
  # GET /shoots/1.json
  def show
  end

  # GET /shoots/new
  def new
    @shoot = Shoot.new
  end

  # GET /shoots/1/edit
  def edit
  end

  # POST /shoots
  # POST /shoots.json
  def create
    # @shoot = Shoot.new(shoot_params)
    # @post.user_name = current_user

    respond_to do |format|
      if @shoot.save
        format.html { redirect_to @shoot, notice: 'Shoot was successfully created.' }
        format.json { render :show, status: :created, location: @shoot }
      else
        format.html { render :new }
        format.json { render json: @shoot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoots/1
  # PATCH/PUT /shoots/1.json
  def update
    respond_to do |format|
      if @shoot.update(shoot_params)
        format.html { redirect_to @shoot, notice: 'Shoot was successfully updated.' }
        format.json { render :show, status: :ok, location: @shoot }
      else
        format.html { render :edit }
        format.json { render json: @shoot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoots/1
  # DELETE /shoots/1.json
  def destroy
    @shoot.destroy
    respond_to do |format|
      format.html { redirect_to shoots_url, notice: 'Shoot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ics_export
    @event = Shoot.find(params[:id])
    cal = Icalendar::Calendar.new
    cal.event do |e|
      e.dtstart     = Icalendar::Values::Date.new('20050428')
      e.dtend       = Icalendar::Values::Date.new('20050429')
      e.summary     = "Meeting with the man."
      e.description = "Have a long lunch meeting and decide nothing..."
      e.ip_class    = "PRIVATE"
      # e.dtstart = @shoot.start
      # e.dtend = @shoot.end
      # e.summary = @shoot.slug
      # e.description = @shoot.assignment_description
      # e.location = @shoot.location
    end
    cal.publish
    send_data cal.to_ical, type: 'text/calendar', disposition: 'attachment', filename: 'NewEvent'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoot
      @shoot = Shoot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shoot_params
      params.require(:shoot).permit(:slug, :assignment_description, :start, :end, :location, :contact_name, :contact_phone, :deadline, :user_name)
    end
end
