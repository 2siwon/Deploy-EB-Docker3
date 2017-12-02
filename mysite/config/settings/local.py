import random
import string

from .base import *

ALLOWED_HOSTS = [
    'localhost',
    '127.0.0.1',
    '.elasticbeanstalk.com',
    '.siwon.me',
]

DATABASES = config_secret_common['django']['databases']

SECRET_KEY = ''.join(
    [random.choice(string.ascii_lowercase) for i in range(40)])