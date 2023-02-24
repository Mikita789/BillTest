import UIKit

var greeting = "Hello, playground"
var arr = ["10%", "20%", "30%", "25%"]
let res = arr.map{$0.split(separator: "").filter{Int($0) != nil}}.map{$0.map{String($0)}}
print(res.map{Int($0.joined(separator: "")) ?? 1})




