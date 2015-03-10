accessing
findCid: anId
	"find by client side Id (cid)"
	^self currentRepository 
		instanceOf: self 
		where: (Dictionary newFromPairs: {'cid'. anId})
	
	