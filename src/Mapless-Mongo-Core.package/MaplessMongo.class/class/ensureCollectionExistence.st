actions
ensureCollectionExistence
"Makes sure the collection exists in the repository and if not, create it.
Returns the collection"
	| database collection collectionName |
	database := self currentRepository database.
	collectionName := self name asString.
	collection := (database collectionAt: collectionName) 
		ifNil: [ 	
				collection := database addCollection: collectionName.
				collection remove: Dictionary new.
				].
	^collection	