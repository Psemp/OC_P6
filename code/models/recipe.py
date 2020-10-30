class Recipe:

    def __init__(self, datadict):
        self.pizza_id = datadict['pizza_id']
        self.ingredient_id = datadict['ingredient_id']
        self.recipe_webpage = datadict['recipe_webpage']
