class Api::JobsController < Api::BaseController
  def index
    @jobs = Job.recent.limit(10)
    render json: @jobs
  end
end