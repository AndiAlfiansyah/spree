module Spree
  module Admin
    class ImportExportsController < ResourceController
      def index
        unless params[:type].present?
          redirect_to admin_import_exports_path(type: 'Product') and return
        end

        @resource   = eval(params[:type])
        @search     = @resource.ransack(params[:q])
        
        if params[:created_at_gt] && params[:created_at_lt].present?
          from_date   = Date.parse(params[:created_at_gt])
          to_date     = Date.parse(params[:created_at_lt])
          @resources  = @resource.where(created_at: from_date.beginning_of_day..to_date.end_of_day)
        else
          @resources  = @search.result
        end

      end

    end
  end
end