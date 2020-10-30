class Order:

    def __init__(self, datadict):
        self.ident = datadict['id']
        self.date_ordered = datadict['date_ordered']
        self.is_paid = datadict['is_paid']
        self.is_delivery = datadict['is_delivery']
        self.stage = datadict['stage']
        self.cx_comment = datadict['cx_comment']
