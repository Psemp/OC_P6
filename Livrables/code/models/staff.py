class Staff:

    def __init__(self, datadict):
        self.id = datadict['id']
        self.first_name = datadict['first_name']
        self.last_name = datadict['last_name']
        self.place_of_work_id = datadict['restaurant_address_id']
        self.role = datadict['role']
        self.is_on_shift = datadict['is_on_shift']
