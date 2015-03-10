actions
remove: aClient
	"Remove aClient from whatever collection it is in"

	self idleClients remove: aClient ifAbsent:[ nil ].
	self busyClients remove: aClient ifAbsent:[ nil ].
	