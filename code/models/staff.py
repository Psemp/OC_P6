class Staff:

    def __init__(self, datadict):
        self.ident = datadict['id']
        self.first_name = datadict['first_name']
        self.last_name = datadict['last_name']
        self.restaurant_address_id = datadict['restaurant_address_id']
        self.role = datadict['role']
        self.is_on_shift = datadict['is_on_shift']
