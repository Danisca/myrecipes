require 'test_helper'
class RecipeTest < ActiveSupport::TestCase
	def setup
		#created one chef becuase is needded for create recipes
		@chef = Chef.create!(name:"danis",email:"dcanadablandon@gmail.com")
		@recipe = @chef.recipes.build(name: "Vegetable",description: "Great vegetable recipe")
	end

	test "recipe should be valid" do
		assert @recipe.valid?
	end

	test "recipe without chef should be invalid" do
		#this test could pass if there is an explicit validates :chef_id, presence: true
		@recipe.chef_id = nil
		assert_not @recipe.valid? 
	end

	test "name should be present" do
		@recipe.name = " "
		assert_not @recipe.valid? #assert not is waiting for a FALSE return and the method return FALSE
	end

	test "description should be present" do
		@recipe.description = " "
		assert_not @recipe.valid? #assert not is waiting for a FALSE return and the method return FALSE
	end

	#minimun leght for name and description
	test "description shouldn't be less than 5 characters" do
		@recipe.description = "a" * 3
		assert_not @recipe.valid?
	end

	test "description shouldn't be more than 500 characters" do
		@recipe.description = "a" * 501
		assert_not @recipe.valid?
	end

end