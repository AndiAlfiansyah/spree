module Spree
	module Admin
		module Import
			class Xlsx::ResourceController < ApplicationController
			  skip_before_action :verify_authenticity_token

				def create
				  data =  extract
				  render json: model.create(data)
				end

				def model
				  @model ||= eval(params[:type])
				end

				def extract
					file = params[:import_export][:file]
				  xlsx  = Roo::Spreadsheet.open(file)
				  sheet = xlsx.sheet(0) # What an assumption ^_^
				  attrs = sheet.row(1)
				  data = sheet.parse(header_search: attrs).map do |d|
				    d.map {|k, v| [k.parameterize.underscore.to_sym , v] }.to_h.except :id
				  end
				end

				private
				attr_reader :file

			end
		end
	end
end