actions
destroy: aMapless
	"Removes aMapless from the persistent collection"

	| bsonFriendly filter |
	
	self onBeforeDestroy: aMapless.

	filter := JsonObject new 
				at: aMapless class idAttribute 
				put: (aMapless data at: aMapless class idAttribute); 
				yourself. 
	bsonFriendly := self storableFor: filter.
		
	(self collection: aMapless) remove: bsonFriendly.
	
	self onAfterDestroy: aMapless