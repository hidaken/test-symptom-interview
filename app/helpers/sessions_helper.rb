module SessionsHelper
  def current_user
    @current_user ||= Hospital.find_by(id: session[:hospital_id])
  end

  def logged_in?
    !!current_user
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end