//
//  01_基本数据类型.swift
//  LearnSwift
//
//  Created by 孙浩博 on 2020/4/6.
//  Copyright © 2020 孙浩博. All rights reserved.
//

import Foundation
//元组允许一些不相关的类型进行自由组合，成为新的集合类型，适用于简单数据结构，复杂数据结构依然推荐用类或结构体。
var  pen:(name:String, length:NSInteger) = ("我的钢笔", 15)

func testBaseData(){
    print("名字:"+pen.name+" 长度:\(pen.length)")
    
//    //编译报错，Variable 'str1' used before being initialized,因为swift中String是普通类型，普通类型不能等于nil
//    var str1:String
//    if str1==nil {
//
//    }
    
    //编译报错，'nil' cannot be assigned to type 'String'
//    var str:String = "hello"
//    str = nil
//    if str==nil {
//        print("str为空")
//    }
    
    /*
     编译通过，str2是String?类型
     swift里在普通类型后面加？可以把普通类型包装成Optional类型。Optional类型不会单独存在，总会附着于某个具体数据类型之上，具体数据类型可以是基本数据类型、结构体或者类等。
     Optional类型只有两种值：
     1.如果附着类型对应的量值有具体的值，则为具体值得包装。
     2.如果附着类型对应的量值没有具体的值，则其为nil
    */
    
    var str2:String?
    if str2 != nil {
        var str3 = "hello" + str2!
        print(str3)
    }
    
    //用if let结构判断要拆包的变量是否为nil
    if let tmp = str2 {
        var str3 = "hello" + str2!
        print(str3)
    }else{
        str2 = "world"
        var str3 = " hello" + str2!
        print(str3)
    }
    
    //typealias关键字可以为类型取别名
    typealias Price = NSInteger
    var price:Price = 12;

}



