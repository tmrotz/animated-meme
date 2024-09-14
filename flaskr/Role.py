from enum import Enum, unique


@unique
class Role(Enum):
    ADMIN = 1
    WORKER = 2
    CLIENT = 3

    @classmethod
    def isAdmin(cls, role_id):
        if role_id == cls.ADMIN.value:
            return True
        return False

    @classmethod
    def isWorker(cls, role_id):
        if role_id == cls.WORKER.value:
            return True
        return False

    @classmethod
    def isClient(cls, role_id):
        if role_id == cls.CLIENT.value:
            return True
        return False

