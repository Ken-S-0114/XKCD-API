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
    private var title: BehaviorRelay<String>
    private var date: BehaviorRelay<String>
    private var imageUrl: BehaviorRelay<URL?>

    private var latestComicNum: BehaviorRelay<Int?>
    private var currentComic: BehaviorRelay<Comic?>

    init() {}

}
