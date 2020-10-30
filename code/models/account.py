class Account:

    def __init__(self, datadict):
        self.ident = datadict['id']
        self.acc_type = datadict['type']
        self.phone = datadict['phone_number']
        self.mail = datadict['email']
        self.pwd = datadict['pwd_hash']
