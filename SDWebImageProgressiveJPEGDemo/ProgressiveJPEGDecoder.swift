//
//  ProgressiveJPEGDecoder.swift
//  SDWebImageProgressiveJPEGDemo
//
//  Created by Bogdan Poplauschi on 25/10/2017.
//  Copyright © 2017 SDWebImage. All rights reserved.
//

import UIKit
import SDWebImage
import Concorde

class ProgressiveJPEGDecoder: NSObject, SDWebImageProgressiveCoder {
    func canIncrementallyDecode(from data: Data?) -> Bool {
        return true
    }
    
    func incrementallyDecodedImage(with data: Data?, finished: Bool) -> UIImage? {
        if let data = data {
            if let bufferedImageDecoder = CCBufferedImageDecoder(data: data) {
                bufferedImageDecoder.decompress()
                return bufferedImageDecoder.toImage()
            }
        }
        return nil
    }
    
    func canDecode(from data: Data?) -> Bool {
        return true
    }
    
    func decodedImage(with data: Data?) -> UIImage? {
        if let data = data {
            if let imageDecoder = CCBufferedImageDecoder(data: data) {
                imageDecoder.decompress()
                return imageDecoder.toImage()
            }
        }
        return nil
    }
    
    func decompressedImage(with image: UIImage?, data: AutoreleasingUnsafeMutablePointer<NSData?>, options optionsDict: [String : NSObject]? = nil) -> UIImage? {
        return image
    }
    
    func canEncode(to format: SDImageFormat) -> Bool {
        return false
    }
    
    func encodedData(with image: UIImage?, format: SDImageFormat) -> Data? {
        return nil
    }
}
