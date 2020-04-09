//
//  07_内存管理.swift
//  LearnSwift
//
//  Created by 孙浩博 on 2020/4/9.
//  Copyright © 2020 孙浩博. All rights reserved.
//

import Foundation

class ClassOne{
    //用weak进行弱引用避免循环引用
    weak var two:ClassTwo?
    deinit {
        print("ClassOne deinit")
    }
}

class ClassTwo{
    var one:ClassOne?
    init(one:ClassOne?) {
        self.one = one
    }
    deinit {
        print("ClassTwo deinit")
    }
}

func memoryTest(){
    var one:ClassOne? = ClassOne.init()
    var two:ClassTwo? = ClassTwo.init(one: one)
    one?.two = two
    one = nil
    two = nil
}
