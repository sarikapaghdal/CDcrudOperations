//
//  CreateEmployeeVC.swift
//  CDcrudOperations
//
//  Created by Sarika on 15.03.22.
//

import UIKit

class CreateEmployeeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var txtEmployeeName: UITextField!
    @IBOutlet weak var txtEmployeeEmailId: UITextField!
    private let manager : EmployeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
    }
    
    @IBAction func selectImage(_ sender: Any) {
           let picker = UIImagePickerController()
           picker.sourceType = .savedPhotosAlbum
           picker.delegate = self
           present(picker, animated: true)
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {

           let employee = Employee(name: txtEmployeeName.text, email: txtEmployeeEmailId.text, profilePicture: imgProfilePicture.image?.pngData(), id: UUID())

           manager.createEmployee(employee: employee)
        self.performSegue(withIdentifier: SegueIdentifier.navigateToEmployeeList, sender: nil)
    }
    
    // MARK: Image picker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img = info[.originalImage] as? UIImage
        self.imgProfilePicture.image = img

        dismiss(animated: true, completion: nil)
    }

}
