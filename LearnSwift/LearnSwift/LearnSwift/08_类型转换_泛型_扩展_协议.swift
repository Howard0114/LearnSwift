//
//  08_类型转换_泛型_扩展_协议.swift
//  LearnSwift
//
//  Created by 孙浩博 on 2020/4/10.
//  Copyright © 2020 孙浩博. All rights reserved.
//

import Foundation


class MyBaseClass{
    var name:String
    var age:NSInteger
    init() {
        name = "hhhhh"
        age = 20
    }
}

extension MyBaseClass{
    var nameAndAge:String{
        return "\(name)\(age)"
    }
}

class MySubClassA: MyBaseClass {
    var count:Int?
}

class MySubClassB: MyBaseClass {
    var isBiger:Bool?
}

class MySubClassC {
    
}
class MySubClassD {
    
}
class MySubClassE {
    
}

func exchange<TempType>(param1: inout TempType, param2: inout TempType){
    let tmp = param1
    param1 = param2
    param2 = tmp
}

struct stack<ItemType> {
    var items:Array<ItemType> = []
    mutating func push(param:ItemType){
        self.items.append(param)
    }
    mutating func pop()->ItemType{
        return self.items.removeLast()
    }
}

protocol MyProtocol {
    var name:String{get set}
    func printName()
    static func logClassName()
}

class MyClass12: MyProtocol {
    var name: String
    
    init() {
        name = "hhhh"
    }
    func printName() {
        print(name)
    }
    static func logClassName() {
        print("MyClass12")
    }
}


func testExterntion(){
    var str = "hhh"
    if str is String {
        print("str是string类型")
    }
    
    let obj1:MyBaseClass = MyBaseClass()
    obj1.name = "hhhhh"
    let obj2:MySubClassA = MySubClassA()
    obj2.count = 3
    let obj3:MySubClassB = MySubClassB()
    obj3.isBiger = true
    let array:Array<MyBaseClass> = [obj1, obj2, obj3]
    for obj in array {
        if obj is MySubClassA {
            print((obj as! MySubClassA).count!)
        }else if obj is MySubClassB {
            print((obj as! MySubClassB).isBiger!)
        }else if obj is MyBaseClass {
            print(obj.name)
        }
    }//打印hhhhh
    //3
    //true
    
    let obj4 = MySubClassC()
    let obj5 = MySubClassD()
    let obj6 = MySubClassE()
    let array2:Array<AnyObject> = [obj4, obj5, obj6]
    let array3:Array<Any> = [obj4, obj5, obj6, "hhhh"]
    for obj in array3 {
        if obj is MySubClassC {
            print("MySubClassC")
        }else if obj is MySubClassD{
            print("MySubClassD")
        }else if obj is MySubClassE{
            print("MySubClassE")
        }else{
            print("other")
        }
    }
    
    var  obj7 = MyBaseClass()
    print(obj7.nameAndAge)
    
    //运行会产生崩溃，stepSize读写冲突
    var stepSize = 1
    func increment(_ number: inout NSInteger){
        number += stepSize
    }
//    increment(&stepSize)
    
}
