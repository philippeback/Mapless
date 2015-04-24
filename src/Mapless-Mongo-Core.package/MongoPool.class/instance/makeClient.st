actions
makeClient
	"Returns a new client so it can be (re)used in the pool"

	^ (MongoClient 
		host: (ConfigurationFiles at: #Mongo at: #host) 
		port: (ConfigurationFiles at: #Mongo at: #port))
			beLogging: (ConfigurationFiles at: #Mongo at: #logging);
			open;
			yourself 