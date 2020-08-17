//
//  ViewController.swift
//  TestDocScanner
//
//  Created by Christopher Hovey on 8/17/20.
//  Copyright © 2020 Chris Hovey. All rights reserved.
//

import UIKit
import VisionKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func docScannerPress(_ sender: AnyObject){
        
        if #available(iOS 13.0, *) {
            let scanVC = VNDocumentCameraViewController()
            scanVC.delegate = self
            present(scanVC, animated: true, completion: nil)
        } else {
        }
    }
    
    @IBAction func photoPress(_ sender: AnyObject){
        let vc = UIImagePickerController()
        
        vc.sourceType = .camera
        vc.allowsEditing = false// true
        vc.showsCameraControls = true
        vc.delegate = self
        
        present(vc, animated: true, completion: nil)
    }


}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: VNDocumentCameraViewControllerDelegate{
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {

        controller.dismiss(animated: true, completion: nil)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        controller.dismiss(animated: true, completion: nil)
        print("error received", error.localizedDescription)
    }
}
