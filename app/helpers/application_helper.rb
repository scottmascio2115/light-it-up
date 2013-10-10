module ApplicationHelper

  def svg(file)
    file = File.open("app/assets/images/#{file}.svg", "rb")
    raw file.read
  end

  # def session?
  #   session[:user_id] != nil
  # end

  # def session_user
  #   User.find(session[:user_id]) if session?
  # end

end
