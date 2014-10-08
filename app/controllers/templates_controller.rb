class TemplatesController < ApplicationController
  def serve
    render params[:name]
  end
end
