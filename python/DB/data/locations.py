import datetime

import mongoengine


class Location(mongoengine.Document):
    created = mongoengine.DateTimeField(default=datetime.datetime.now)
    address = mongoengine.StringField(required=True)
    lat = mongoengine.FloatField(required=True)
    lon = mongoengine.FloatField(required=True)
    meta = {
        'db_alias': 'core',
        'collection': 'locations',
        'indexes': [
            'created',
            'lat',
            'lon',
        ],
        'ordering': ['created']
    }

    def __str__(self):
        return "[location] " + self.address + " | lat: " + str(self.lat) + " | lon: "+ str(self.lon)
