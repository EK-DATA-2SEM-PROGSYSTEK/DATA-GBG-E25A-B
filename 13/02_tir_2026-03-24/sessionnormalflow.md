# Session normal flow

(1)
Web browser (Client) accesses the Web application (Server) when session is not established.

(2)
Web application creates HttpSession object for storing the session with Web browser. Session ID is issued at the time of HttpSession object creation.

(3)
Web application stores the data sent by the Web browser in HttpSession object.

(4)
Web application sends a response to the Web browser. By setting “JSESSIONID = Issued session ID” in the “Set-Cookie” header of response, session ID is linked to the Web Browser.
Linked session ID is stored in Cookie.

(5)
Web browser links the session ID to Web application by setting “JSESSIONID = Issued session ID” in the “Cookie” header of request.
Application server on which the Web application is deployed, fetches HttpSession object corresponding to the session ID linked from the Web browser and maps it with the request.

(6)
Web application fetches the data stored in the request mentioned in (1), from the HttpSession object associated with the request.
Same data can be accessed across requests.

(7)
Web application returns the response to Web browser.
