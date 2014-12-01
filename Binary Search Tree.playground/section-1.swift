// Playground - noun: a place where people can play

import UIKit

class BinarySearchTree {
  var value : Int? = nil
  var left: BinarySearchTree? = nil
  var right : BinarySearchTree? = nil
  
  convenience init(value:Int?){
    self.init()
    self.value = value
  }
  
  func insert(newValue: Int) {
    if self.value == nil {
      self.value = newValue
    } else if newValue < self.value {
      if left == nil {
        left = BinarySearchTree(value: newValue)
      } else {
        left?.insert(newValue)
      }
    } else if newValue > self.value {
      if right == nil {
        right = BinarySearchTree(value: newValue)
      } else {
        right?.insert(newValue)
      }
    } else {
      println("Duplicate value found")
    }
  }
  
  func find(value: Int) -> Bool{
    println("Find entering node with value \(self.value!)")
    if self.value! == value {
      return true
    } else if value < self.value! {
      if left == nil {
        return false
      } else {
        return left!.find(value)
      }
    } else if value > self.value! {
      if right == nil {
        return false
      } else {
        return right!.find(value)
      }
    }
    return false
  }
  
  func traverse() -> String {
    var returnString = ""
    if let leftSide = left {
      returnString += leftSide.traverse()
    }
    if let myValue = self.value {
      returnString += " \(myValue)"
    }
    if let rightSide = right {
      returnString += rightSide.traverse()
    }
    return returnString
  }
  
  func remove(value: Int) -> Bool {
    println("Remove called on \(self.value!)")
    if self.value! == value { //will remove
      if self.right != nil {
        var parentTree = self
        var currentTree = self.right
        while currentTree!.left != nil {
          parentTree = currentTree!
          currentTree = currentTree!.left
        }
        parentTree.left = currentTree!.right
        self.value = currentTree!.value
        return true
      } else if let leftTree = self.left {
        self.value = leftTree.value
        self.right = leftTree.right
        self.left  = leftTree.left
        return true
      }
      else {
        self.value = nil
      }
    } else if value > self.value {
      if self.right == nil {
        return false
      } else {
        self.right!.remove(value);
      }
    } else {
      if self.left == nil {
        return false
      } else {
        return self.left!.remove(value);
      }
    }
    return false
  }
}

var bst = BinarySearchTree()
let numbersArray : [Int] = [5,8,2,6,10,13,67,3,1,72,4,14]
for number in numbersArray {
  bst.insert(number)
}
bst.find(72)
bst.traverse()
bst.remove(13)
bst.traverse()



