import os

TEST_SERVER_MODE = os.environ.get('TEST_SERVER_MODE', '0').lower() == 'true'
RUN_AS_VM = False
