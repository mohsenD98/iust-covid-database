from PySide2.QtCore import QObject, Signal, Property, Slot, QThread
from DB.services.package_service import *

class WorkerThread(QThread, QObject):
    processDone = Signal(list)

    def __init__(self):
        QThread.__init__(self)

    def run(self):
        pass


class Manager(QObject):
    processResult = Signal(bool)
    saveUserResult = Signal(bool)
    mapSaved = Signal(bool)
    testResultUpdated = Signal(bool)
    authenticationResult = Signal(bool, list)
    infoResults = Signal(bool, list)

    def __init__(self):
        QObject.__init__(self)
        self.processingStarted = False

    @Slot()
    def start_processing(self):
        self.set_processing_started(True)
        self.thread.start()
        self.thread.processDone.connect(self.process_finished)

    def process_finished(self, res):
        self.processResult.emit(True)
        self.set_processing_started(False)

    def read_processing_started(self):
        return self.processingStarted

    def set_processing_started(self, val):
        self.processingStarted = val

    @Slot(str, str, str)
    def authentication(self, userType, userName, password):
        service = PackageService()
        result = False
        if userType == "User":
            result = service.find_user(userName, password)
        elif userType == "Admin":
            result = service.find_admin(userName, password)

        if result[0]:
            print("[OK] user found!")
            print(result[1])
            return self.authenticationResult.emit(True, result[1])
        else:
            print("[404] user NOT found!")
            return self.authenticationResult.emit(False, result[1])

    @Slot(str, str, str, str, str, str, str, str, str, str, str)
    def saveUser(self, firstName, lastName, email,phoneNumber, address, gender, deviceId, covidResult, natId, lat, lon):
        service = PackageService()
        result = False
        result = service.save_user(firstName, lastName, email,
                                   phoneNumber, address, gender,
                                   deviceId, covidResult, natId,
                                   lat, lon)
        if result:
            print("[OK] user saved!")
            return self.saveUserResult.emit(True)
        else:
            print("[404] user NOT found!")
            return self.saveUserResult.emit(False)

    @Slot(str, str)
    def getUserInfos(self, userName, password):
        service = PackageService()
        result = service.find_user(userName, password)
        if result[0]:
            print("[OK] user found!")
            print(result[1])
            return self.infoResults.emit(True, result[1])
        else:
            print("[404] user NOT found!")
            return self.infoResults.emit(False, result[1])

    @Slot(str, str, str)
    def updateTestReslt(self, natId, res, deviceId):
        service = PackageService()
        result = service.update_test_result(natId, res, deviceId)
        if result:
            print("[OK] test result updated")
            return self.testResultUpdated.emit(True)
        else:
            print("[405] cannot update test result ")
            return self.testResultUpdated.emit(False)

    processing = Property(str, read_processing_started, set_processing_started)


    @Slot()
    def saveNewMap(self):
        service = PackageService()
        res = service.show_map()
        if res:
            print("[OK] map saved!")
            return self.mapSaved.emit(True)
        else:
            print("[407] cannot save map!")
            return self.mapSaved.emit(False)
