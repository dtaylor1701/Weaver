import Foundation

struct Grid<T> {
    let iMax: Int
    let jMax: Int
    let values: [[T]]
    let points: [Point]
    
    subscript(point: Point) -> T {
        return value(at: point)
    }
        
    init(_ values: [[T]]) {
        iMax = values.count - 1
        jMax = (values.first?.count ?? 0) - 1
        self.values = values
        
        var result: [Point] = []
        for i in 0...iMax {
            for j in 0...jMax {
                result.append(Point(i: i, j: j))
            }
        }
        self.points = result
    }
    
    func adjacent(to point: Point) -> [Point] {
        var result: [Point] = []
        
        let i = point.i
        let j = point.j
        
        if i > 0 {
            result.append(Point(i: i - 1, j: j))
        }
        
        if i < iMax {
            result.append(Point(i: i + 1, j: j))
        }
        
        if j > 0 {
            result.append(Point(i: i, j: j - 1))
        }
        
        if j < jMax {
            result.append(Point(i: i, j: j + 1))
        }
            
        return result
    }
    
    func value(at point: Point) -> T {
        return values[point.i][point.j]
    }
}

struct Point: Hashable {
    let i: Int
    let j: Int
}
