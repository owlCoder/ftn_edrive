import socket

def start_client():
    print("Unesite izraz: ")
    exp = input()

    print(send_expression(exp))


def send_expression(expression):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    host = socket.gethostname()
    port = 9999

    s.connect((host, port))
    s.send(expression.encode('ascii'))
    result = s.recv(1024)
    s.close()

    return result.decode('ascii')