I am  a connection layer between Mapless and the Mongo database. 

Use me as follows: 

(MaplessMongoRepository on: aMongoDatabase) do: [ 
	
	:aRepository |
	
	"your stuff here"
	
	 ]

I am providing concrete Mongo-specific support for the standard MaplessRepository features.

I am providing additional support for MongoDB to ease usual operations.

Worth noticing are:

existsId:of:
insert:
save:
destroy:
update:

instancesOf:where:limit:offset:

instanceOf:atId:





