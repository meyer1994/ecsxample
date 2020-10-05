from pydantic import BaseModel

from app import app
from app.db import User


class PostUser(BaseModel):
    username: str
    password: str


@app.post('/users')
async def post_user(user: PostUser):
    user = user.dict()
    user = await User.objects.create(**user)
    return user


@app.get('/users/{uid}')
async def get_user(uid: int):
    return await User.objects.get(pk=uid)


@app.get('/users')
async def get_user():
    return await User.objects.all()
