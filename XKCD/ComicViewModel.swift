//
//  ComicViewModel.swift
//  XKCD
//
//  Created by 佐藤賢 on 2018/11/27.
//  Copyright © 2018 佐藤賢. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire

final class ComicViewModel  {
    var title: BehaviorRelay<String>
    var date: BehaviorRelay<String>
    var imageUrl: BehaviorRelay<URL?>

    var latestComicNum: BehaviorRelay<Int?>
    var currentComic: BehaviorRelay<Comic?>

    private var formatter = DateFormatter()

    var isNextEnabled: Driver<Bool>
    var isPreviousEnable: Driver<Bool>

    init() {
        title = BehaviorRelay<String>(value: "")
        date = BehaviorRelay<String>(value: "")
        imageUrl = BehaviorRelay<URL?>(value: nil)

        latestComicNum = BehaviorRelay<Int?>(value: nil)
        currentComic = BehaviorRelay<Comic?>(value: nil)

        formatter.dateStyle = .long
        formatter.timeStyle = .none

        // combineLatestでその両方が同じの場合（見ているコミックは最新）はfalseを返す
        // distinctUntilChangedは回覧中が変わる度にブールの値が変わらなければ無駄にenabledのバインディング処理が起こさないようにある
        isNextEnabled = Driver.combineLatest(self.latestComicNum.asDriver(), self.currentComic.asDriver(), resultSelector: { (latestNum, current) -> Bool in
            guard let latestNum = latestNum, let currentNum = current?.num else { return false }
            return latestNum != currentNum
        }).distinctUntilChanged()

        isPreviousEnable = currentComic.asDriver().map({ comic -> Bool in
            guard let num = comic?.num else { return false }
            return num > 1
        }).distinctUntilChanged()
    }

}
