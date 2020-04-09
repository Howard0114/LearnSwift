//
//  06_类和结构体.swift
//  LearnSwift
//
//  Created by 孙浩博 on 2020/4/8.
//  Copyright © 2020 孙浩博. All rights reserved.
//

import Foundation
struct Car {
    //价格
    var price:NSInteger
    //品牌
    var brand:String
    //油量
    var petrol:NSInteger
    //提供一个驾驶方法
    mutating func drive(){
        if petrol > 0{
            petrol -= 1
            print(petrol)
        }
    }
    //提供一个加油方法
    mutating func addPetrol(){
        petrol += 10
        print("加了10升油")
    }
}

class Wheel{
    var name:String = "左前轮"
    var bar:Float = 2.5
//    init(name:String, bar:Float) {
//        self.name = name
//        self.bar = bar
//    }
}

class ClassCar{
    //价格
    var price:NSInteger
    //品牌
    var brand:String
    //油量
    var petrol:NSInteger
    
    lazy var wheel:Wheel = Wheel()//Wheel(name: "左前轮", bar: 2.5)
    
    //提供一个驾驶方法
    func drive(){
        if petrol > 0{
            petrol -= 1
//            print(petrol)
        }
    }
    //提供一个加油方法
    final func addPetrol(){
        petrol += 10
        print("加了10升油")
    }
    //类比结构体多了个构造方法
    init(price:NSInteger, brand:String, petrol:NSInteger) {
        self.price = price
        self.brand = brand
        self.petrol = petrol
    }
}

class BMWCar: ClassCar {
    var color: String = "蓝色"
    override func drive() {
        super.drive()
        petrol -= 1
    }
    override init(price:NSInteger, brand:String="宝马", petrol:NSInteger) {
        super.init(price: price, brand: brand, petrol: petrol)
    }
}

class RectClass {
    var width:Float{
        willSet{
            print("将要设置的值:\(newValue)")
        }
        didSet{
            print("旧的值:\(oldValue)")
        }
    }
    var height:Float
    var area:Float{
        get{//定义面积长x宽
            return width*height
        }
        set{//计算宽度=面积/高  newValue是set方法固定值
            width = newValue/height
        }
    }
    init(width:Float, height:Float) {
        self.width = width
        self.height = height
    }
}

class SomeClass{
    static var className:String = "class name"
    class var subName:String{
        get{
            return "some "+className
        }
    }
    static func printName(){
        print(className)
    }
    
    class func printSubName(){
        print(subName)
    }
}

class SubClass: SomeClass {
    override class var subName: String{
        return "subName"
    }
    
    override class func printSubName() {
        print("subclass printSubName")
        super.printSubName()
    }
}

class Point{
    var x:Double
    var y:Double
    
    func move(x:Double, y:Double){
        self.x += x
        self.y += y
    }
    
    init(x:Double, y:Double) {
        self.x = x
        self.y = y
    }
}

struct PointStruct {
    var x:Double
    var y:Double
    
    mutating func move(x:Double, y:Double){
        self.x += x
        self.y += y
    }
}

class MyArray{
    var array:Array<Array<NSInteger>>
    init(param:Array<NSInteger>...) {
        array = param
    }
    
    subscript(index1:NSInteger, index2:NSInteger)->NSInteger{
        set{
            array[index1][index2] = newValue
        }
        get{
            let temp = array[index1]
            return temp[index2]
        }
    }
}

class BaseClass{
    init() {//指定构造方法
        print("指定构造方法")
    }
    init(param:Int) {
        print("指定构造方法param")
    }
    convenience init(param:String) {//便利构造方法
        print("便利构造方法")
        self.init()
    }
}
//此类中不进行任何构造方法的定义，默认继承父类的所有构造方法
class subClass1: BaseClass {
    
}

//对无参的init指定构造方法进行重写，则不再继承父类的其他构造方法
class subClass2: BaseClass {
    override init() {
        super.init()
    }
}

//没有重写父类的构造方法，但是重载定义了自己的构造方法，则不再继承父类的其他构造方法
class subClass3: BaseClass {
    init(param:Bool) {
        super.init()
    }
}

//此类中不进行任何构造方法的定义，默认继承父类的所有构造方法
class subClass4: BaseClass {
    override init() {
        super.init()
    }
    
    override init(param: Int) {
        super.init(param: param)
    }
}

class subClass: BaseClass {
    override init() {//指定构造方法
        super.init()
    }
    convenience init(param:String) {//便利构造方法
        self.init()
    }
//    convenience init(param:Int) {//便利构造方法
//        self.init(param:"hhhh")
//    }
}

class BaseClassA{
    var property:Int
    
    init(param:Int) {
        self.property = param
    }
    //可失败构造方法
    init?(param: Bool) {
        guard param else {
            return nil
        }
        property = 1
    }
    //析构方法
    deinit {
        
    }
}

class SubClassA: BaseClassA {
    var subProperty:Int
    init() {
        //检查原则1：必须在调用父类构造方法前完成本身属性的赋值
        subProperty = 1
        super.init(param: 0)
        //检查原则2：如果要重新赋值父类继承来的某个属性，必须在调用父类的指定构造方法后
        property = 2
        //检查原则4：在完成父类的构造方法之后，才能用self关键字
    }
    
    convenience init(param1:Int, param2:Int) {
        self.init()
        //检查原则3：遍历构造方法重要修改属性的值，必须在调用指定的构造方法之后
        subProperty = param1
        property = param2
    }
}

func testStructAndClass(){
//    var car = Car(price: 300000, brand: "奔驰", petrol: 60)
//    print("这辆:\(car.brand) 价格:\(car.price) 油量:\(car.petrol)")
//    var car1:Car = car
//    car1.drive();
//    print(car.petrol)
//    print(car1.petrol)
    //打印60 59
//    for _ in 0...100 {
//        if car.petrol > 0{
//            car.drive()
//        }else{
//            car.addPetrol()
//        }
//    }
    
//    var car3:ClassCar = ClassCar.init(price: 300000, brand: "宝马", petrol: 55)
//    var car4:ClassCar = car3
//    car3.drive();
//    print(car3.petrol)
//    print(car4.petrol)
//    //打印54 car3 car4指向同一个对象
    
    var car5:BMWCar = BMWCar.init(price: 350000, petrol: 55)
    print(car5.petrol)
    car5.drive()
    print(car5.petrol)
    
    var arr1:Array = [0,1,2]
    var arr2:Array = arr1
    arr1.append(3)
    print(arr1)
    print(arr2)
    //打印[0, 1, 2, 3]
    //[0, 1, 2]
    
    //初始化时候width是5
    var rect:RectClass = RectClass.init(width: 5, height: 10)
    print(rect.width, rect.height, rect.area)
    //间接调用了width的set，新值为10
    rect.area = 100
    print(rect.width, rect.height, rect.area)
    //输出将要设置的值:10.0
    //旧的值:5.0
    //10.0 10.0 100.0
    
//    print(SomeClass.className)
//    print(SomeClass.subName)
//    print(SomeClass.printName())
//    print(SomeClass.printSubName())
    
    
//    print(SubClass.className)
//    print(SubClass.subName)
//    print(SubClass.printName())
//    print(SubClass.printSubName())
    var array = MyArray(param: [1,2,3],[4,5,6],[7,8,9])
    print(array[1, 1])
    array[1, 1] = 12
    print(array[1,1])
    //打印5
    //12
}

