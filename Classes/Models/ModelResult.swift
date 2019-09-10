
import Foundation

public enum ModelResult<T,E> {
    case success(T)
    case catchError(E)
    case failure(Error)
}

