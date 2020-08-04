require 'test_helper'

class DrinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drink = drinks(:one)
  end

  test "should get index" do
    get drinks_url
    assert_response :success
  end

  test "should get new" do
    get new_drink_url
    assert_response :success
  end

  test "should create drink" do
    assert_difference('Drink.count') do
      post drinks_url, params: { drink: { bar_location: @drink.bar_location, bar_name: @drink.bar_name, bartender: @drink.bartender, ingredients: @drink.ingredients, name: @drink.name, taste: @drink.taste } }
    end

    assert_redirected_to drink_url(Drink.last)
  end

  test "should show drink" do
    get drink_url(@drink)
    assert_response :success
  end

  test "should get edit" do
    get edit_drink_url(@drink)
    assert_response :success
  end

  test "should update drink" do
    patch drink_url(@drink), params: { drink: { bar_location: @drink.bar_location, bar_name: @drink.bar_name, bartender: @drink.bartender, ingredients: @drink.ingredients, name: @drink.name, taste: @drink.taste } }
    assert_redirected_to drink_url(@drink)
  end

  test "should destroy drink" do
    assert_difference('Drink.count', -1) do
      delete drink_url(@drink)
    end

    assert_redirected_to drinks_url
  end
end
