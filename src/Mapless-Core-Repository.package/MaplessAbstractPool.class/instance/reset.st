actions
reset 
	"Gets rid of all busy and idle clients, resetting them in the process"

	self busyClients copy do:[ :e | 
		e reset. 
		self remove: e ].

	self idleClients copy do:[ :e | 
		e reset.
		self remove: e ].