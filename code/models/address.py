class Address:

    def __init__(self, datadict):
        self.id = datadict['id']
        self.street_name = datadict['street_name']
        self.street_number = datadict['street_nbr']
        self.city = datadict['city']
        self.zip_code = datadict['zip']
        self.is_restaurant = datadict['is_restaurant']
        self.comment = datadict['comment']
