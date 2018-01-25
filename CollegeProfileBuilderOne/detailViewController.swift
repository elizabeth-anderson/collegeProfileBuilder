//
//  detailViewController.swift
//  CollegeProfileBuilderOne
//
//  Created by Elizabeth on 2/9/17.
//  Copyright © 2017 Elizabeth. All rights reserved.
//

import UIKit
import MapKit

class detailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UISearchBarDelegate
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var mascotTextField: UITextField!
    @IBOutlet weak var linkTextField: UITextField!
  
    var collegeDetail:collegeClass!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        imagePicker.delegate = self
        
        super.viewDidLoad()
        
        myImageView.image = collegeDetail.image
        
        collegeTextField.text = collegeDetail.name
        
        locationTextField.text = collegeDetail.location
        
        mascotTextField.text = collegeDetail.mascot
        
        linkTextField.text = collegeDetail.link
    }

    @IBAction func safariButton(_ sender: Any)
    {
        var urlString = URL(string:collegeDetail.link)!
        UIApplication.shared.openURL(urlString)
    }
  
    @IBAction func saveButtonTapped(_ sender: Any)
    {
        collegeDetail.image = myImageView.image
        
        collegeDetail.name = collegeTextField.text!
        
        collegeDetail.location = locationTextField.text!
        
        collegeDetail.mascot = mascotTextField.text!
        
        collegeDetail.link = linkTextField.text!
        
        linkTextField.resignFirstResponder()
    }
    func getPhotoLibrary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        imagePicker.dismiss(animated: true)
        {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImageView.image = selectedImage
        }
    }

    @IBAction func cameraButton(_ sender: Any)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            getPhotoLibrary()
        }

    }
    
    @IBAction func photoLibraryButton(_ sender: Any)
    {
                getPhotoLibrary()
    }

}
