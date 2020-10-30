class Restaurant:

    def __init__(self, datadict):
        self.address_id = datadict['id']
        self.name = datadict['name']
        self.phone = datadict['phone_nbr']
        self.is_open = datadict['is_open']
