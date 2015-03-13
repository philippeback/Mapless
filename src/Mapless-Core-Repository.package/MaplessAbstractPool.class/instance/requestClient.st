actions
requestClient
	"Answers a aClient instance taken from the idle clients.
	It'll create a new one if needed.
	It's a thread safe operation."

	| client |

	self clientsMutex critical: [
		"Transcript cr; show: 'getting Mapless client p: ', Processor activeProcess hash asString."
		self flag: #TODO. "A check must be made to ensure the client is still alive"
		client := self hasIdleClients
				ifTrue: [ self idleClients anyOne ]
				ifFalse: [ self makeClient ].
		client isValid ifFalse:[
			self remove: client.
			client := self makeClient ].
		self idleClients remove: client ifAbsent:[ nil ].
		self busyClients add: client].
	
	^ client