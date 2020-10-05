from fastapi import FastAPI

app = FastAPI()

from . import routes, db


@app.on_event('startup')
async def startup():
    await db.database.connect()


@app.on_event('shutdown')
async def startup():
    await db.database.disconnect()
