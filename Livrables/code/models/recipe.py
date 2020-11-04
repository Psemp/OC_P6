class Recipe:

    def __init__(self, datadict):
        self.pizza_id = datadict['pizza_id']
        self.ingredient_list = datadict['ingredient_list']
        self.recipe_webpage = datadict['recipe_webpage']
