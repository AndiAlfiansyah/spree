module Spree
	module Admin
		class Import::Xlsx::ResourceController < ApplicationController
		  skip_before_action :verify_authenticity_token

		  def create
		    binding.pry
		    data =  Spree::Admin::Import::Xlsx::Resource.new(params[:file]).extract
		    render json: model.create(data)
		  end

		  def model
		    @model ||= eval(params[:type])
		  end
		end
	end
end