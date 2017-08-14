class Api::JobsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    jobs = Job.all
    render :json =>
      {
        code: 200,
        messages: [],
        result: jobs
      }, status: :ok
  end

  def show
    @job = Job.find(params[:id])
    if @job.save
      render :json =>
      {
        code: 200,
        messages: [],
        result: @job
      }, status: :ok
    end
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render :json =>
      {
        code: 201,
        messages: [],
        result: @job
      }, status: :created
    else
      render :json =>
      {
        code: 422,
        messages: @job.errors.full_messages,
        result: []
      }, status: :unprocessable_entity
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update_attributes(job_params)
    if @job.save
      render :json =>
      {
        code: 200,
        messages: ["Job successfully updated."],
        result: @job
      }, status: :ok
    else
      render :json =>
      {
        code: 422,
        messages: @job.errors.full_messages,
        result: []
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      render :json =>
      {
        code: 200,
        messages: ["Job successfully deleted."],
        result: []
      }, status: :ok
    end
  end

  def not_found
    render :json =>
    {
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
