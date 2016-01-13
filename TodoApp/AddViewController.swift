//
//  AddViewController.swift
//  TodoApp
//
//  Created by Aldo  Garibo  on 12/01/16.
//  Copyright (c) 2016 Aldo  Garibo . All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tituloTextField: UITextField? = UITextField()
    @IBOutlet var notasTextView: UITextView? = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTaped(sender: UIBarButtonItem) {
        
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        var dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(tituloTextField!.text, forKey: "ItemTitle")
        dataSet.setObject(notasTextView!.text, forKey: "ItemNote")
        
        if((itemList) != nil)
        {
            var newMutableList:NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in itemList!
            {
                newMutableList.addObject(dict as! NSDictionary)
            }
            
            userDefaults.removeObjectForKey("itemList")
            newMutableList.addObject(dataSet)
            userDefaults.setObject(newMutableList, forKey: "itemList")
            
        }
        else
        {
            userDefaults.removeObjectForKey("itemList")
            itemList = NSMutableArray()
            itemList!.addObject(dataSet)
            userDefaults.setObject(itemList, forKey: "itemList")
        }
        
        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
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
