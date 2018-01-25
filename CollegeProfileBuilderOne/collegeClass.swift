//
//  collegeClass.swift
//  CollegeProfileBuilderOne
//
//  Created by Elizabeth on 2/8/17.
//  Copyright © 2017 Elizabeth. All rights reserved.
//

import UIKit

class collegeClass: NSObject
{
    var name  = ""
    var location  = ""
    var  mascot = ""
    var image  = UIImage(named: "defualt")
    var link = ""
    
    init(Name:String, Location:String, Mascot:String, Image:UIImage, Link:String)
    {
        name = Name
        location = Location
        mascot = Mascot
        image = Image
        link = Link
    }
    
    init(Name:String, Location:String)
    {
        name = Name
        location = Location
       
    }
}

