module API
  module V1
    class YieldCurveSnapshotsController < ActionController::API

      API_FIELDS=[
        :treasury_datum_id,
        :yield_curve_date,
        :yield_1m,
        :yield_3m,
        :yield_6m,
        :yield_1y,
        :yield_2y,
        :yield_3y,
        :yield_5y,
        :yield_7y,
        :yield_10y,
        :yield_20y,
        :yield_30y,
      ]

      def show
        render json: YieldCurveSnapshot.select(API_FIELDS).where(yield_curve_date: as_of_date).to_json
      end

      private

      def as_of_date
        if params[:date].present?
          [Date.parse(params[:date], '%Y%m%d'), YieldCurveSnapshot.maximum(:yield_curve_date)].min
        else
          YieldCurveSnapshot.maximum(:yield_curve_date)
        end
      end
    end
  end
end