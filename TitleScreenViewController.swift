//
//  TitleScreenViewController.swift
//  TwoWayCommunication
//
//  Created by Allie Shuldman 2016 on 3/9/16.
//  Copyright © 2016 Allie Shuldman. All rights reserved.
//

import UIKit

class TitleScreenViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var foregroundImageView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordResultsLabel: UILabel!
    
    var password = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getPasswordFromServer()
        
        foregroundImageView.contentMode = UIViewContentMode.scaleAspectFit
        foregroundImageView.image = UIImage(named: "prototypelogo")
        
        backgroundImageView.contentMode = UIViewContentMode.scaleAspectFill
        backgroundImageView.image = UIImage(named: "Field_Hockey_Image")
        backgroundImageView.alpha = 0.5
        
        navigationController?.isNavigationBarHidden = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TitleScreenViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @IBAction func continueButtonPressed(_ sender: AnyObject) {
        
        if self.passwordTextField.text == password
        {
            self.performSegue(withIdentifier: "goToTerms", sender: self)
        }
        else
        {
            passwordTextField.text = ""
            passwordResultsLabel.text = "Incorrect password."
            passwordResultsLabel.isHidden = false
        }
    }
    
    func getPasswordFromServer()
    {
        var urlString = "http://namesandfaces.hotchkiss.org/password.txt"
        var url = URL(string: urlString)
        
        func getData(){
            let task = URLSession.shared.dataTask(with: URLRequest(url: url!, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 15.0), completionHandler: {(data, response, error) in
                let urlContent = (NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
                let tempContent:String = urlContent as! String
                print(tempContent)
                self.password = tempContent
                
            })
            
            task.resume()
        }
        
        getData()

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
