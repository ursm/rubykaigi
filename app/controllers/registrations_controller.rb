class RegistrationsController < LocaleBaseController
  before_filter :registration_open

  caches_page :index

  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }

  def index
    year = params[:year]
    render :template => "registrations/#{year}/#{action_name}_#{params[:locale]}"
  end

  def registration_open
    unless registration_open?
      render :template => "registrations/2009/not_yet"
    end
    true
  end
end
