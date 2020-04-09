//
//  04_函数与block.swift
//  LearnSwift
//
//  Created by 孙浩博 on 2020/4/7.
//  Copyright © 2020 孙浩博. All rights reserved.
//

import Foundation

func getPerson() -> (name:String, age:NSInteger) {
    return ("张三", 20);
}

func setPerson(name str:String, age value:NSInteger){
    print("\(str),\(value)")
}

//func add(value1:NSInteger, value2:NSInteger, value3:NSInteger = 10){
//    print(value1+value2+value3)
//}

func add2(values:NSInteger...){
    var sum:NSInteger = 0
    for value in values {
        sum += value
    }
    print(sum)
}

func fun(value:inout NSInteger){
    value += 1
}

func fun2(value:NSInteger, value2:NSInteger){
    func add(val1:NSInteger, val2:NSInteger)->NSInteger{
        return val1+val2
    }
    print(add(val1: value, val2: value2))
}

func testFunAndBlock(){
//    let person = getPerson()
//    print(person)
//    setPerson(name: "张三", age: 20)
//    add(value1: 1, value2: 2)
//    add(value1: 1, value2: 2, value3: 3)
    
//    add2(values: 1,2,3)
//    var param = 10
//    fun(value: &param)
//    print(param)
//    fun2(value: 1, value2: 2)
//
//    let addBlock = {(value1:NSInteger, value2:NSInteger)->NSInteger in
//        value1 + value2
//    }
//
//    print(addBlock(1,2))
//    let number = fun3(value1: 1, value2: 2) { (val1:NSInteger, val2:NSInteger) -> NSInteger in
//        return val1+val2
//    }
//
//    let number1 = fun3(value1: 1, value2: 2, addBlock: { (val1:NSInteger, val2:NSInteger) -> NSInteger in
//        return val1+val2
//    })
//
//    let number2 = fun3(value1: 1, value2: 2){$0+$1}
//
//    print(number2)
    fun4 {
        print("hello")
    }
}//打印 3

func fun3(value1:NSInteger, value2:NSInteger, addBlock:(NSInteger, NSInteger)->NSInteger) -> NSInteger {
    return addBlock(value1, value2)
}

func fun4(completeBlock:@escaping()->Void) {
    let deadLine = DispatchTime.now()+10
    DispatchQueue.main.asyncAfter(deadline: deadLine) {
        completeBlock()
    }
}

