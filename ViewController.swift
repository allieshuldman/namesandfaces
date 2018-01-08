//
//  ViewController.swift
//  TwoWayCommunication
//
//  Created by Allie Shuldman 2016 on 3/1/16.
//  Copyright © 2016 Allie Shuldman. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var pageTitle: UINavigationItem!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    @IBOutlet weak var unfilterButton: UIButton!
    
    var browseURL = URL(string: "http://www.hotchkiss.org")
    var urlToPassToSingle : URL!
    var hasBeenFiltered : Bool!
    var filterTitle : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if browseURL == nil
        {
            browseURL = URL(string: "http://namesandfaces.hotchkiss.org/dbsamplequeryprogram.php")
            filterTitle = "Everyone"
        }
        
        let request = URLRequest(url: browseURL!)
        webView.delegate = self
        webView.loadRequest(request)
        
        if hasBeenFiltered != nil && hasBeenFiltered == true
        {
            unfilterButton.isHidden = false
        }
        else
        {
            unfilterButton.isHidden = true
        }
        
        webView.scalesPageToFit = true
        
        pageTitle.title = filterTitle
        
        
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (request.url?.pathExtension == "jpg") || (request.url == browseURL)
        {
            webView.scalesPageToFit = true
            return true
        }
        else
        {
            urlToPassToSingle = request.url
            performSegue(withIdentifier: "showSingleView", sender: self)
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showSingleView"
        {
            let destination = segue.destination as! SingleViewViewController
            destination.urlToLoad = urlToPassToSingle
        }
        
    }
    
    @IBAction func filterButtonPressed(_ sender: AnyObject) {
        
        if filterButton.title == "Unfilter"
        {
            browseURL = URL(string: "http://namesandfaces.hotchkiss.org/dbsamplequeryprogram.php")
            let request = URLRequest(url: browseURL!)
            webView.loadRequest(request)
            filterButton.title = "Filter"
        }
        else
        {
            performSegue(withIdentifier: "goToFilterView", sender: self)
        }
        
    }
    
    
    @IBAction func unfilterButtonPressed(_ sender: AnyObject) {
        
        browseURL = URL(string: "http://namesandfaces.hotchkiss.org/dbsamplequeryprogram.php")
        let request = URLRequest(url: browseURL!)
        webView.loadRequest(request)
        filterButton.title = "Filter"
        hasBeenFiltered = false
        unfilterButton.isHidden = true
        pageTitle.title = "Everyone"
        
    }
    
//    @IBAction func prepareToUnwind (segue: UIStoryboardSegue) {
//        
//        webView.scalesPageToFit = true
//    }
    



}

