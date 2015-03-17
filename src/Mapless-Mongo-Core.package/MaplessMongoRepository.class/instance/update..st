actions
update: aMapless

	| bsonFriendly |

	self onBeforeUpdate: aMapless.
	
	bsonFriendly := self storableFor: aMapless data.

	(self collection: aMapless) 	
		replace:  (Dictionary new 
					at: self idAttribute put: (self idOf: aMapless);
					yourself)
		with: bsonFriendly.
		
	self onAfterUpdate: aMapless