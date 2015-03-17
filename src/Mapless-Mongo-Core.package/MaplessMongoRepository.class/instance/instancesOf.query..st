accessing
instancesOf: aMaplessClass query: aQuery
	"Answer a collection of instances of aMaplessClass that meet with the query from the repository."

	| result databaseCollection |

	databaseCollection := self collection: aMaplessClass.
	result := databaseCollection query: aQuery.
	
	^(result isNil and:[result isEmpty])
		ifTrue: [ #() ]
		ifFalse: [ (aMaplessClass fromJSONObjects: result) collect: [ :each | self onAfterRead: each ] ]
	