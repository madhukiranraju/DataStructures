import UIKit

enum EdgeType {
    case directed
    case undirected
}


struct Vertex<T> {
    
    let data :T
    let index :Int
    
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}

extension Vertex: CustomStringConvertible {
    
    var description: String {
        return "\(index): \(data)"
    }
}

//Dallas -- Houston

struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double?
}

protocol Graph {
    
    associatedtype Element
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source:Vertex<Element>, to destination: Vertex<Element>) -> Double?
}

extension Graph {
    
    // addUndirectedGraph
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {
        
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
        
    }
    
    // add 
    
}

class AdjacencyList<T: Hashable> :Graph {
    
    private var adjancencies: [Vertex<T>:[Edge<T>]] = [:]
    
    init() { }
    
    func createVertex(data: T) -> Vertex<T> {
        
        let vertex = Vertex(data: data, index: adjancencies.count)
        adjancencies[vertex] = []
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjancencies[source]?.append(edge)
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjancencies[source] ?? []
    }
    
    func weight(from source:Vertex<T>, to destination: Vertex<T>) -> Double? {
        return edges(from: source).first { $0.destination == destination }?.weight
    }
    
}
