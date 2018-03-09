module Spree
  module Admin
    class Export::Xlsx::ResourceController < Export::BaseController
      before_action :set_resource, only: :index
      before_action :set_resources, only: :index

      def index
        puts "Start"
        respond_to do |format|
          puts "respond_to 1"
          format.xlsx { set_attachment_name "#{@resource} Data #{Time.now.utc.strftime('%Y%M%d%H%M%S')}.xlsx" }
          puts "respond_to 2"
        end
      end

      private
        def set_resource
          puts "set_resource 1"
          @resource   = eval(params[:model])
          puts "set_resource 2"
        end

        def set_resources
          puts "set_resources 1"
          @resources  = Spree::Product.all
          puts "set_resources 2"
        end
    end
  end
end
