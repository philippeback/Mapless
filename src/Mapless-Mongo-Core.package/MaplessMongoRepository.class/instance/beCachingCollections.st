options
beCachingCollections
	"caches the collections and doesn't queries MongoDb all the time for them."
	cachingCollections := true.
	collectionsCache := Dictionary new.
	self database collections do: [ :collection | collectionsCache at: collection name put: collection ]
	