//
//  ViewController.swift
//  ImageEditorDemoApp
//
//  Created by Kondya on 04/05/19.
//  Copyright © 2019 Kondya. All rights reserved.
//

import UIKit
import iOSPhotoEditor
class ImageSelectionVC: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
       
    }

    @IBAction func selectImageAction(_ sender: UIButton) {
        
        
        
        self.imagePicker.present(from: sender)
        
    }
    
    
    
}
extension ImageSelectionVC: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        //self.imageView.image = image
        let photoEditor = PhotoEditorViewController(nibName:"PhotoEditorViewController",bundle: Bundle(for: PhotoEditorViewController.self))
        photoEditor.photoEditorDelegate = self
        photoEditor.image = image
        //        photoEditor.hiddenControls = [.sticker,.crop,.draw,.save]
        
        
        //Colors for drawing and Text, If not set default values will be used
        //photoEditor.colors = [.red, .blue, .green]
        
        //Stickers that the user will choose from to add on the image
        for i in 0...8 {
            photoEditor.stickers.append(UIImage(named: i.description )!)
        }
    
        //To hide controls - array of enum control
        photoEditor.hiddenControls = [.crop, .draw,.text]
        
        present(photoEditor, animated: false, completion: nil)
        
    }
}
extension ImageSelectionVC: PhotoEditorDelegate {
    
    func doneEditing(image: UIImage) {
        imageView.image = image
    }
    
    func canceledEditing() {
        print("Canceled")
    }
}

