class Customer:

    def __init__(self, datadict):
        self.ident = datadict['id']
        self.address_id = datadict['address_id']
        self.first_name = datadict['first_name']
        self.last_name = datadict['last_name']
