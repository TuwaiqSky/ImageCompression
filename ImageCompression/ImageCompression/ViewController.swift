//
//  ViewController.swift
//  ImageCompression
//
//  Created by Hanan on 26/11/2020.
//

import UIKit
import DataCompression

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var capturedImage: UIImageView!
    
    @IBOutlet var sizeBeforeLabel: UILabel!
    @IBOutlet var sizeAfterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func captureAndCompress(_ sender: UIButton) {
        
        let cameraView = UIImagePickerController()
        cameraView.delegate = self
        cameraView.sourceType = .camera
        
        self.present(cameraView, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        capturedImage.image = image
        picker.dismiss(animated: true, completion: nil)
       
        let imgData = image.jpegData(compressionQuality: 1)
        let imageSize: Int = imgData!.count
        sizeBeforeLabel.text =  "\((( Double(imageSize) / 1024.0)).rounded()) KB"

        let zippedImage: Data! = imgData!.zip()
        let zipImageSize: Int = zippedImage.count
        sizeAfterLabel.text =  "\(((Double(zipImageSize) / 1024.0)).rounded()) KB"
    }
}
    
//    func saveImage(_ image: Data) throws {
//        let path = documentDirectory().appendingPathComponent("Image.jpeg")
//        try image.write(to: path, options: [.atomic])
//            print (documentDirectory())
//    }
//
//    func saveZipImage(_ image: Data) throws {
//        let path = documentDirectory().appendingPathComponent("ZipImage.zip")
//        try image.write(to: path, options: [.atomic])
//            print (documentDirectory())
//    }
//
//    func documentDirectory() -> URL {
//        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let docDirectory = url[0]
//        return docDirectory
//    }




