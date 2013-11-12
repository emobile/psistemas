class WelcomeController < ApplicationController
  before_filter :set_icon
  layout :set_layout
  
  def set_layout 
    signed_in? ? "application" : "devise"
  end
  
  def index
  end
  
  def set_icon
    @icon = "home"
  end
  
end
