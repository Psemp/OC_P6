class Account:

    def __init__(self, datadict):
        self.id = datadict['id']
        self.type = datadict['type']
        self.phone_number = datadict['phone_number']
        self.email = datadict['email']
        self.password_hash = datadict['pwd_hash']
