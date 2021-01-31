<!doctype html>
<%@page import="com.fasterxml.jackson.core.type.TypeReference" %>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@page import="java.net.URI" %>
<%@page import="java.net.http.HttpClient" %>
<%@page import="java.net.http.HttpRequest" %>
<%@page import="java.net.http.HttpResponse" %>
<%@page import="java.util.List" %>
<%@page import="com.webapi.DataController" %>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>JSON DATA MAPING</title>
  </head>
  <body>
    <div class="text-center mt-5 mb-4"><h1>JSON DATA SHOWING IN TABLE FORMATE</h1></div>
    <%
    
    try {
    	String urlname="https://jsonplaceholder.typicode.com/posts";
		HttpClient client=HttpClient.newHttpClient();
		HttpRequest request1=HttpRequest.newBuilder().GET()
				.header("accept", "application/json")
				.uri(URI.create(urlname)).build();
		HttpResponse<String> response1=client.send(request1, HttpResponse.BodyHandlers.ofString());
		
		ObjectMapper mapper=new ObjectMapper();
		
		List<DataController> post=mapper.readValue(response1.body(), new TypeReference<List<DataController>>() {});
		
			
		
    %>
<table class="table">
  <thead>
    <tr>
      
      <th scope="col">UserId</th>
      <th scope="col">Id</th>
      <th scope="col">Title</th>
      <th scope="col">Body</th>
    </tr>
  </thead>
  <tbody>
  <%
  	for(DataController user:post)
	{
  %>
    <tr>
      
      <td><%=user.getUserId() %></td>
      <td><%=user.getId() %></td>
      <td>@<%=user.getTitle() %></td>
      <td>@<%=user.getBody() %></td>
    </tr>
<%
	}
	
	} catch (Exception e) {
		// TODO: handle exception
	}
%>
  </tbody>
</table>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>