from typing import Optional, List

from ..data.admins import *
from ..data.users import *
from ..data.devices import *
from ..data.locations import *


class PackageService:
    @classmethod
    def find_user(cls, firstName, lastName):
        user = User.objects(firstName=firstName, lastName=lastName).first()
        if user:
            print(user)
            return [True, [user.firstName, user.lastName, user.phone, user.address,
                           user.natId, user.testRes, user.gender, user.email,
                           user.deviceId.__str__()]]
        else:
            return [False, [None]]

    @classmethod
    def find_admin(cls, firstName, lastName):
        user = Admin.objects(firstName=firstName, lastName=lastName).first()
        if user:
            print(user)
            return [True, [user.firstName, user.lastName, user.phone, user.address,
                           user.natId, user.gender, user.email]]
        else:
            return [False, [None]]

    def save_user(self, firstName, lastName, email, phoneNumber, address, gender, deviceId, covidResult, natId, lat, lon):
        device = Device()
        if covidResult == "true":
            device.deviceId = deviceId
            device.ownerNatId = natId
            device.save()

        user = User()
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.phone = phoneNumber
        user.testRes = (covidResult == "true")
        user.address = address
        user.gender = gender
        user.natId = natId
        location = Location()
        location.lon = float(lon)
        location.lat = float(lat)
        location.address =address
        location.save()
        user.location = location.id

        if covidResult == "true":
            user.deviceId = device.id
            print("device saved")
        user.save()

        return True

    def update_test_result(self, natId, res, deviceId):
        print("updating result")
        if res == "true":
            device = Device()
            device.deviceId = deviceId
            device.ownerNatId = natId
            device.save()

            User.objects(__raw__={'natId': natId}).update(__raw__={'$set': {'testRes': True}})
            User.objects(__raw__={'natId': natId}).update(__raw__={'$set': {'deviceId': deviceId}})
        else:
            User.objects(__raw__={'natId': natId}).update(__raw__={'$set': {'testRes': False}})
            User.objects(__raw__={'natId': natId}).update(__raw__={'$set': {'deviceId': ""}})

        return True

    def get_location_of_infected_users(self):
        print("loading infected users ...")
        lat_result = []
        lon_result = []
        user = User.objects(testRes=True)
        for a in user:
            # print(a)
            location = Location.objects(id=a.location)
            # print(location[0].lat)
            lat_result.append(location[0].lat)
            lon_result.append(location[0].lon)
        return [lat_result, lon_result]

    def show_map(self):
        lat_lon = self.get_location_of_infected_users()
        import folium

        def average(lst):
            return sum(lst) / len(lst)

        map = folium.Map(location=[average(lat_lon[0]), average(lat_lon[1])], zoom_start=14, control_scale=True)
        i = 0
        while i < len(lat_lon[0]) - 1:
            i += 1
            folium.Marker([lat_lon[0][i], lat_lon[1][i]], popup="asd").add_to(map)
        map.save("/home/mohsen/codes/covid19/project/covidDataBase/view/map.html")

        return True

