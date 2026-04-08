/*
* Script-Based Authentication with CSRF handling
* Users: alice, bob
* Password: "password"
* CSRF field: _csrf
*/

// --------------------------------------------------
// Authentication logic
// --------------------------------------------------
function authenticate(helper, paramsValues, credentials) {
    print("Authenticating user: " + credentials.getParam("username"));

    var loginUrl = paramsValues.get("loginUrl");

    /*
     * 1) GET login page to retrieve CSRF token
     */
    var getMsg = helper.prepareMessage();
    getMsg.setRequestHeader("GET " + loginUrl + " HTTP/1.1");
    helper.sendAndReceive(getMsg);

    var responseBody = getMsg.getResponseBody().toString();

    // Extract CSRF token from hidden input
    var csrfRegex = /name="_csrf"\s+value="([^"]+)"/;
    var match = csrfRegex.exec(responseBody);

    if (!match) {
        print("ERROR: CSRF token not found on login page");
        return null;
    }

    var csrfToken = match[1];
    print("CSRF token extracted: " + csrfToken);

    /*
     * 2) POST login form with credentials + CSRF token
     */
    var postMsg = helper.prepareMessage();

    var postData =
        "username=" + encodeURIComponent(credentials.getParam("username")) +
        "&password=" + encodeURIComponent(credentials.getParam("password")) +
        "&_csrf=" + encodeURIComponent(csrfToken);

    postMsg.setRequestHeader(
        "POST " + loginUrl + " HTTP/1.1\r\n" +
        "Content-Type: application/x-www-form-urlencoded"
    );

    postMsg.setRequestBody(postData);
    postMsg.getRequestHeader().setContentLength(postData.length());

    // Follow redirects after successful login
    helper.getHttpSender().setFollowRedirect(true);

    helper.sendAndReceive(postMsg);

    return postMsg;
}

// --------------------------------------------------
// Required authentication parameters
// --------------------------------------------------
function getRequiredParamsNames() {
    return ["loginUrl"];
}

// --------------------------------------------------
// Optional authentication parameters
// --------------------------------------------------
function getOptionalParamsNames() {
    return [];
}

// --------------------------------------------------
// Credentials required per user
// --------------------------------------------------
function getCredentialsParamsNames() {
    return ["username"];
}

// --------------------------------------------------
// Logged-in / Logged-out indicators
// --------------------------------------------------
function getLoggedInIndicator() {
    return "Sign out";
}

function getLoggedOutIndicator() {
    return "Please sign in";
}