



import Foundation

extension Collection where Element: Hashable {
    var isAllSameOrAllDifference : Bool {
        guard !self.isEmpty else { return true }
        return Set(self).count == 0 || ( Set(self).count == self.count )
    }
}
