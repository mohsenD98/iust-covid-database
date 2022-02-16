from data.users import *
from data.admins import *
from data.locations import *
from data.devices import *
import mongoengine
import random as r
import names
import csv


mongoengine.register_connection(alias='core', name="test")

# ###################################################
# #################### user data ####################
# ###################################################

file = open("data.csv")
csvreader = csv.reader(file)
header = next(csvreader)
print(header)
rows = []
for row in csvreader:
    loc = Location()
    loc.lat = float(row[3])
    loc.lon = float(row[4])
    loc.address = row[2]
    loc.save()

    user = User()
    user.natId = row[0]
    user.firstName = names.get_first_name()
    user.lastName = names.get_last_name()
    user.email = row[1]+"@yahoo.com"
    ph_number = "+" + str(r.randint(6, 9))
    for i in range(1, 10):
        ph_number += str(r.randint(0, 9))
    user.phone = ph_number
    user.address = row[2]

    if r.randint(6, 9) % 2 == 0:
        user.testRes = True
        device = Device()
        device.ownerNatId = user.natId
        dId = ""
        for i in range(1, 10):
            dId += str(r.randint(0, 9))
        device.deviceId = dId
        device.save()
        user.deviceId =device.id
    else:
        user.testRes = False

    if r.randint(6, 9)%2 == 0:
        user.gender = "male"
    else:
        user.gender = "female"
    user.location = loc.id
    print(user)
    user.save()
file.close()



user2 = User()
user2.firstName = "mohsen"
user2.lastName = "dh"
user2.email = "dh@yahoo.com"
user2.phone = "+98030152570"
user2.testRes = False
user2.address = "tehran - ... - 1"
user2.gender = "male"
user2.natId = "2910....97"
user2.save()

user3 = User()
user3.firstName = "reyhane"
user3.lastName = "barfeh"
user3.email = "fateme_akbari@yahoo.com"
user3.phone = "+98030152572"
user3.testRes = False
user3.address = "tehran - ... - 1"
user3.gender = "female"
user3.natId = "2910....98"
user3.save()

# ###################################################
# #################### admin data ###################
# ###################################################
#
admin = Admin()
admin.firstName = "admin1"
admin.lastName = "admin1"
admin.email = "mohsen_d98@yahoo.com"
admin.phone = "+9803015****"
admin.address = "tehran - ... - 1"
admin.gender = "male"
admin.natId = "2910....96"
admin.save()

admin2 = Admin()
admin2.firstName = "admin2"
admin2.lastName = "admin2"
admin2.email = "alireza@yahoo.com"
admin2.phone = "+9803015****"
admin2.address = "tehran - ... - 1"
admin2.gender = "male"
admin2.natId = "2910....97"
admin2.save()

admin3 = Admin()
admin3.firstName = "admin3"
admin3.lastName = "admin3"
admin3.email = "fateme_akbari@yahoo.com"
admin3.phone = "+9803015****"
admin3.address = "tehran - ... - 1"
admin3.gender = "female"
admin3.natId = "2910....98"
admin3.save()
