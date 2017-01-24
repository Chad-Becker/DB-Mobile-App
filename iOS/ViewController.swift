//
//  ViewController.swift
//  DB_App
//
//  Created by Chad Becker on 1/16/17.
//  Copyright © 2017 Chad Becker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var query: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func sendQuery(sender: AnyObject) {
        print("start")
        let url = "http://dbapp.chadbecker.com/getDB"
        let myUrl = NSURL(string: url);
        
        // Creaste URL Request
        let request = NSMutableURLRequest(URL:myUrl!);
        
        // Set request HTTP method to GET. It could be POST as well
        request.HTTPMethod = "GET"
        
        // Excute HTTP Request
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            // Check for error
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // Print out response string
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            
            
            // Convert server json response to NSDictionary
            //do {
              //  if let convertedJsonIntoDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    
                    // Print out dictionary
                //    print(convertedJsonIntoDict)
                    
                    // Get value by key
                  //  let firstNameValue = convertedJsonIntoDict["userName"] as? String
                    //print(firstNameValue!)
                    
              //  }
            //} catch let error as NSError {
                //print(error.localizedDescription)
            //}
            
        }
        
        task.resume()
    }

}

