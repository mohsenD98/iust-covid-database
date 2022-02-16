import datetime

import mongoengine


class Admin(mongoengine.Document):
    created = mongoengine.DateTimeField(default=datetime.datetime.now)
    firstName = mongoengine.StringField(required=True)
    lastName = mongoengine.StringField(required=True)
    natId = mongoengine.StringField(required=True)
    gender = mongoengine.StringField(required=True)
    address = mongoengine.StringField(required=False)
    phone = mongoengine.StringField(required=False)
    role = mongoengine.BooleanField(required=False)
    email = mongoengine.StringField(required=False)

    meta = {
        'db_alias': 'core',
        'collection': 'admins',
        'indexes': [
            'created',
            'natId',
            'email',
        ],
        'ordering': ['name']
    }

    def __str__(self):
        return "[Admin] " + self.firstName + " " + self.lastName + " | phone : " + self.phone + " | natId: " + self.natId