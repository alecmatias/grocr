class SessionsController < Devise::SessionsController

  def new
    resource = build_resource({})
    render :layout => false
  end

end
