class Api::JobsController < ApplicationController

  def index
    @jobs = Job.all
    render :json =>
      {
        status: "ok",
        code: 200,
        messages: [],
        result: @jobs.map { |job| job.serialize }
      }, status: :ok
  end

  def show
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render :json =>
      {
        status: "ok",
        code: 200,
        messages: [],
        result: @job.serialize
      }, status: :created
    else
      render :json =>
      {
        status: "errors",
        code: 422,
        messages: @job.errors.full_messages,
        result: []
      }, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private
    def job_params
      params.require(:job).permit(:title, :details, :category_name, :location_attributes => [:id, :city, :state])
    end

end
