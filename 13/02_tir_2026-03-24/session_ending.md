# Hvordan en session kan slutte

## Invalidate

(1)
Access the process that discards session from Web browser.


(2)
Web application discards HttpSession object corresponding to the session ID linked from Web browser.
At this point, HttpSession object with the ID, SESSION01, disappears from server side.

(3)
When the discarded session is accessed from Web browser using the respective session ID, a new session is generated, as HttpSession object corresponding to the requested session ID does not exist.
In the above example, a session with ID SESSION02 is being generated.


## Time out

(1)
When an established session is not accessed for a particular period, application server detects session timeout.

(2)
Application server discards the session for which session timeout is detected.

(3)
When the session is accessed from Web browser after session timeout occurs, session timeout error is returned to Web browser since HttpSession object corresponding to the session ID requested from the Web browser, does not exist.
