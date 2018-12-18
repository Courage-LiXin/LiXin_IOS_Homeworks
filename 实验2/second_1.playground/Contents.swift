import UIKit

var str = "Hello, playground"

print("1--------------------------------------")

//给定一个Dictionary，Dictionary包含key值name和age，用map函数返回age字符串数组
let dictionary = [["name":"lixin","age":"21"],["name":"xucanyang","age":"22"],["name":"chenxiangyu","age":"20"]]
let age = dictionary.map {($0["age"]!)}
print(age)

print("2--------------------------------------")

//给定一个String数组，用filter函数选出能被转成Int的字符串
var array = ["i","o","s","2","1","4"]
var arrayInt = array.filter{Int($0) != nil}
print(arrayInt)

print("3--------------------------------------")

//用reduce函数把String数组中元素连接成一个字符串，以逗号分隔
var arrayStr = array.reduce("",{$0+","+$1})
arrayStr.remove(at:arrayStr.startIndex)
print(arrayStr)

print("4--------------------------------------")

//用reduce方法一次求出整数数组的最大值、最小值、总数和
var intArray = [10,4,2,11,63]
let intArrayM = intArray.reduce((max:intArray[0],min:intArray[0],sum:0),{ (max: max($0.max, $1), min: min($0.min, $1), $0.sum + $1) })
print(intArrayM)

//var int = [10,4,2,11,63,99,73,8]
//let sum = int.reduce(0,+)
//print("sum:\(sum)")

print("5--------------------------------------")

//新建一个函数数组，函数数组里面保存了不同函数类型的函数
//要求从数组里找出参数为一个整数，返回值为一个整数的所有函数
//函数类型为(Int) -> Int
func f1(a: Int) -> Int {
    return a
}

//函数类型为(String) -> Int
func f2(a: String) -> Int {
    return Int(a)!
}

//函数类型为() -> Int
func f3() -> Int {
    return 2
}

//函数类型为(Int) -> Void
func f4(a: Int) {
}

//函数类型为(Int) -> Int
func f5(a: Int) -> Int {
    return a + 1
}

let funcArr: [Any] = [f1, f2, f3, f4, f5]
for (index, value) in funcArr.enumerated() {
    //因为循环过程中需要设计到数组的下标，要将数组元素一一列举出来
    //所以需要调用数组的enumerated()方法。
    if value is (Int) -> Int {
        print("func f\(index) satisfy the condition") //输出类型为(Int) -> Int的函数在数组中的下标
    }
}



print("6--------------------------------------")

//扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证

import func Darwin.sqrt
extension Int {
    func sqrt(num:Int) -> Double {
        return Darwin.sqrt(Double(num))
    }
}
print(sqrt(4))

print("7--------------------------------------")

//（7)实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值
//分别传入整数值、浮点数值、字符串进行验证。
func getMaxAndMin<T: Comparable>(a: [T]) -> (T, T) {
    var max = a[0]
    var min = a[0]
    for i in a {
        if i > max {
            max = i
        } else if i < min {
            min = i
        }
    }
    return (max, min)
}

print("验证整数值-------")
print(getMaxAndMin(a:[1, 2, 3, 8]))
print("验浮点数值-------")
print(getMaxAndMin(a:[1.1,2.1,3.1,8.1]))
print("验证字符串-------")
print(getMaxAndMin(a: ["a", "b", "A","veg"]))




