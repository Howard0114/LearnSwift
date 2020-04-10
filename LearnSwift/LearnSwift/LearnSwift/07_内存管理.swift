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

class ClassThree{
    //无主引用
    unowned var four:ClassFour?
    init(four:ClassFour) {
        self.four = four
    }
    deinit {
        print("ClassThree deinit")
    }
}
 
class ClassFour{
    //使用隐式拆包
    var three:ClassThree!
    init() {
        /*在创建three属性的时候将当前类实例本身作为参数传入
          有构造方法的原则可知在three属性创建完成之前，不可以用self属性
         对于隐式解析类的属性，上述原则可以忽略，其告诉编译器默认此属性是构造完成的
         */
        three = ClassThree(four: self)
    }
    deinit {
        print("ClassFour deinit")
    }
}

class ClassSix{
    var name:String = "hhhh"
    lazy var close:()->Void = {
        //使用捕获列表对block中的self进行无主引用的转换
        [unowned self]()->Void in
        print(self.name)
    }
    deinit {
        print("ClassSix deinit")
    }
    
}

enum MyError:Error {
    case DseToryError
    case NormarlError
    case SimpleError
}

func myFunc(param:Bool) throws -> Void {
    if param {
        print("success")
    }else{
        throw MyError.NormarlError
    }
}

func temFun() {
    defer {
        print("finish")
    }
    print("handel")
}

func memoryTest(){
    var one:ClassOne? = ClassOne.init()
    var two:ClassTwo? = ClassTwo.init(one: one)
    one?.two = two
    one = nil
    two = nil
    
//    var three:ClassThree? = ClassThree.init()
//    var four:ClassFour? = ClassFour.init(three: three)
//    three?.four = four
//    four = nil
//    three?.four//crash Fatal error: Attempted to read an unowned reference but object 0x6000036a9580 was already deallocated2020-04-09 14:09:46.214608+0800 LearnSwift[53426:10252006] Fatal error: Attempted to read an unowned reference but object 0x6000036a9580 was already deallocated
    
    var  obj5:ClassFour? = ClassFour()
//    obj5 = nil
    var obj6:ClassSix? = ClassSix()
    obj6?.close()
    obj6 = nil
    
    //使用do-catch进行异常的捕获与处理
    do {
        try myFunc(param: false)
    } catch MyError.SimpleError {
        print("SimpleError")
    } catch MyError.NormarlError {
        print("NormarlError")
    } catch MyError.DseToryError {
        print("DseToryError")
    } catch{
        print("other Error")
    }
    
    let temp = try? myFunc(param: false)
    if temp == nil {
        print("执行失败")
    }else{
        print("执行成功")
    }
    
    temFun()
    //打印handel
    //finish
}
