enumerating
select: aDictionary limit: limit offset: offset order: orderDictionary
	^ self currentRepository instancesOf: self query: [:query |
		query
			where: aDictionary;
			limit: limit; 
			offset: offset; 
			order: orderDictionary ]
	