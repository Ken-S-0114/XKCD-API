//
//  ComicViewController.swift
//  XKCD
//
//  Created by 佐藤賢 on 2018/11/27.
//  Copyright © 2018 佐藤賢. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class ComicViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var comicImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!

    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    private var comicViewModel = ComicViewModel()

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

