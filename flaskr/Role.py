from enum import Enum, unique


@unique
class Role(Enum):
    ADMIN = 1
    WORKER = 2
    CLIENT = 4

    @classmethod
    def isAdmin(cls, role_id: int):
        return role_id == cls.ADMIN.value

    @classmethod
    def isWorker(cls, role_id: int):
        return role_id == cls.WORKER.value

    @classmethod
    def isClient(cls, role_id: int):
        return role_id == cls.CLIENT.value

