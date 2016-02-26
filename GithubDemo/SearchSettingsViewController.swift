//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Xinxin Xie on 2/25/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

protocol SettingsPresentingViewControllerDelegate: class {
    
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()

}

class SearchSettingsViewController: UIViewController {
    
    var ratingSlider: UISlider?
    var delegate: SettingsPresentingViewControllerDelegate?
    var repoSettings: GithubRepoSearchSettings?
    
    @IBOutlet weak var ratingSliderLabel: UISlider!
   
    @IBOutlet weak var starLabel: UILabel!
    
    @IBAction func ratingSliderAction(sender: UISlider) {
        
        let currentValue = Int(sender.value)
        starLabel.text = "\(currentValue)"
        repoSettings?.minStars = currentValue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
             self.delegate?.didSaveSettings(self.repoSettings!)
            print("delegate called")
        }
       
        
    }

    @IBAction func cancelButton(sender: AnyObject) {
        
        
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

