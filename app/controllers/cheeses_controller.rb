class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses, only: [:id, :name, :price, :is_best_seller]
  end

  # # OR... this does the same thing with EXCEPT...
  # def index
  #   cheeses = Cheese.all
  #   render json: cheeses, except: [:created_at, :updated_at]
  # end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: { error: 'The cheese stands alone, and you are the cheese' }, status: :not_found
    end
  end

end
