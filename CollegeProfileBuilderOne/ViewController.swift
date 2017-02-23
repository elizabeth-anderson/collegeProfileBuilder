//
//  ViewController.swift
//  CollegeProfileBuilderOne
//
//  Created by Elizabeth on 2/8/17.
//  Copyright © 2017 Elizabeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!

    var myCollegeObject:[collegeClass] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(collegeClass(Name: "University of Indiana", Location: "Bloomington", Mascot: "Hoosier", Image: UIImage(named: "indiana")!, Link:"https://www.indiana.edu/"))
        
        myCollegeObject.append(collegeClass(Name: "Michigan State", Location: "Lansing", Mascot: "Spartan", Image: UIImage(named: "michigan")!, Link:"https://www.indiana.edu/"))
        
        myCollegeObject.append(collegeClass(Name: "University of Michigan", Location: "Ann-Arbor", Mascot: "Wolverine", Image: UIImage(named: "michiganu")!, Link:"https://www.indiana.edu/"))
    }
    
    
    
  @IBAction func addButtonTapped(_ sender: Any)
    {
        let alert = UIAlertController(title: "add college", message: nil, preferredStyle: .alert)
        
        alert.addTextField
            {
                (collegeTextField) in collegeTextField.placeholder = "add college"
            }
        
        alert.addTextField
            {
                (locationTextField) in locationTextField.placeholder = "add location"
            }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default)
            {
                (action) in
                
                let collegeTextField = alert.textFields?[0]
                
                let locationTextField = alert.textFields?[1]
            
            
                self.myCollegeObject.append(collegeClass(Name: (collegeTextField?.text)!, Location: (locationTextField?.text)!))
            
                self.myTableView.reloadData()
            }
        
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return myCollegeObject.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            
            cell.textLabel?.text = myCollegeObject[indexPath.row].name
            
            cell.detailTextLabel?.text = myCollegeObject[indexPath.row].location
        
            return cell
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == .delete)
        {
            myCollegeObject.remove(at: indexPath.row)
            
            myTableView.reloadData()
        }
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            let detailView = segue.destination as! detailViewController
            
            let selectedRow = myTableView.indexPathForSelectedRow?.row
            
            detailView.collegeDetail = myCollegeObject[selectedRow!]
        }

    override func viewDidAppear(_ animated: Bool)
        {
            myTableView.reloadData()
        }
    
    
    
}














