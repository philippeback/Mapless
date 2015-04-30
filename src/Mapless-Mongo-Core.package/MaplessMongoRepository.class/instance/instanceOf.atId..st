accessing
instanceOf: aMapless atId: anId

	"self haltIf: #actualAlertsToProcessForAlerts:ofType:forHubNamed:andOpticalNodeNamed:."
	"self haltIf: #findId:."

	"If anId is a string, it has to be converted into an OID for the query to work."	

	^self  
		instanceOf: aMapless 
		where: (Dictionary newFromPairs: {
			self idAttribute. 
			(anId isKindOf: String)
				ifTrue: [ (OID value: (Integer readFrom: anId base: 16)) ]
				ifFalse: [ anId ].
			})