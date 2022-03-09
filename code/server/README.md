### Server

The server is a Google App Script deployment running freely on the cloud.

##### Code

The code in `server.gs` is the code running in the deployment.

##### Update Deployment

The endpoint for the current deployment can be found and updated in `join_message.dart`.


##### Description

The server code simply takes a post request with the form data, then it submits it to a Google Form hosted on the DetConnect manager drive. This form is linked to a spreadsheet which auto updates based on the form as well.