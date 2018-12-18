import UIKit

var str = "Hello, playground"

//显示当前准确的中文时间，包括北京、东京、纽约、伦敦，格式为（2016年9月28日星期三 上午10:25）
//显示中文需要设置locale

let currentDate = Date()
var formatter = DateFormatter()
formatter.dateFormat = "yyyy年M月dd日EEEE aa KK:mm"
formatter.locale = Locale(identifier: "zh_CN")

formatter.timeZone = TimeZone(abbreviation: "UTC+8:00")
let beijing = formatter.string(from: currentDate)
print("BeiJingtime:"+beijing)

formatter.timeZone = TimeZone(abbreviation: "UTC+9:00")
let Toyko = formatter.string(from: currentDate)
print("ToykoTime:"+Toyko)

formatter.timeZone = TimeZone(abbreviation: "UTC-5:00")
let NewYork = formatter.string(from: currentDate)
print("NewYorkTime:"+NewYork)
formatter.timeZone = TimeZone(abbreviation: "UTC+0:00")
let London = formatter.string(from: currentDate)
print("LondonTime:"+London)




//处理字符串
//新建字符串：“Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS.”；
//返回字符串从第6个字符到第20个字符的子串；
//删除其中所有的OS字符；


let str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
print("Before:str is \(str)")
//自定义范围
let indexBegin = str.index(str.startIndex, offsetBy: 5)
let indexEnd = str.index(str.startIndex, offsetBy: 19)
//截取字串并且输出
print("After:str is \(str[indexBegin...indexEnd])")

//删除所有的OS字符
print("After delete OS:str is \( str.replacingOccurrences(of: "OS", with: ""))")






//将1、2题的时间和字符串存入一个字典中，并存入沙盒中的Document某文件中；

var dic = [ "BeijingTime": beijing, "ToykoTime": Toyko, "NewYorkTime": NewYork, "LondonTime": London, "str1":str1,"str2":str2] as AnyObject//将字典转换为任意类型，方便后面写入文件
let fileManager = FileManager.default
var url = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!
url.appendPathComponent("testhdy.txt")
try? dic.write(to: url, atomically: true)








//从网上下载一张照片并保存到本地沙盒的Document的某文件中

let imageURL = URL(string: "https://image.baidu.com/search/detail?ct=503316480&z=undefined&tn=baiduimagedetail&ipn=d&word=%E6%9C%8B%E5%8F%8B%E5%9C%88%E8%83%8C%E6%99%AF&step_word=&ie=utf-8&in=&cl=2&lm=-1&st=undefined&cs=331579316,3227300026&os=2956666769,2704203502&simid=0,0&pn=65&rn=1&di=91559934180&ln=1905&fr=&fmq=1539081447470_R&fm=&ic=undefined&s=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&is=0,0&istype=0&ist=&jit=&bdtype=0&spn=0&pi=0&gsm=1e&hs=2&objurl=http%3A%2F%2Fwww.feizl.com%2Fupload2007%2Fallimg%2F180614%2F2143333562-6.jpg&rpstart=0&rpnum=0&adpicid=0")
let date = try Data(contentsOf:imageURL!)
let fileManager = FileManager.default
var url = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!
url.appendPathComponent("test.jpg")
try date.write(to: url)






//从网上查找访问一个JSon接口文件，并采用JSONSerialization和字典对其进行简单解析

enum MyError:Error{
    case Zero
    case NotURL
}
guard let weatherUrl = URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")
    else{
        throw MyError.NotURL
}
let jsondate = try! Data(contentsOf: weatherUrl)
let json = try! JSONSerialization.jsonObject(with: jsondate, options: .allowFragments)
print(json)
//把json文件转化为字典
guard let dictionary = json as?[String:Any] else{
    throw MyError.NotURL
}
guard let weather = dictionary["weatherinfo"] as? [String:String] else{
    throw MyError.NotURL
}
print(weather)
let temp1 = weather["temp1"]
print(temp1!)







