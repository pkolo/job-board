class Api::JobsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

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
    @job = Job.find(params[:id])
    if @job.save
      render :json =>
      {
        status: "ok",
        code: 200,
        messages: [],
        result: @job.serialize
      }, status: :ok
    end
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render :json =>
      {
        status: "ok",
        code: 201,
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

  def not_found
    render :json =>
    {
      status: "errors",
      code: 404,
      messages: ["Record not found."],
      result: []
    }, status: :not_found
  end

  private
    def job_params
      params.require(:job).permit(:title, :details, :category_name, :location_attributes => [:id, :city, :state])
    end

end
