Feature: Get user details

Scenario:  Get call

* def expectedOutput = read('../Data/result.json')
* def var1 = 'test'


Given url 'https://reqres.in/api/users?page=2'
When method GET
Then status 200
Then print response
And match response == {"per_page":6,"total":12,"ad":{"company":"StatusCode Weekly","text":"A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things.","url":"http:\/\/statuscode.org\/"},"data":[{"last_name":"Lawson","id":7,"avatar":"https:\/\/s3.amazonaws.com\/uifaces\/faces\/twitter\/follettkyle\/128.jpg","first_name":"Michael","email":"michael.lawson@reqres.in"},{"last_name":"Ferguson","id":8,"avatar":"https:\/\/s3.amazonaws.com\/uifaces\/faces\/twitter\/araa3185\/128.jpg","first_name":"Lindsay","email":"lindsay.ferguson@reqres.in"},{"last_name":"Funke","id":9,"avatar":"https:\/\/s3.amazonaws.com\/uifaces\/faces\/twitter\/vivekprvr\/128.jpg","first_name":"Tobias","email":"tobias.funke@reqres.in"},{"last_name":"Fields","id":10,"avatar":"https:\/\/s3.amazonaws.com\/uifaces\/faces\/twitter\/russoedu\/128.jpg","first_name":"Byron","email":"byron.fields@reqres.in"},{"last_name":"Edwards","id":11,"avatar":"https:\/\/s3.amazonaws.com\/uifaces\/faces\/twitter\/mrmoiree\/128.jpg","first_name":"George","email":"george.edwards@reqres.in"},{"last_name":"Howell","id":12,"avatar":"https:\/\/s3.amazonaws.com\/uifaces\/faces\/twitter\/hebertialmeida\/128.jpg","first_name":"Rachel","email":"rachel.howell@reqres.in"}],"page":2,"total_pages":2}


And match response == expectedOutput

And match response.ad.company == 'StatusCode Weekly'
And match response.data[0].id == 7
And match response.data[0].last_name != null

* def email = response.data[0].email
Then print '****email',email
* def jobcode = response.data[0].jobcode
And match jobcode == null

Given def var = 'test'
Then print var


Then print var1