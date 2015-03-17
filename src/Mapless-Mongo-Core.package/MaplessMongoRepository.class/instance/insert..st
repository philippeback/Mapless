actions
insert: aMapless
	
	| bsonFriendly   |

	self onBeforeInsert: aMapless.

	[ bsonFriendly := (self storableFor: aMapless data) ] ifCurtailed: [
		aMapless data removeKey: self idAttribute ifAbsent: [ nil ] ] .
	
	(self collection: aMapless) add: bsonFriendly.

	self onAfterInsert: aMapless
