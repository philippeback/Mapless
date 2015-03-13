actions
removeCollection
	"drops the collection"	
	(self currentRepository database collectionAt: self name asString)
		ifNotNil: [ :collection | collection drop ]
