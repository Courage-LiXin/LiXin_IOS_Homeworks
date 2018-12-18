import UIKit

var str = "Hello, playground"

//定义可变数组，用于存放找出来的质数
var primes = [Int]()

//循环找出1-10000的质数
for i in 2...10000{
    var isprimes = true
    for j in 2..<i{
        if i%j == 0{
            isprimes = false
        }
    }
    if isprimes{
        primes.append(i)
    }
}
print("1-10以内的质数：")
print(primes)

//往数组中加入几个数字，便于验证是否排序成功
print("在数组中增加数值3，4，7，重新排序")
primes.append(3)
primes.append(4)
primes.append(7)
print("从大到小排列----------------------------")

//排序1
func compare(_ x:Int,_ y:Int) -> Bool{
    return x>y
}
primes.sort(by:compare)
print(primes)

//以下均是利用Swift资源包的sort方法排序

//排序2，闭包，给定参数和参数类型
print("在数组中增加数值9，重新排序")
primes.append(9)
primes.sort(by:{
    (x:Int,y:Int) in
    return x>y
})
print(primes)

//排序3，闭包，基于类型推导
print("在数组中增加数值12，重新排序")
primes.append(12)
primes.sort(by:{
    (x,y) in
    return x>y
})
print(primes)

//排序4，闭包，基于参数，省略参数名
print("在数组中增加数值17，重新排序")
primes.append(17)
primes.sort(by:{
    return $0>$1
})
print(primes)

//排序5，闭包，闭包内只含有一行语句，则可以省去return关键字
print("在数组中增加数值15，重新排序")
primes.append(15)
primes.sort(by: {
    $0 > $1
})
print(primes)


//排序6，不带闭包函数
print("在数组中增加数值21，重新排序")
primes.append(21)
primes.sort{
    $0 > $1
}
print(primes)

//排序7
print("在数组中增加数值110，223，重新排序")
primes.append(110)
primes.append(233)
primes.sort(by:>)
print(primes)

//sort方法默认从小到大排列
print("从小到大排列----------------------------")
primes.sort()
print(primes)





