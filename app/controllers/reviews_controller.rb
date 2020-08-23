class ReviewsController < ApplicationController
  before_action :get_drink
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  
  def index
    @reviews = Review.all
  end

  
  def show
  end

  
  def new
    @review = @drink.reviews.build
  end

  def edit
  end

  
  def create
    # review = Review.new(review_params)
    @review = @drink.reviews.build(review_params)
    @review.user_id = current_user.id
    # @review.drink_id = @drink_id

    respond_to do |format|
      if @review.save
        #redirect_to @drink
        format.html { redirect_to drink_path(@drink), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        #render 'new'
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @review.destroy
    #redirect_to root_path
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def get_drink
    @drink = Drink.find(params[:drink_id])
  end
    
    def set_review
      @review = @drink.reviews.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
