#LAB6 Python starter code
#imports go here
#import MySQLdb
import _mysql

#code goes here

buffer = "true"



def oneQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="Blazestrike",db="beer")
	db.query("""SELECT * FROM beer;""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()

def twoQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="Blazestrike",db="beer")
	db.query("""SELECT * FROM Future;""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()

def threeQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="Blazestrike",db="beer")
	#db.query("""SELECT * FROM location WHERE beerLocationID NOT IN (SELECT * FROM location as a, beer AS b WHERE  
	#	a.beerLocationID = b.beerLocationID;)""")
	db.query("""SELECT beerLocation FROM location WHERE beerLocationID not in (select beerName from beer)""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	if nR == 0:
		print("""Beer Brewery Locations""")
	db.close()
	
def fourQuery():
	#I wrote a 4th Query to demonstrate the use of Python on my own
	db = _mysql.connect(host="localhost",user="root",passwd="Blazestrike",db="beer")
	db.query("""SELECT distributor FROM KegCost Where beerID""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()
	
while buffer:
	print("""
	0.Exit
	1.See beers
	2.See Beer Prices
	3.Beer Brewery Locations From Beer Table
	4.List of Distributors (Extra Query)	
	""")
	buffer=input("what would you like to do? ")
	if buffer == 1:
		oneQuery()
	if buffer == 2:
		twoQuery()
	if buffer == 3:
		threeQuery()
	if buffer == 4:
		fourQuery()