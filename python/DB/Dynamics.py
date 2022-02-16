from data.users import *
from data.admins import *
from data.locations import *
from data.devices import *
import mongoengine

mongoengine.register_connection(alias='core', name="test")

# find
# user = User.objects(firstName=firstName, lastName=lastName).first()

# create:
# device = Device()
# device.deviceId = deviceId
# device.ownerNatId = natId
# device.save()

# update:
# User.objects(__raw__={'natId': natId}).update(__raw__={'$set': {'testRes': True}})

# delete:
# user = Admin.objects(firstName= "admin3", lastName="admin3").first()
# print(user)
# user.delete()
