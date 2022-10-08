class MainController < ApplicationController
  def index
  end

  def test_flash
    flash.now[:notice] = "hello"
    flash.now[:alert] = "world"
    index
    render action: :index
  end
end
