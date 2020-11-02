class Order_history:

    def __init__(self, datadict):
        self.id = datadict['account_id']
        self.order_number = datadict['order_nbr']
