class Api::V1::Private::SchedulingController < ApplicationController
  before_action :doorkeeper_authorize!

=begin
  @api {post} api/v1/private/scheduling Create service scheduling
  @apiName CreateScheduling
  @apiGroup Scheduling

  @apiParam {Object} scheduling
  @apiParam {Number} scheduling[stablishment_id]
  @apiParam {Number} scheduling[user_id]
  @apiParam {Number} scheduling[professional_id]
  @apiParam {Number} scheduling[product_id]
  @apiParam {String} scheduling[start]

  @apiSuccess {Object} scheduling
  @apiSuccess {Number} scheduling[id]
  @apiSuccess {Number} scheduling[stablishment_id]
  @apiSuccess {Number} scheduling[user_id]
  @apiSuccess {Number} scheduling[professional_id]
  @apiSuccess {Number} scheduling[product_id]
  @apiSuccess {String} scheduling[start]
=end
  def create
    params_scheduling = JSON.parse(params[:scheduling])
    aux = 1
    while aux <= params_scheduling['quantity'].to_i

      establishment = Establishment.find(params_scheduling['establishment_id'])
      user = current_user

      product = Product.find( params_scheduling['product_id'] )

      scheduling = Scheduling.new()
      scheduling.user = user
      scheduling.establishment = establishment
      scheduling.product = product

      scheduling.save
      aux = aux + 1
    end
  end

  def destroy
    scheduling = Scheduling.find(params[:id])
    if scheduling.destroy
      render json: scheduling, status: :ok
    end
  rescue => e
    Rails.logger.error '====================== ERROR ======================'
    Rails.logger.error e.message
    render json: {"status": "error", "message": e.message}, status: :internal_server_error
  end

  def update
    scheduling = Scheduling.find(params[:id])
    scheduling.status = params[:status]
    if scheduling.save 
      render json: scheduling, status: :ok
    end 

  rescue => e
    Rails.logger.error '====================== ERROR ======================'
    Rails.logger.error e.message
    render json: {"status": "error", "message": e.message}, status: :internal_server_error
  end


  def show_by_user 
    schedulings = Scheduling.where(user_id: current_user.id)
    render json: schedulings, status: :ok
  end
end
