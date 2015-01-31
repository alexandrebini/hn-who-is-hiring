class Api::JobsController < Api::BaseController
  def index
    per_page = params[:per_page].to_i || 22
    @jobs = Job.recent.page(params[:page]).per_page(per_page)
    @pagination = { page: @jobs.current_page, per_page: @jobs.per_page,
      total_pages: @jobs.total_pages, total_entries: @jobs.count }
    render json: [@pagination, @jobs]
  end
end