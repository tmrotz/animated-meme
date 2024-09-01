from enum import Enum, unique


@unique
class Role(Enum):
    ADMIN = 1
    WORKER = 2
    CLIENT = 3

    @classmethod
    def isAdmin(cls, role_id):
        if role_id is None:
            return False
        elif role_id == cls.ADMIN:
            return True
        else:
            return False

    @classmethod
    def isWorker(cls, role_id):
        if role_id is None:
            return False
        elif role_id == cls.WORKER:
            return True
        else:
            return False

    @classmethod
    def isClient(cls, role_id):
        if role_id is None:
            return False
        elif role_id == cls.CLIENT:
            return True
        else:
            return False
