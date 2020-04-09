//
//  05_高级运算符.swift
//  LearnSwift
//
//  Created by 孙浩博 on 2020/4/7.
//  Copyright © 2020 孙浩博. All rights reserved.
//

import Foundation

func testOperator() {
    var value:UInt8 = 255;
    value = value &+ 1;//编译通过 value = 0
    value = value &- 1;//编译通过 value = 255
    value = value &* 2;//编译通过 value = 254
    print(value)
    
//    let str3 = ++("hello", "world")
//    let str3 = strAppend(closure:"hello" + "world")
    let value1 = 3++
    print(value1)
    
    var sur:Surname = Surname.张
    sur = Surname.李
    switch sur {
    case .张:
        print(sur)
    case .王:
        print(sur)
    case .李:
        print(sur)
    case .赵:
        print(sur)
    default:
        print(sur)
    }
    print(sur)
}

prefix operator ++
prefix func ++ (value:NSInteger) -> NSInteger {
    return value + 1
}

infix operator ++
func ++ (value1:NSInteger, value2:NSInteger) -> NSInteger {
    return value1*value1 + value2*value2
}

postfix operator ++
postfix func ++ (value:NSInteger) -> NSInteger {
    return value + value
}

enum Surname {
    case 张
    case 王
    case 李
    case 赵
}


