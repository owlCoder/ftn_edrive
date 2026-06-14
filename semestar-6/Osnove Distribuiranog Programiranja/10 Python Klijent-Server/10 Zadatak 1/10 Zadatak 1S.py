import socket

def start_server():
    serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    host = socket.gethostname()
    port = 9999

    serversocket.bind((host, port))
    serversocket.listen(5)

    while True:
        kanal, addr = serversocket.accept()
        print("Povezan klijent sa IP %s" % str(addr))

        msg = kanal.recv(1024).decode()
        msg = str(eval(msg))
        kanal.send(msg.encode('ascii'))

        kanal.close()

start_server()
