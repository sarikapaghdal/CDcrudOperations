//
//  EmployeeListVC.swift
//  CDcrudOperations
//
//  Created by Sarika on 15.03.22.
//

import UIKit

class EmployeeListVC: UIViewController {

    @IBOutlet weak var tblEmployee: UITableView!
    
    private let manager = EmployeeManager()
    var employees : [Employee]? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Employees List"
        employees = manager.fetchEmployee()
        
        if (employees != nil && employees?.count != 0) {
            self.tblEmployee.reloadData()
        }
    }
    
    //MARK : Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == SegueIdentifier.navigateToEmployeeDetailView ){
            let detailsView = segue.destination as? DetailVC
            guard detailsView != nil else { return }
            
            detailsView?.selectedEmployee = self.employees![self.tblEmployee.indexPathForSelectedRow!.row]
        }
    }
}
