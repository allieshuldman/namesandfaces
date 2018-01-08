//
//  SingleViewViewController.swift
//  TwoWayCommunication
//
//  Created by Allie Shuldman 2016 on 3/1/16.
//  Copyright © 2016 Allie Shuldman. All rights reserved.
//

import UIKit

class SingleViewViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var urlToLoad : URL?
    
    var cameFromSearch = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(urlToLoad == nil)
        {
           print("urlToLoad is nil")
        }
        else
        {
            let request = URLRequest(url: urlToLoad!)
            webView.loadRequest(request)
            webView.scalesPageToFit = true
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
