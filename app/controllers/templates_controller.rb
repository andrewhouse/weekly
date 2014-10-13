class TemplatesController < ApplicationController
  def serve
    render params[:name], layout: false
  end
end
