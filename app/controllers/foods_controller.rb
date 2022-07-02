class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      flash[:success] = 'You have successfully created a new food'
      redirect_to foods_path
    else
      flash.now[:error] = 'Error: Food could not be added'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      flash[:success] = 'Food have been deleted.'
      redirect_to foods_path
    else
      flash[:error] = 'Something went wrong'
      render :show
    end
  end

  def food_params
    my_food = params.require(:food).permit(:name, :measurement_unit, :price)
    my_food[:user] = current_user
    my_food
  end
end
