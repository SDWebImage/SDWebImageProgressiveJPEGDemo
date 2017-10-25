//
//  ViewController.swift
//  SDWebImageProgressiveJPEGDemo
//
//  Created by Bogdan Poplauschi on 25/10/2017.
//  Copyright © 2017 SDWebImage. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SDWebImageCodersManager.sharedInstance().addCoder(ProgressiveJPEGDecoder())
        
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "http://www.pooyak.com/p/progjpeg/jpegload.cgi?o=1")
        imageView.sd_setImage(with: url, placeholderImage:nil, options:.progressiveDownload) { (image, error, cacheType, url) in
            if let image=image, let error=error, let url=url {
                print(image, error, cacheType, url)
            }
        }
    }
}
