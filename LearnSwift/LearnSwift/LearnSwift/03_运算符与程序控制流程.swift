//
//  03_运算符与程序控制流程.swift
//  LearnSwift
//
//  Created by 孙浩博 on 2020/4/6.
//  Copyright © 2020 孙浩博. All rights reserved.
//

import Foundation

func testSymbol(){
    //打印"字符串"，因为str有值，所以对str拆包
    let str:String? = "字符串"
    let str1 = str ?? "啦啦啦"
    print(str1)
    
    /*输出
    true
    false
    1
    2
    3*/
    let range1 = 1...3
    let range2 = 1..<3
    print(range1 ~= 3)
    print(range2 ~= 3)
//    for index in range1 {
//        print(index)
//    }
//
//    let array:Array = [0,1,2]
//    for value in array {
//        print(value)
//    }
    
    
    var i:NSInteger = 0
//    if i {
//        print(i)
//    }//编译报错Cannot convert value of type 'NSInteger' (aka 'Int') to expected condition type 'Bool'
    
    if i != 0 {
        print(i)
    }//编译不报错，但是记住!=需要跟i中间有个空格，否则被认为是拆包操作编译报错
    
    while i<3 {
        print(i)
        i+=1
    }//输出012
    
    var j:NSInteger = 3
    repeat{
        print(j)
        j+=1
    }while j<3
    //输出3
    
    let charac:Character = "a"
    switch charac {
    case "a","b":
        print("charac is a||b")

    case "c":
        print("charac is c")

    case "d":
        print("charac is d")
        
    default:
        print("no charac")
    }
    //输出charac is a||b
    
    var value:NSInteger = 3
    switch value {
    case 1...3:
        print("value <= 3")
    case 4...6:
        print("value >=4 <=6")
    default:
        print("value > 6")
    }//输出value <= 3
    
    var tuple = (0,1)
    switch tuple {
    case (0,1)://两个值都匹配上才算匹配上
        print("完全匹配")
        fallthrough
    case (_,1)://忽略某个值，只进行另一个值的匹配
        print("选择匹配")
        fallthrough
    case (0...3,0...3)://值符合范围就算匹配上
        print("范围匹配")
    default:
        print("no")
    }
    //输出 
    
    /*
     
     */
    var value2 = (0,0)
    switch value2 {
    case (let a, 1)://如果第二个元素为1，则会走进这个case，并且把第一个值捕获到a中
        print(a)
    case (let b, 0):
        print(b)
    case (let a, let b)://捕获到元组中两个元素，等价于这种写法let（a,b）
        print(a, b)
    default:
        print("")
    }
    
    var value3:NSInteger = 3
    guard value3 < 4 else {
        print("value3 < 4")
    }
    print("value3 >= 4")
    //打印value3 >= 4
}
