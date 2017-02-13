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
    
    init(Name:String, Location:String, Mascot:String, Image:UIImage)
    {
        name = Name
        location = Location
        mascot = Mascot
        image = Image
    }
    
    init(Name:String, Location:String)
    {
        name = Name
        location = Location
        
    }
}

