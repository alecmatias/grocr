class RegistrationsController < Devise::RegistrationsController

  def new
    resource = build_resource({})
    render :layout => false
  end

end
