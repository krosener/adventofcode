import Foundation

public class ResourceReader {
    public static let shared = ResourceReader()
    
    public func readInputForProblem(_ problem:String) -> String {
        guard let input_file = Bundle.main.path(forResource: "\(problem)_input", ofType: "txt", inDirectory: problem) else {return ""}
        guard let input_data = FileManager.default.contents(atPath: input_file) else {return ""}
        guard let input = String(data: input_data, encoding: .ascii) else {return ""}
        return input
    }
}
