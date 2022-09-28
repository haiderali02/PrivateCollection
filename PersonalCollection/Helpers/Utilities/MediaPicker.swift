//
//  MediaPicker.swift
//  PersonalCollection
//
//  Created by Haider Ali on 28/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import Foundation
import YPImagePicker

class MediaPicker {
    
    private var picker: YPImagePicker
    
    public typealias DidFinishPickingCompletion = (_ items: [UIImage]) -> Void
    
    init(numberOfItemsToBeSelected: Int = 1, mediaPickerType: YPlibraryMediaType = .photo) {
        
        var config = YPImagePickerConfiguration()
        config.library.maxNumberOfItems = numberOfItemsToBeSelected
        config.screens = mediaPickerType == .photo ? [.photo, .library] : [.photo, .library, .video]
        config.library.mediaType = mediaPickerType
        
        config.shouldSaveNewPicturesToAlbum = false
        config.library.preSelectItemOnMultipleSelection = false
        config.library.defaultMultipleSelection = true
        config.showsPhotoFilters = false
        config.onlySquareImagesFromCamera = false
        
        picker = YPImagePicker(configuration: config)
        
        
    }
    
    func showPicker(_ viewController: UIViewController, completion: @escaping DidFinishPickingCompletion) {
        
        picker.didFinishPicking { items, cancelled in
            
            var receivedPhotos: [UIImage] = []
            
            for item in items {
                switch item {
                case .photo(let photo):
                    print(photo)
                    receivedPhotos.append(photo.image)
                case .video(let video):
                    print(video)
                }
            }
            
            completion(receivedPhotos)
            
            self.picker.dismiss(animated: true)
        }
        
        viewController.present(picker, animated: true, completion: nil)
    }
    
}
