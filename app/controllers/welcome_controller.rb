class WelcomeController < ApplicationController
skip_before_filter :require_login #,  :id_check

end


