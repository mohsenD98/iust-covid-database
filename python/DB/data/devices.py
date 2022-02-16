import datetime

import mongoengine


class Device(mongoengine.Document):
    created = mongoengine.DateTimeField(default=datetime.datetime.now)
    deviceId = mongoengine.StringField(required=True)
    ownerNatId =  mongoengine.StringField(required=True)
    meta = {
        'db_alias': 'core',
        'collection': 'devices',
        'indexes': [
            'created',
            'deviceId',
            'ownerNatId',
        ],
        'ordering': ['created']
    }

    def __str__(self):
        return "[device] " + self.deviceId + " " + self.ownerNatId
