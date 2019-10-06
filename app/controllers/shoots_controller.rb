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
    respond_to do |format|
      format.html
      format.ics do
        cal = Icalendar::Calendar.new
           event = Icalendar::Event.new
           event.dtstart = @shoot.start
           event.dtend = @shoot.end
           event.summary = @shoot.slug
           event.description = @shoot.assignment_description
           event.location = @shoot.location
           cal.add_event(event)
           cal.publish
           render :plain =>  cal.to_ical
       end
     end
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
