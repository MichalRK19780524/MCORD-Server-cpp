import sys
from server import Srv

if __name__ == '__main__':
    srv = Srv(sys.argv[1])
    srv.srv_handle(5555)
    del srv
