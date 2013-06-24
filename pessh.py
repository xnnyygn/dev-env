#!/usr/bin/env python

import pexpect
import os
import signal
import sys
import subprocess

class PeSSH:
	'''
	  simple usage:

		c = PeSSH('example.com', encoding = 'GB18030')
		c.login('foo')
		c.prompt()
		c.sendline('date')
		c.prompt()
		c.logout()
	'''
	def __init__(self, host, encoding = None, logfile = None):
		self.host = host
		self.encoding = encoding
		self.logfile = logfile

	def login(self, username, password = None):
		cmd = 'ssh -l %s %s' % (username, self.host)
		if self.encoding:
			cmd = ('luit -encoding %s ' % self.encoding) + cmd
		self.process = pexpect.spawn(cmd)
		self.process.logfile = self.logfile
		if password:
			self.process.expect('.*[pP]assword:.*')
			self.process.sendline(password)

	def prompt(self):
		self.process.expect('.*\$.*')

	def expect(self, pattern):
		self.process.expect(pattern)

	def sendline(self, line):
		self.process.sendline(line)

	def interact(self):
		self.process.interact()

	def readline(self):
		return self.process.readline()

	def logout(self):
		ps = subprocess.Popen('ps -o pid --noheaders --ppid %d' % self.process.pid, \
				shell = True, stdout = subprocess.PIPE)
		ps.wait()
		pids = ps.stdout.read()
		self.process.close()
		for p in pids.splitlines():
			os.kill(int(p), signal.SIGKILL)
