//
//  detailViewController.swift
//  CollegeProfileBuilderOne
//
//  Created by Elizabeth on 2/9/17.
//  Copyright © 2017 Elizabeth. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var mascotTextField: UITextField!
    
    var collegeDetail:collegeClass!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        myImageView.image = collegeDetail.image
        collegeTextField.text = collegeDetail.name
        locationTextField.text = collegeDetail.location
        mascotTextField.text = collegeDetail.mascot
        

     
    }

  
    @IBAction func saveButtonTapped(_ sender: Any)
    {
    
    }
    override func viewDidAppear(_ animated: Bool)
    {
    
        
    }

}
