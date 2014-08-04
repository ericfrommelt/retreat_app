class GetawayContoller < ApplicationController

  def new
    @getaway = Getaway.new
      
  end
end
