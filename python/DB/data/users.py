import datetime

import mongoengine


class User(mongoengine.Document):
    created = mongoengine.DateTimeField(default=datetime.datetime.now)
    firstName = mongoengine.StringField(required=True)
    lastName = mongoengine.StringField(required=True)
    natId = mongoengine.StringField(required=True)
    gender = mongoengine.StringField(required=False)
    address = mongoengine.StringField(required=False)
    phone = mongoengine.StringField(required=False)
    testRes = mongoengine.BooleanField(required=False)
    email = mongoengine.StringField(required=False)
    deviceId = mongoengine.ObjectIdField()
    location = mongoengine.ObjectIdField()

    meta = {
        'db_alias': 'core',
        'collection': 'users',
        'indexes': [
            'created',
            'natId',
            'email',
        ],
        'ordering': ['name']
    }

    def __str__(self):
        return "[User] " + self.firstName + " " + self.lastName + " | phone : " + self.phone + " | natId: " + self.natId
