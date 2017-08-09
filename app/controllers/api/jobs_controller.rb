class Api::JobsController < ApplicationController

  def index
    render :json => {}, status: :ok
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
      params.require(:job).permit(:title, :details, :latitude, :longitude)
    end

end
