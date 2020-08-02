@ignore
Feature: Reading and calling feature file
	
	Background: 
		* def expectedOutput = read('../Data/result.json')
		* def feature = read('userDetails.feature')
		* def result = call feature

	Scenario: Request users details
		Given url 'https://reqres.in/api/users?page=2'
		When method GET
		Then status 200
		Then print response
		And match response == expectedOutput
		* def email = response.data[1].email
		Then print '****email',email
		* def firstname = response.data[1].first_name
		Then print '******** printing firstname ',firstname
		
		
		* def firstname_firstelement = result.response.data[1].first_name
		Then print '******** printing firstname ',firstname_firstelement
		
	