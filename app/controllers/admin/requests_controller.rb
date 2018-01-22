class Admin::RequestsController < Admin::BaseController

  def index
    @requests = Request.order("created_at asc").paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
  end

  def destroy
    @request = Request.find_by id: params[:id]
    if !current_user.admin?
      flash[:danger] = t "flash.permission_access"
      redirect_to admin_requests_path
    else
      if @request.destroy
        flash[:success] = t "flash.destroy_request_success"
      else
        flash[:danger] = t "flash.destroy_request_fail"
      end
      redirect_to admin_requests_path
    end
  end
end
