class WelcomeController < ApplicationController
  layout :set_layout
  
  def set_layout 
    signed_in? ? "application" : "devise"
  end
  
  def index
  end
  
end
