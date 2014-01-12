class VisitsController < ApplicationController
  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all
    render "shared/template"
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    @visit = Visit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visit }
    end
  end

  # GET /visits/new
  # GET /visits/new.json
  def new
    @visit = Visit.new
    @patient = Patient.find(params[:patient_id])
    @staffs = Staff.all.collect{|emp| ["#{emp.firstname} #{emp.lastname}", emp.id]}
    # staffs.each do |staff|
    #   staffs << ["#{staff.firstname} #{staff.lastname}", staff.id]
    # end
    render "shared/single"
  end

  # GET /visits/1/edit
  def edit
    @visit = Visit.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @staffs = Staff.all.collect{|emp| ["#{emp.firstname} #{emp.lastname}", emp.id]}
    render "shared/single"
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(params[:visit])
    @visit.patient_id = params[:patient_id]
    respond_to do |format|
      if @visit.save
        format.html{ redirect_to patient_visits_path(@visit.patient_id)}
      else
        format.html { render action: "new" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /visits/1
  # PUT /visits/1.json
  def update
    @visit = Visit.find(params[:id])

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to patient_visits_path(params[:patient_id]) }
      format.json
    end
  end

  private

  def set_visit_attestation(visit, date)
    # testing how to call controller private variable in rspec
    # visit.attestation_date = date
    # visit.update_attributes(:attestation_date => date)
  end

  def verify_visit_attestation(visit)
    visit.attestation_date?
  end

end
