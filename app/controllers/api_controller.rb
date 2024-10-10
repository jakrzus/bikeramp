class ApiController < ActionController::API
  def render_error(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end
end
