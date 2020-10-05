import orm
import databases
import sqlalchemy

from . config import Config

database = databases.Database(Config.postgres)
metadata = sqlalchemy.MetaData()


class User(orm.Model):
    __tablename__ = 'user'
    __database__ = database
    __metadata__ = metadata

    id = orm.Integer(primary_key=True)
    username = orm.String(max_length=100)
    password = orm.String(max_length=100)


engine = sqlalchemy.create_engine(Config.postgres)
metadata.create_all(engine)
