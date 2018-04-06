class OrderFeedbacksController < ApplicationController
  before_action :set_order_feedback, only: %i[show edit update]

  # GET /order_feedbacks
  # GET /order_feedbacks.json
  def index
    @order_feedbacks = current_client.orders
  end

  # GET /order_feedbacks/1
  # GET /order_feedbacks/1.json
  def show;
  end


  # GET /order_feedbacks/1/edit
  def edit;
  end


  # PATCH/PUT /order_feedbacks/1
  # PATCH/PUT /order_feedbacks/1.json
  def update
    respond_to do |format|
      if @order_feedback.update(order_feedback_params)
        format.html {redirect_to @order_feedback, notice: 'Order feedback was successfully updated.'}
        format.json {render :show, status: :ok, location: @order_feedback}
      else
        format.html {render :edit}
        format.json {render json: @order_feedback.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order_feedback
    @order_feedback = OrderFeedback.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_feedback_params
    params.require(:order_feedback).permit(:title, :order_opinion, :feedback_body_text, :order_id, :_destroy)
  end
end
