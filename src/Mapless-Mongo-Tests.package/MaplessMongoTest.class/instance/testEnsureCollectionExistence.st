tests
testEnsureCollectionExistence

	self do: [ 
		self assert: (DummyHouse ensureCollectionExistence isKindOf: MongoCollection) ]