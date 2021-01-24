



import Foundation

extension Collection where Element: Hashable {
    
    ///ERROR: Something was wrong
    var isAllSameOrAllDifference : Bool {
        guard !self.isEmpty else { return true }
        return Set(self).count == 1 || ( Set(self).count == self.count )
    }
    
}
