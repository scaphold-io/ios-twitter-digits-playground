//
//  ViewController.swift
//  Scaphold-Digits
//
//  Created by Vincent Ning on 7/18/16.
//  Copyright © 2016 Scaphold, Inc. All rights reserved.
//

import UIKit
import DigitsKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        Digits.sharedInstance().logOut()
        
        let digits = Digits.sharedInstance()
        
        let authButton = DGTAuthenticateButton(authenticationCompletion: { (session: DGTSession?, error: NSError?) in
            if (session != nil) {
                print(session!.authToken)
                print(session!.authTokenSecret)
                print(session?.emailAddress)
                print(session!.emailAddressIsVerified)
                print(session!.userID)
                print(session!.phoneNumber)
                // TODO: associate the session userID with your user model
                
                let oauthSigning = DGTOAuthSigning(authConfig:digits.authConfig, authSession:digits.session())
                let authHeaders = oauthSigning.OAuthEchoHeadersToVerifyCredentials()
                
                let message = "Phone number: \(session!.phoneNumber)"
                let alertController = UIAlertController(title: "You are logged in!", message: message, preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: .None))
                self.presentViewController(alertController, animated: true, completion: .None)
            } else {
                NSLog("Authentication error: %@", error!.localizedDescription)
            }
        })
        authButton.center = self.view.center
        self.view.addSubview(authButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

