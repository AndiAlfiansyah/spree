module Spree
  module Export::Xlsx::Resource::Base
    extend ActiveSupport::Concern

	  class_methods do
	    def exort_attributes_for(type)
	      if type.eql?('xlsx')
	        no_need_to_show_attributes = [:image, :photo]
	        attribute_names.map(&:to_sym).reject { |a| no_need_to_show_attributes.include?(a) }
	      end
	    end
	  end
	end
end
