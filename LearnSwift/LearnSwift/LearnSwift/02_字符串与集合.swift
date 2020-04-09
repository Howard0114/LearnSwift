//
//  02_字符串与集合.swift
//  LearnSwift
//
//  Created by 孙浩博 on 2020/4/6.
//  Copyright © 2020 孙浩博. All rights reserved.
//

import Foundation

func testStringAndSet(){
    
    var str1 = "hello"
    var str2 = "world"
    var str3:String = str1 + " " + str2
    print(str3)//打印hello world “+”操作符可以实现字符串拼接
    
    var str4 = "hello \(str2)"
    print(str4)//打印hello world 如果str2未定义会报错
    
    //打印str3 str4相等
    if str3 == str4 {
        print("str3 str4相等")
    }
    
    //打印空字符串，isEmpty方法可以判断字符串是否为空
    var str5 = ""
    if str5.isEmpty {
        print("空字符串")
    }else{
        print(str5)
    }
    
    //以下两种写法一样，都是声明一个NSInteger数组
    var array1:[NSInteger] = [0,1,2,3,4,5]
    var array2:Array<NSInteger> = [0,1,2,3,4,5]
    //数组判空
    if array1.isEmpty {
        print("空数组")
    }
    //访问数组元素
    var a = array1[1]
    var subArray = array1[0 ... 3]
    
    //访问第一个元素
    var b = array1.first
    //访问最后一个元素
    var c = array2.last
    
    array1[2] = 15;
    var array3:NSArray = [NSArray (array: array1)]
    //array3[2] = 3;编译会报错，Array有别于NSArray
    var array4:NSMutableArray = [NSMutableArray (array: array1)]
    array4.firstObject
    
    array1.insert(20, at: 0)
    array1.remove(at: 3)
    array1.removeFirst()
    array1.removeLast()
    array1.removeAll()
    
    var set:Set<NSInteger> = Set.init()
    set.insert(1);
    set.insert(3);
    set.insert(3);
    print(set)//[3, 1]
    
    //下面两种声明方式等价，都表示声明一个key为String类型，value为NSInteger类型的字典
    //Dictionary也不等价于NSDictionary NSMutableDictionary
    var dic1:[String:NSInteger]
    var dic:Dictionary<String, NSInteger> = Dictionary.init()
    dic["tom"] = 1
    dic["lucy"] = 2
    dic["kate"] = 3
    
    var dic2:NSDictionary = NSDictionary.init(dictionary: dic)
    var dic3:NSMutableDictionary = NSMutableDictionary.init(dictionary: dic)
    dic3.setValue(6, forKey: "lily")
    dic3.removeObject(forKey: "tom")
    print(dic3)
 
}
