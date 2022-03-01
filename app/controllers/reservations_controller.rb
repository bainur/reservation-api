class ReservationsController < ApplicationController
  def create
    reservation_service = ReservationService.new(params)

    if reservation_service.save
      render json: {
        data: reservation_service.reservation,
        status: 'success'
      }, status: :created
    else
      render json: {
        message: reservation_service.errors,
        status: 'failed'
      }, status: :unprocessable_entity
    end
  end

end
