class Restaurant:

    def __init__(self, datadict):
        self.id = datadict['id']
        self.address_id = datadict['address_id']
        self.name = datadict['name']
        self.phone_number = datadict['phone_nbr']
        self.is_open = datadict['is_open']
