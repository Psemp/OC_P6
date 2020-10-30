class Pizza:

    def __init__(self, datadict):
        self.ident = datadict['id']
        self.name = datadict['name']
        self.price = datadict['price']
