I am a concrete MaplessAbstractPool dealing with MongoDB clients.

Some specialities of me are: 

db := MongoPool instance database at: 'db'

which returns a MongoDatabase named 'db'

result := MongoPool instance
				databaseAt: 'db'
				do: [ :client | client doSomething ]
				
result will hold the result of the client doSomething 











