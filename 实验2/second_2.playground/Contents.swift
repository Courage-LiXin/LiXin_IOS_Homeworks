import UIKit

var str = "Hello, playground"

//update by first_1


//定义SchoolDepart枚举类型
enum SchoolDepart:String{
    case Teacher,Student,Headmaster,Class,ClassTeacher,GradeDirector
}

//update：协议SchoolProtocol，协议包括一个department属性(Enum，自己实现enum的定义)和lendBook方法
protocol SchoolProtocol{
    var department:SchoolDepart{ get }
    
    //??**    不能有函数体
    func lendBook()
}

//定义枚举类型Gender
enum Gender:Int{
    case male,female
    static func > (lhs: Gender, rhs: Gender) -> Bool {
        //使用rawValue属性来访问每一个枚举变量的原始值
        return lhs.rawValue < rhs.rawValue
    }
}

//Person类
//update：增加run方法(方法里面直接print输出Person XXX is running;
class Person {
    
    //存储属性
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    
    //计算属性
    var fullName:String{get{ return firstName + " " + lastName }}
    
    init(firstName:String, lastName:String, age:Int, gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
        
    }
    
    //便利初始化
    convenience init (firstName:String){
        self.init(firstName:firstName, lastName:"", age:0, gender:Gender.female)
    }
    
    //比较函数
    static func == (pA:Person,pB:Person) ->Bool {
        if pA.fullName == pB.fullName &&
            pA.age == pB.age &&
            pA.gender == pB.gender{
            return true
        }
        else {
            return false
        }
    }
    static func != (pA:Person,pB:Person) ->Bool {
        if pA.fullName != pB.fullName ||
            pA.age != pB.age ||
            pA.gender != pB.gender{
            return true
        }
        else {
            return false
        }
    }
    //用于输出信息的属性
    var infor: String {
        return "fullName: \(fullName), age: \(age), gender: \(gender)"
    }
    
    //run方法
    func run(){
        print("Person \(self.fullName) is running")
    }
    
}

//类Teacher，继承于Person类
//update：重载run方法，并且重写
//update：继承协议,通过类继承协议，重写变量，重写方法***
class Teacher:Person,SchoolProtocol{
    //新增存储属性
    var title:String
    //协议继承后，重写变量
    var department:SchoolDepart
    //给定构造
    init(firstName:String, lastName:String, age:Int, gender:Gender,title:String){
        self.title = title
        //协议继承后，重写构造函数
        self.department = SchoolDepart.Teacher
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    //便利构造
    convenience init (firstName:String,title:String){
        self.init(firstName:firstName, lastName:"", age:0, gender:Gender.male, title:title)
    }
    //属性重写
    override var infor:String {
        return super.infor + " title:\(title)"
    }
    //方法重写
    override func run(){
        print("Teacher \(fullName) is running")
    }
    //继承协议
    func lendBook(){
        print("Teacher \(fullName) lended a book")
    }
}

//类Student，继承于Person类
//update：重载run方法，并且重写
//update：继承协议，通过类继承协议，重写变量，重写方法***
class Student:Person,SchoolProtocol{
    //新增存储属性
    var stuNo:String
    //协议继承后，重写变量
    var department:SchoolDepart
    init(firstName:String, lastName:String, age:Int, gender:Gender,stuNo:String){
        self.stuNo = stuNo
        //协议继承后，重写构造函数
        self.department = SchoolDepart.Student
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    //便利构造
    convenience init (firstName:String, stuNo:String){
        self.init(firstName:firstName, lastName:"", age:0, gender:Gender.female, stuNo:stuNo)
    }
    //属性重写
    override var infor:String {
        return super.infor + " stuNo:\(stuNo)"
    }
    //方法重写
    override func run(){
        print("Student \(fullName) is  running")
    }
    //继承协议
    func lendBook(){
        print("Student \(fullName) lended a book")
    }
}

//构造多个实例对象
var p1 = Person(firstName:"xu", lastName:"jiayang", age:21, gender:Gender.male)
var p2 = Person(firstName:"chen", lastName:"xiangyu", age:19, gender: Gender.female)
var t1 = Teacher(firstName:"li", lastName:"guiyang", age:36, gender:Gender.male, title:"IOS")
var t2 = Teacher(firstName:"xia", lastName:"yu", age:39, gender:Gender.male, title:"JAVA")
var s1 = Student(firstName:"li", lastName:"xin", age:21, gender:Gender.female,stuNo:"2016110317")
var s2 = Student(firstName:"liu", lastName:"xuan", age:20, gender:Gender.female,stuNo:"2016110322")

//所构造实例对象信息
print(p1.infor)
print(p2.infor)
print(t1.infor)
print(t2.infor)
print(s1.infor)
print(s2.infor)

if p1 == p2 {
    print("Same person!")
}

if p1 != p2 {
    print("Differ person!")
}

//将各对象存入同一数组中
var persons = [p1,p2,s1,s2,t1,t2]
//字典
var dictionary = ["personSum": 0, "teacherSum": 0, "studentSum": 0]
for p in persons {
    if p is Teacher {
        dictionary["teacherSum"]! += 1
    }
    else if p is Student {
        dictionary["studentSum"]! += 1
    }
    else {
        dictionary["personSum"]! += 1
    }
}

//输出字典内容
for (key, value) in dictionary {
    print("\(key) has \(value)")
}

//排序
print("排序--------------------------------------------")

print("原始数组：")
for p in persons {
    print(p.infor)
}

print("按年龄排序")
persons.sort {  $0.age < $1.age}
for p in persons {
    print(p.infor)
}

print("按fullName排序")
persons.sort {  $0.fullName < $1.fullName }
for p in persons {
    print(p.infor)
}


print("按gender+age排序")
persons.sort { return ($0.gender > $1.gender) && ($0.age > $1.age)  }
for p in persons {
    print(p.infor)
}

//对数组进行穷举，调用每个对象的run方法
//同时调用满足协议SchoolProtocol对象的lendBook方法
//??    if let t = p as? Teacher
//**    as?

print("run and lendBook--------------------------------------")

for p in persons{
    if let t = p as? Teacher{
        t.run()
        t.lendBook()
    }
    else if let s = p as? Student{
        s.run()
        s.lendBook()
    }
    else {
        p.run()
    }
}








