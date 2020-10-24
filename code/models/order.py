class Order:

    def __init__(self, ident, date_order, is_paid, is_dlivry, stage, comment):
        self.ident = ident
        self.date_ordered = date_order
        self.is_paid = is_paid
        self.is_delivery = is_dlivry
        self.stage = stage
        self.cx_comment = comment
