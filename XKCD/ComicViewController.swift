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

        setupRx()

    }

    private func setupRx() {
        comicViewModel.title.asDriver().drive(titleLabel.rx.text).disposed(by: disposeBag)
        comicViewModel.imageUrl.asDriver().drive(onNext: { [weak self] url in
            self?.comicImageView.kf.setImage(with: url)
        }).disposed(by: disposeBag)

        // ビューモデルがコミックのタイトルを取得できたらRxの力でタイトルラベルに自動的に反映
        comicViewModel.date.asDriver().drive(captionLabel.rx.text).disposed(by: disposeBag)
        // isNextEnabledはnextButtonのenabledプロパティーにバインドされるため自動的に反映される・
        comicViewModel.isNextEnabled.drive(nextButton.rx.isEnabled).disposed(by: disposeBag)
        comicViewModel.isPreviousEnable.drive(previousButton.rx.isEnabled).disposed(by: disposeBag)
    }

}

