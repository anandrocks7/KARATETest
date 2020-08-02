Feature: Get individual user details test
	
	Background: 
		* def expectedOutput = read('../Data/result1.json')
			#'../Data/result1.json'

	Scenario: Request user 2 details
		Given url 'https://reqres.in/api/users/2'
		When method GET
		Then status 200
		#Then print response
		Then print '**********response ', response
		#And match response == {"ad":{"company":"StatusCode Weekly","text":"A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things.","url":"http:\/\/statuscode.org\/"},"data":{"last_name":"Weaver","id":2,"avatar":"https:\/\/s3.amazonaws.com\/uifaces\/faces\/twitter\/josephstein\/128.jpg","first_name":"Janet","email":"janet.weaver@reqres.in"}}

		And match response == expectedOutput[0]
	
	
	Scenario: Request user 3 details
		Given url 'https://reqres.in/api/users/3'
		When method GET
		Then status 200
		#Then print response
		Then print '**********response ', response
		#And match response == {"ad":{"company":"StatusCode Weekly","text":"A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things.","url":"http:\/\/statuscode.org\/"},"data":{"last_name":"Weaver","id":2,"avatar":"https:\/\/s3.amazonaws.com\/uifaces\/faces\/twitter\/josephstein\/128.jpg","first_name":"Janet","email":"janet.weaver@reqres.in"}}

		And match response == expectedOutput[1]

		
		
# Output of two APi's combined in one json file. And comparing those from one file.	Similarly we can add n no. of api's and compare results	