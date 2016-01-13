//
//  DetailViewController.swift
//  TodoApp
//
//  Created by Aldo  Garibo  on 12/01/16.
//  Copyright (c) 2016 Aldo  Garibo . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField? = UITextField()
    @IBOutlet var notesTextView: UITextView? = UITextView()
    
    var todoData:NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField?.userInteractionEnabled = false
        notesTextView?.userInteractionEnabled = false
        
        titleTextField!.text = todoData.objectForKey("ItemTitle") as! String
        notesTextView!.text = todoData.objectForKey("ItemNote") as! String
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteItem(sender: AnyObject) {
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var itemListArray:NSMutableArray = userDefaults.objectForKey("itemList") as! NSMutableArray
        var mutableItemList:NSMutableArray = NSMutableArray()
        for dict:AnyObject in itemListArray{
            mutableItemList.addObject(dict as! NSDictionary)
        }
        
        mutableItemList.removeObject(todoData)
        userDefaults.removeObjectForKey("itemList")
        userDefaults.setObject(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "showDetail")
        {
            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()
            var detailViewController:DetailViewController = segue.destinationViewController as! DetailViewController
            DetailViewController.todoData = todoItems.objectAtIndex(selectedIndexPath.row) as NSDictionary
        }
    }
    */

}
