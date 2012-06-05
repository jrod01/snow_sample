class TweepstersController < ApplicationController
  # GET /tweepsters
  # GET /tweepsters.json
  def index
    @tweepsters = Tweepster.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweepsters }
    end
  end

  # GET /tweepsters/1
  # GET /tweepsters/1.json
  def show
    @tweepster = Tweepster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweepster }
    end
  end

  # GET /tweepsters/new
  # GET /tweepsters/new.json
  def new
    @tweepster = Tweepster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweepster }
    end
  end

  # GET /tweepsters/1/edit
  def edit
    @tweepster = Tweepster.find(params[:id])
  end

  # POST /tweepsters
  # POST /tweepsters.json
  def create
    @tweepster = Tweepster.new(params[:tweepster])

    respond_to do |format|
      if @tweepster.save
        format.html { redirect_to @tweepster, notice: 'Tweepster was successfully created.' }
        format.json { render json: @tweepster, status: :created, location: @tweepster }
      else
        format.html { render action: "new" }
        format.json { render json: @tweepster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tweepsters/1
  # PUT /tweepsters/1.json
  def update
    @tweepster = Tweepster.find(params[:id])

    respond_to do |format|
      if @tweepster.update_attributes(params[:tweepster])
        format.html { redirect_to @tweepster, notice: 'Tweepster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweepster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweepsters/1
  # DELETE /tweepsters/1.json
  def destroy
    @tweepster = Tweepster.find(params[:id])
    @tweepster.destroy

    respond_to do |format|
      format.html { redirect_to tweepsters_url }
      format.json { head :no_content }
    end
  end
end
