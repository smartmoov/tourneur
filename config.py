# config

class Configuration(object):
    DATABASE = {
        'name': 'tourneur',
        'engine': 'peewee.MySQLDatabase',
        'user': 'admin',
        'passwd': 'My7PassWord_9_8A_zE',
        'host': 'localhost',
        'port': 3306,
        'charset': 'utf8mb4',
    }
    DEBUG = True
    SECRET_KEY="oEgnMoTTEf7htb2UMoXf"
    