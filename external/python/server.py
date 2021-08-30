# import _thread
import socket
import json


BUFFER_SIZE = 1024
HOST = '127.0.0.1'
DISCONNECTED_MESSAGE = '!disconnect'


class Srv:
    def __init__(self, case):
        self.case = case

    def __str__(self):
        return f'AFE HUB {self.case}'

    def initialization(self, bar_id):
        if self.case == "p1":
            if bar_id == 9:
                return ['OK', [57.5, 58.5]]
            else:
                return ['ERR', {'id': 1, 'message': f'Detection bar number {bar_id} has not been found'}]

    @staticmethod
    def send_msg(cl, msg):
        cl.sendall((json.dumps(msg)).encode("utf8"))

    def srv_handle(self, port):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.bind((HOST, port))
            s.listen()
            conn, addr = s.accept()
            with conn:
                print('Connected by', addr)
                Srv.send_msg(conn, ('Client connected with %s' % HOST))
                while True:
                    try:
                        data = conn.recv(BUFFER_SIZE)
                        cmd = json.loads(data)
                        print(cmd[0])
                        if cmd[0] == DISCONNECTED_MESSAGE:
                            break
                        res = func[cmd[0]](self, cmd[1])
                    except Exception as e:
                        res = ('ERR', str(e))
                    Srv.send_msg(conn, res)


# Table of functions
func = {
    'init': Srv.initialization,
}