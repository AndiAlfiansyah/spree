module Spree
  module Admin
    class Export::Xlsx::ResourceController < Export::BaseController
      before_action :set_resource, only: :index
      before_action :set_resources, only: :index

      def index
        respond_to do |format|
          format.xlsx { set_attachment_name "#{@resource} Data #{Time.now.utc.strftime('%Y%M%d%H%M%S')}.xlsx" }
        end
      end

      private
        def set_resource
          @resource   = eval(params[:model])
        end

        def set_resources
          @resources  = @resource.all
        end
    end
  end
end
