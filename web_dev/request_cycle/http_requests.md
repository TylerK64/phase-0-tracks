## Release 0: View HTTP Requests ##

(2) 
There are five main classes of HTTP response status codes which are: informational responses, successful responses, redirects, client errors, and server errors. These five classes are catergorized from 1xx to 5xx, with each class corresponding to a set of 100 codes. 

1xx - These codes are usually used for HTTP 1.1 as an informational response to the client. It tells the client that that request has been recieved and understood and to wait for a final response. 

2xx - These are status codes to indicate the action by the client was recieved, understood, accepted, and processed successfully. 
200 is likely the most common response code as it indicates that the request was successful. 

3xx - These status codes indicate the client must take additional action to complete the request, and are usually used for URL redirection.
300 - Multiple choices: this condition indicates there are multiple options that the client can choose from for a particular resource.
301 - Moved permanently: - indicates a new permanent URI has been assigned and that future references to this resource should be directed to the returned URI.

4xx - These codes are used to indicate the client has erred.
404 - The most common of this series indicates that the resource can not be found and is likely not available.
403 - This code indicates that access is forbidden to the user.
400 - Bad request. Happens when the broswer doesn't respect the rules of the HTTP protocol.
401 - Unauthorized: this error indicates that the user is unable to access a restricted web page, usually because of a failed login attempt.
408 - Request time out. Occurs when the client request takes too long so the server closes the connection after too much time has passed.

5xx - These codes are used to indicate the server has encountered an error or is otherwise incapable of performing the request.
500 - This error is the most well known server error also known as an internal server error. It is returned when the server is unable to fufill the request and no other 5xx code is applicable.
503 - A service temporarily unavailable error can occur if the web server is unavailable. This is usually due to common maintenance issues, such as getting serviced, needing to be reset, or similar problems.
504 - Gateway timeout: occurs between multiple servers, usually when the lower-level server is unable to recieve a timely response from a higher-level server so the process times out. Similar to a 502 error, except 502 occurs when the server receives an invalid response from an upstream server.

(3)
HTTP POST requests send additional data from the client, while GET requests only send information through the URL. Generally speaking, GET is 'simpler' as it can only retrieve remote data and POST is used to insert or update remote data. POST is more versatile for sending information since they aren't limited to a URL character length and allow more data types. GET is generally less secure than the POST method, as information is saved in the browser and exposes the parameters to users more. The method used is determined by the 'method' attribute (set either to "POST" or "GET") in the <form> element. 

(4)
Cookies are small pieces of data from a website and stored on the client side in order to save stateful information, for example: items in a shopping cart, browsing activity, or form field submissions. Another type of cookie, authentication cookies, are used by web servers to know if a user is logged in and which account they are logged into. There are also third-party cookies which are used by independent groups to track user's browsing history.