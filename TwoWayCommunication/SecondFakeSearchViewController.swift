//
//  SecondFakeSearchViewController.swift
//  TwoWayCommunication
//
//  Created by Allie Shuldman 2016 on 5/9/16.
//  Copyright © 2016 Allie Shuldman. All rights reserved.
//

import UIKit

class SecondFakeSearchViewController: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var firstOrLast: UISegmentedControl!
    
    var urlToPassToSingle : URL!
    
    var mainURL : URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        mainURL = URL(string: "http://namesandfaces.hotchkiss.org/searchpage.php")
        let request = URLRequest(url: mainURL!)
        webView.loadRequest(request)
        webView.scalesPageToFit = true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchButtonPressed(_ sender: AnyObject) {
        var searchQuery = searchBar.text
        var searchField : String?
        
        if(firstOrLast.selectedSegmentIndex == 0)
        {
            searchField = "firstname"
        }
        else
        {
            searchField = "lastname"
        }
        
        if(searchField == nil)
        {
            searchField = "firstname"
        }
        if searchQuery == nil
        {
            searchQuery = ""
        }
        
        print("search field: \(searchField!) search query: \(searchQuery!)")
        
        let urlString = "http://namesandfaces.hotchkiss.org/searchpage.php?\(searchField!)=\(searchQuery!)"
        print(urlString)
        
        mainURL = URL(string: urlString) as URL!
        print(mainURL)
        
        let newRequest = URLRequest(url: mainURL)
        
        webView.loadRequest(newRequest)
        webView.scalesPageToFit = true
        webView.reload()
        webView.loadRequest(newRequest)
    }
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWithRequest request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        print("FUNC")
        
        if (request.url?.pathExtension == "jpg") || (request.url == mainURL)
        {
            webView.scalesPageToFit = true
            print(urlToPassToSingle)
            return true
        }
        else
        {
            urlToPassToSingle = request.url
            performSegue(withIdentifier: "goToSingle", sender: self)
            print(urlToPassToSingle)
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSingle"
        {
            let destination = segue.destination as! SingleViewViewController
            destination.urlToLoad = urlToPassToSingle
        }
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
