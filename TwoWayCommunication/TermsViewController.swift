//
//  TermsViewController.swift
//  TwoWayCommunication
//
//  Created by Allie Shuldman 2016 on 3/9/16.
//  Copyright © 2016 Allie Shuldman. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var termsWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://namesandfaces.hotchkiss.org/terms.php")
        let request = URLRequest(url: url!)
        termsWebView.loadRequest(request)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
