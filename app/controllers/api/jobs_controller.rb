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
