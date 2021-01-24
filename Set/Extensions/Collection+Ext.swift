



import Foundation

extension Collection where Element: Hashable {

    var isAllSameOrAllDifference : Bool {
        guard !self.isEmpty else { return true }
        return Set(self).count == 1 || ( Set(self).count == self.count ) /**Is all about only 1 or different after the reduction */
    }
    
}
