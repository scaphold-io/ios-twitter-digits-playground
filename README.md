#Scaphold.io's iOS Twitter Digits Playground

Fork this boilerplate code to get started with Twitter Digits.

Quickstart:

1) Open *Scaphold-Digits.xcworkspace* using XCode.

2) Run the app.

3) The front page will display the login screen, and follow the directions to login using passwordless authentication.

You'll find the proper credentials you need in *ViewController.swift* saved as the *authHeaders* variable. You'll find "X-Auth-Service-Provider" and "X-Verify-Credentials-Authorization" fields, which you will need for OAuth with Twitter Digits.

For more information, please visit the official Twitter Digits page on [how to obtain OAuth Echo headers](https://docs.fabric.io/apple/digits/advanced-setup.html#obtaining-oauth-echo-headers)
