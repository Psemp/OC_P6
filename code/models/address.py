class Address:

    def __init__(self, datadict):
        self.ident = datadict['id']
        self.strt_name = datadict['street_name']
        self.strt_nbr = datadict['street_nbr']
        self.city = datadict['city']
        self.zip = datadict['zip']
        self.rest = datadict['is_restaurant']
        self.comment = datadict['comment']
