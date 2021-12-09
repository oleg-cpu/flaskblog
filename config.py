import os

class Config(object):
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'goog-key'
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    POSTS_PER_PAGE = 3