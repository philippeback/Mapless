testing
existsId: anId of: aMaplessClass

	"Check is a document with andId _id is present in the collection"

	^ ( self instanceOf: aMaplessClass  atId:  anId ) notNil