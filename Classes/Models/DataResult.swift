
import Foundation

public enum DataResult<T> {
    case success(Any)
    case failure(Error)
}
