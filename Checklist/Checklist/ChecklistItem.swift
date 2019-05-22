import Foundation

class ChecklistItem: NSObject {
  
  @objc var text = ""
  var checked = false
  
  func toggleChecked() {
    checked = !checked
  }
  
}


