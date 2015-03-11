accessing
instancesOf: aMaplessClass query: aQuery
	"Provides support for MongoQueries"

	^self currentRepository instancesOf: self query: aQuery
		