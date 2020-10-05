import orm
import databases
import sqlalchemy


database = databases.Database('postgres://postgres@db')
metadata = sqlalchemy.MetaData()


class User(orm.Model):
    __tablename__ = 'user'
    __database__ = database
    __metadata__ = metadata

    id = orm.Integer(primary_key=True)
    username = orm.String(max_length=100)
    password = orm.String(max_length=100)


url = str(database.url)
engine = sqlalchemy.create_engine(url)
metadata.create_all(engine)
