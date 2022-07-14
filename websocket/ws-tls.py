#!/usr/bin/python
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
bg_red='\033[0;41m'
bg_green='\033[0;42m'
bg_yellow='\033[0;43m'
bg_blue='\033[0;44m'
bg_magenta='\033[0;45m'
bg_cyan='\033[0;46m'
import socket, threading, thread, select, signal, sys, time, getopt

# Listen
LISTENING_ADDR = '0.0.0.0'
LISTENING_PORT = sys.argv[1]

# Pass
PASS = ''

# CONST
BUFLEN = 4096 * 4
TIMEOUT = 60
DEFAULT_HOST = '127.0.0.1:2087'
RESPONSE = 'HTTP/1.1 101 <b><font color="red">SUN AMATAK AJIKU SI JARAN GOYANG TAK GOYANG ING TENGAH LATAR CEMETHIKU SODHO LANANG SAKING SWARGO TAK SABETAKE GUNUNG JUGRUG TAK SABETAKE SEGORO ASAT TAK SABETAKE MARANG ATINE SI JABANG BAYI PET SIDHO EDAN ORA EDAN SIDHO GENDENG ORA GENDENG ORA MARI MARI YEN ORA INGSUN SING NAMBANI </font></b>\r\n\r\nContent-Length: 104857600000\r\n\r\n'
#RESPONSE = 'HTTP/1.1 101 <b><font color="green"> Suatu hari si Kancil yang sedang berjalan-jalan di hutan merasa kelaparan pun bergegas dan mencari makan Si Kancil teringat bahwa di pelosok hutan terdapat lahan timun yang amat segar Tapi sayangnya lahan timun tersebut terpisahkan oleh sebuah sungai yang dalam dan deras arusnya Untuk itu si Kancil jadi tidak bisa berenang menyebrangi sungai tersebut Tambah lagi sungai tersebut ditempati oleh sekawanan buaya Kancil tidak memperdulikan hal tersebut dan tetap menghampiri sungai untuk mencari solusi atas permasalahannya  Buaya yang melihat Kancil pun penasaran akan gerak-gerik Kancil yang mengendap-endap di pinggir sungai Ia pun bertanya tentang apa yang sedang Kancil lakukan di daerahnya Kancil jujur saja bahwa ia sedang berusaha mencari cara untuk menyebrangi sungai. Karena di pelosok hutan di sebrang sana terdapat perkebunan dengan lahan timun yang dirawat dengan baik Kancil sangat ingin menyantap timun-timun segar tersebut Mendengar penjelasan Kancil Buaya akhirnya menawarkan bantuan untuk mengantarnya ke seberang sungai Kancil yang cerdik mencium kebohongan dalam perkataan Buaya Tetapi Kancil berpura-pura tidak sadar dan malah bertanya apakah Buaya tidak akan memakannya Buaya menjelaskan bahwa ia sudah makan dan kenyang Kancil yang menyadari siasat Buaya pun menyuruh Buaya untuk tidak memakannya Ia malah membujuk Buaya untuk memanggil teman-temannya dan berjejer agar Kancil bisa menyebrang Setelah makan dan kenyang tentunya Kancil akan lebih gemuk dan enak dimakan Sekawanan buaya memercayai perkataan Kancil dan segera membiarkannya menyebrang Kancil akhirnya dapat pergi ke lahan timun dan menyantap makanannya Sekembalinya ia dari lahan timun ia lagi-lagi membual dan menyuruh sekawanan buaya untuk membiarkannya lewat lagi Ia berjanji akan makan dengan lahap dalam waktu yang lama agar kawanan buaya mendapat porsi Kancil yang lebih besar. Buaya yang meercayai Kancil pun membiarkannya pulang dan semenjak saat itu, Kanci tidak muncul lagi dihadapan Buaya</font></b>\r\n\r\nContent-Length: 104857600000\r\n\r\n'
class Server(threading.Thread):
    def __init__(self, host, port):
        threading.Thread.__init__(self)
        self.running = False
        self.host = host
        self.port = port
        self.threads = []
        self.threadsLock = threading.Lock()
        self.logLock = threading.Lock()

    def run(self):
        self.soc = socket.socket(socket.AF_INET)
        self.soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.soc.settimeout(2)
        intport = int(self.port)
        self.soc.bind((self.host, intport))
        self.soc.listen(0)
        self.running = True

        try:
            while self.running:
                try:
                    c, addr = self.soc.accept()
                    c.setblocking(1)
                except socket.timeout:
                    continue

                conn = ConnectionHandler(c, self, addr)
                conn.start()
                self.addConn(conn)
        finally:
            self.running = False
            self.soc.close()

    def printLog(self, log):
        self.logLock.acquire()
        print log
        self.logLock.release()

    def addConn(self, conn):
        try:
            self.threadsLock.acquire()
            if self.running:
                self.threads.append(conn)
        finally:
            self.threadsLock.release()

    def removeConn(self, conn):
        try:
            self.threadsLock.acquire()
            self.threads.remove(conn)
        finally:
            self.threadsLock.release()

    def close(self):
        try:
            self.running = False
            self.threadsLock.acquire()

            threads = list(self.threads)
            for c in threads:
                c.close()
        finally:
            self.threadsLock.release()


class ConnectionHandler(threading.Thread):
    def __init__(self, socClient, server, addr):
        threading.Thread.__init__(self)
        self.clientClosed = False
        self.targetClosed = True
        self.client = socClient
        self.client_buffer = ''
        self.server = server
        self.log = 'Connection: ' + str(addr)

    def close(self):
        try:
            if not self.clientClosed:
                self.client.shutdown(socket.SHUT_RDWR)
                self.client.close()
        except:
            pass
        finally:
            self.clientClosed = True

        try:
            if not self.targetClosed:
                self.target.shutdown(socket.SHUT_RDWR)
                self.target.close()
        except:
            pass
        finally:
            self.targetClosed = True

    def run(self):
        try:
            self.client_buffer = self.client.recv(BUFLEN)

            hostPort = self.findHeader(self.client_buffer, 'X-Real-Host')

            if hostPort == '':
                hostPort = DEFAULT_HOST

            split = self.findHeader(self.client_buffer, 'X-Split')

            if split != '':
                self.client.recv(BUFLEN)

            if hostPort != '':
                passwd = self.findHeader(self.client_buffer, 'X-Pass')
				
                if len(PASS) != 0 and passwd == PASS:
                    self.method_CONNECT(hostPort)
                elif len(PASS) != 0 and passwd != PASS:
                    self.client.send('HTTP/1.1 400 WrongPass!\r\n\r\n')
                elif hostPort.startswith('127.0.0.1') or hostPort.startswith('localhost'):
                    self.method_CONNECT(hostPort)
                else:
                    self.client.send('HTTP/1.1 403 Forbidden!\r\n\r\n')
            else:
                print '- No X-Real-Host!'
                self.client.send('HTTP/1.1 400 NoXRealHost!\r\n\r\n')

        except Exception as e:
            self.log += ' - error: ' + e.strerror
            self.server.printLog(self.log)
	    pass
        finally:
            self.close()
            self.server.removeConn(self)

    def findHeader(self, head, header):
        aux = head.find(header + ': ')

        if aux == -1:
            return ''

        aux = head.find(':', aux)
        head = head[aux+2:]
        aux = head.find('\r\n')

        if aux == -1:
            return ''

        return head[:aux];

    def connect_target(self, host):
        i = host.find(':')
        if i != -1:
            port = int(host[i+1:])
            host = host[:i]
        else:
            if self.method=='CONNECT':
                port = 443
            else:
                port = sys.argv[1]

        (soc_family, soc_type, proto, _, address) = socket.getaddrinfo(host, port)[0]

        self.target = socket.socket(soc_family, soc_type, proto)
        self.targetClosed = False
        self.target.connect(address)

    def method_CONNECT(self, path):
        self.log += ' - CONNECT ' + path

        self.connect_target(path)
        self.client.sendall(RESPONSE)
        self.client_buffer = ''

        self.server.printLog(self.log)
        self.doCONNECT()

    def doCONNECT(self):
        socs = [self.client, self.target]
        count = 0
        error = False
        while True:
            count += 1
            (recv, _, err) = select.select(socs, [], socs, 3)
            if err:
                error = True
            if recv:
                for in_ in recv:
		    try:
                        data = in_.recv(BUFLEN)
                        if data:
			    if in_ is self.target:
				self.client.send(data)
                            else:
                                while data:
                                    byte = self.target.send(data)
                                    data = data[byte:]

                            count = 0
			else:
			    break
		    except:
                        error = True
                        break
            if count == TIMEOUT:
                error = True
            if error:
                break


def print_usage():
    print 'Usage: proxy.py -p <port>'
    print '       proxy.py -b <bindAddr> -p <port>'
    print '       proxy.py -b 0.0.0.0 -p 80'

def parse_args(argv):
    global LISTENING_ADDR
    global LISTENING_PORT
    
    try:
        opts, args = getopt.getopt(argv,"hb:p:",["bind=","port="])
    except getopt.GetoptError:
        print_usage()
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print_usage()
            sys.exit()
        elif opt in ("-b", "--bind"):
            LISTENING_ADDR = arg
        elif opt in ("-p", "--port"):
            LISTENING_PORT = int(arg)


def main(host=LISTENING_ADDR, port=LISTENING_PORT):
    print "\n:-------PythonProxy-------:\n"
    print "Listening addr: " + LISTENING_ADDR
    print "Listening port: " + str(LISTENING_PORT) + "\n"
    print ":-------------------------:\n"
    server = Server(LISTENING_ADDR, LISTENING_PORT)
    server.start()
    while True:
        try:
            time.sleep(2)
        except KeyboardInterrupt:
            print 'Stopping...'
            server.close()
            break

#######    parse_args(sys.argv[1:])
if __name__ == '__main__':
    main()
