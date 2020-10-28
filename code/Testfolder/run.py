from models_test.someclass import Customer

c1 = Customer(1,"Pepito","Sanchez")

attr_names = ""
variables = Customer.__dict__.keys()

for key in variables:
    print(key, type(key))
    attr_names = attr_names+key+", "

print(attr_names, type(attr_names))
