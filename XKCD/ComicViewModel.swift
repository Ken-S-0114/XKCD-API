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


    init() {
        title = BehaviorRelay<String>(value: "")
        date = BehaviorRelay<String>(value: "")
        imageUrl = BehaviorRelay<URL?>(value: nil)

        latestComicNum = BehaviorRelay<Int?>(value: nil)
        currentComic = BehaviorRelay<Comic?>(value: nil)

        formatter.dateStyle = .long
        formatter.timeStyle = .none
    }

}
