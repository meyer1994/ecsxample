from pydantic import BaseSettings, Field


class Config(BaseSettings):
    postgres: str = Field('postgres://postgres@db', env='POSTGRES')


Config = Config()
