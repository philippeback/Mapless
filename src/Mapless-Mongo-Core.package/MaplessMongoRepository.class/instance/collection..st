private
collection: aMaplessOrMaplessClass

	"
	Returns the possibly cached collection associated with aMaplessOrMaplessClass
	As we can be invoked by instancesOf:where: we need the Mapless or MaplessClass support.
	"

	| collectionName |
	
	
	collectionName := (aMaplessOrMaplessClass isKindOf: Mapless)
								ifTrue: [ aMaplessOrMaplessClass class name asString ]
								ifFalse: [  aMaplessOrMaplessClass name asString ] .
	
	^ self isCachingCollections
		ifFalse: [ (self databaseCollectionNamed: collectionName). ]
		ifTrue:  [ collectionsCache	
						at: collectionName	
						ifAbsentPut: [ (self databaseCollectionNamed: collectionName) ].
				 ].
