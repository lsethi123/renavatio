class VitalSignsController < ApplicationController
  # GET /vital_signs
  # GET /vital_signs.json
  def index
    @vital_signs = VitalSign.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vital_signs }
    end
  end

  # GET /vital_signs/1
  # GET /vital_signs/1.json
  def show
    @vital_sign = VitalSign.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vital_sign }
    end
  end

  # GET /vital_signs/new
  # GET /vital_signs/new.json
  def new
    @vital_sign = VitalSign.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vital_sign }
    end
  end

  # GET /vital_signs/1/edit
  def edit
    @vital_sign = VitalSign.find(params[:id])
  end

  # POST /vital_signs
  # POST /vital_signs.json
  def create
    @vital_sign = VitalSign.new(params[:vital_sign])

    respond_to do |format|
      if @vital_sign.save
        format.html { redirect_to @vital_sign, notice: 'Vital sign was successfully created.' }
        format.json { render json: @vital_sign, status: :created, location: @vital_sign }
      else
        format.html { render action: "new" }
        format.json { render json: @vital_sign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vital_signs/1
  # PUT /vital_signs/1.json
  def update
    @vital_sign = VitalSign.find(params[:id])

    respond_to do |format|
      if @vital_sign.update_attributes(params[:vital_sign])
        format.html { redirect_to @vital_sign, notice: 'Vital sign was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vital_sign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vital_signs/1
  # DELETE /vital_signs/1.json
  def destroy
    @vital_sign = VitalSign.find(params[:id])
    @vital_sign.destroy

    respond_to do |format|
      format.html { redirect_to vital_signs_url }
      format.json { head :no_content }
    end
  end
end
