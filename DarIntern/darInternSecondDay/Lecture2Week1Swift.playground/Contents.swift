import UIKit

let nums = [1, 6, 3, 9, 4, 6];
var numMax = nums.reduce(Int.min, { max($0, $1) })
var numMin = nums.reduce(Int.max, { min($0, $1) })
print(numMax)
