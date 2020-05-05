//
//  ViewController.swift
//  SellAssignment10
//
//  Created by Remy Sell on 5/4/20.
//  Copyright © 2020 Remy Sell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var middleName: UITextField!
    
    @IBOutlet weak var foodPref: UITextField!
    
    @IBOutlet weak var results: UITextView!
    
    
    @IBAction func saveResults(_ sender: Any) {
        let csvLine:String = "\(firstName.text!),\(middleName.text!),\(foodPref.text!)\n"
        let paths =
            NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir:String=paths[0]
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        
        
        if
        !FileManager.default.fileExists(atPath:resultsFile) {
            FileManager.default.createFile(atPath:resultsFile,contents:nil, attributes: nil)
        }
        
        let
        fileHandle:FileHandle=FileHandle(forUpdatingAtPath:resultsFile)!
        fileHandle.seekToEndOfFile()
        
        fileHandle.write(csvLine.data(using:String.Encoding.utf8)!)
        fileHandle.closeFile()
        
        firstName.text = ""
        middleName.text = ""
        foodPref.text = ""
    }
    
    @IBAction func showResults(_ sender: Any) {
        let paths =
            NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir:String=paths[0] as String
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        
        
        if
        !FileManager.default.fileExists(atPath:resultsFile) {
            let fileHandle:FileHandle = FileHandle(forReadingAtPath:resultsFile)!
            let
            resultsData:String!=NSString(data:fileHandle.availableData,encoding: String.Encoding.utf8.rawValue)! as String
            fileHandle.closeFile()
            
            
            results?.text=resultsData
    }
        else
        {
            results.text = "File does not exist"
        }
    
        
    
    
        func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

        func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
        }

}

}
