from socketserver import BaseRequestHandler, TCPServer
from subprocess import Popen

import os
import json

class TCPRequestHandler(BaseRequestHandler):
	last_proc = None

	def handle(self):
		try:
			data = self.request.recv(4096).decode('utf-8')
			msg_id, msg_data = json.loads(data)
		except Exception as e:
			return

		if msg_id > 0:
			self.start_proc(msg_data)

	@classmethod
	def start_proc(cls, filepath):
		if cls.last_proc:
			cls.last_proc.kill()

		os.system('clear')
		cls.last_proc = Popen(['python3', filepath])


class Server(object):
	def __init__(self, host="localhost", port=8785):
		self.host = host
		self.port = port
		self.server = TCPServer((self.host, self.port), TCPRequestHandler)

	def start(self):
		try:
			self.server.serve_forever()
		except:
			self.stop()

	def stop(self):
		print("Stopping server")

		self.server.shutdown()
		self.server.server_close()

if __name__ == "__main__":
	server = Server()
	server.start()
