import Foundation

extension NQScan {
    public var error: ErrorCode? {
        guard let errorCode = errorCode else { return nil }

        return ErrorCode(rawValue: errorCode)
    }

    public enum ErrorCode: Int {
        case Unknown                                      = -1
        case Cancelled                                    = -999
        case BadURL                                       = -1000
        case TimedOut                                     = -1001
        case UnsupportedURL                               = -1002
        case CannotFindHost                               = -1003
        case CannotConnectToHost                          = -1004
        case NetworkConnectionLost                        = -1005
        case DNSLookupFailed                              = -1006
        case HTTPTooManyRedirects                         = -1007
        case ResourceUnavailable                          = -1008
        case NotConnectedToInternet                       = -1009
        case RedirectToNonExistentLocation                = -1010
        case BadServerResponse                            = -1011
        case UserCancelledAuthentication                  = -1012
        case UserAuthenticationRequired                   = -1013
        case ZeroByteResource                             = -1014
        case CannotDecodeRawData                          = -1015
        case CannotDecodeContentData                      = -1016
        case CannotParseResponse                          = -1017
        case AppTransportSecurityRequiresSecureConnection = -1022
        case FileDoesNotExist                             = -1100
        case FileIsDirectory                              = -1101
        case NoPermissionsToReadFile                      = -1102
        case DataLengthExceedsMaximum                     = -1103

        // SSL errors
        case SSLSecureConnectionFailed                       = -1200
        case SSLServerCertificateHasBadDate                  = -1201
        case SSLServerCertificateUntrusted                   = -1202
        case SSLServerCertificateHasUnknownRoot              = -1203
        case SSLServerCertificateNotYetValid                 = -1204
        case SSLClientCertificateRejected                    = -1205
        case SSLClientCertificateRequired                    = -1206
        case SSLCannotLoadFromNetwork                        = -2000

        // Download and file I/O errors
        case IOCannotCreateFile                             = -3000
        case IOCannotOpenFile                               = -3001
        case IOCannotCloseFile                              = -3002
        case IOCannotWriteToFile                            = -3003
        case IOCannotRemoveFile                             = -3004
        case IOCannotMoveFile                               = -3005
        case IODownloadDecodingFailedMidStream              = -3006
        case IODownloadDecodingFailedToComplete             = -3007

        case InternationalRoamingOff                      = -1018
        case CallIsActive                                 = -1019
        case DataNotAllowed                               = -1020
        case RequestBodyStreamExhausted                   = -1021

        case BackgroundSessionRequiresSharedContainer     = -995
        case BackgroundSessionInUseByAnotherProcess       = -996
        case BackgroundSessionWasDisconnected             = -997

        public var toString: String {
            switch self {
                case .Unknown:
                    return "Unknown"
                case .Cancelled:
                    return "Cancelled"
                case .BadURL:
                    return "Bad URL"
                case .TimedOut:
                    return "Timed Out"
                case .UnsupportedURL:
                    return "Unsupported URL"
                case .CannotFindHost:
                    return "Cannot Find Host"
                case .CannotConnectToHost:
                    return "Cannot Connect To Host"
                case .NetworkConnectionLost:
                    return "Network Connection Lost"
                case .DNSLookupFailed:
                    return "DNS Lookup Failed"
                case .HTTPTooManyRedirects:
                    return "HTTP Too Many Redirects"
                case .ResourceUnavailable:
                    return "Resource Unavailable"
                case .NotConnectedToInternet:
                    return "Not Connected To Internet"
                case .RedirectToNonExistentLocation:
                    return "Redirect To Non Existent Location"
                case .BadServerResponse:
                    return "Bad Server Response"
                case .UserCancelledAuthentication:
                    return "User Cancelled Authentication"
                case .UserAuthenticationRequired:
                    return "User Authentication Required"
                case .ZeroByteResource:
                    return "Zero Byte Resource"
                case .CannotDecodeRawData:
                    return "Cannot Decode Raw Data"
                case .CannotDecodeContentData:
                    return "Cannot Decode Content Data"
                case .CannotParseResponse:
                    return "Cannot Parse Response"
                case .AppTransportSecurityRequiresSecureConnection:
                    return "App Transport Security Requires Secure Connection"
                case .FileDoesNotExist:
                    return "File Does Not Exist"
                case .FileIsDirectory:
                    return "File Is Directory"
                case .NoPermissionsToReadFile:
                    return "No Permissions To Read File"
                case .DataLengthExceedsMaximum:
                    return "Data Length Exceeds Maximum"
                case .SSLSecureConnectionFailed:
                    return "SSL Secure Connection Failed"
                case .SSLServerCertificateHasBadDate:
                    return "SSL Server Certificate Has Bad Date"
                case .SSLServerCertificateUntrusted:
                    return "SSL Server Certificate Untrusted"
                case .SSLServerCertificateHasUnknownRoot:
                    return "SSL Server Certificate Has Unknown Root"
                case .SSLServerCertificateNotYetValid:
                    return "SSL Server Certificate Not Yet Valid"
                case .SSLClientCertificateRejected:
                    return "SSL Client Certificate Rejected"
                case .SSLClientCertificateRequired:
                    return "SSL Client Certificate Required"
                case .SSLCannotLoadFromNetwork:
                    return "SSL Cannot Load From Network"
                case .IOCannotCreateFile:
                    return "IO Cannot Create File"
                case .IOCannotOpenFile:
                    return "IO Cannot Open File"
                case .IOCannotCloseFile:
                    return "IO Cannot Close File"
                case .IOCannotWriteToFile:
                    return "IO Cannot Write To File"
                case .IOCannotRemoveFile:
                    return "IO Cannot Remove File"
                case .IOCannotMoveFile:
                    return "IO Cannot Move File"
                case .IODownloadDecodingFailedMidStream:
                    return "IO Download Decoding Failed Mid Stream"
                case .IODownloadDecodingFailedToComplete:
                    return "IO Download Decoding Failed To Complete"
                case .InternationalRoamingOff:
                    return "International Roaming Off"
                case .CallIsActive:
                    return "Call Is Active"
                case .DataNotAllowed:
                    return "Data Not Allowed"
                case .RequestBodyStreamExhausted:
                    return "Request Body Stream Exhausted"
                case .BackgroundSessionRequiresSharedContainer:
                    return "Background Session Requires Shared Container"
                case .BackgroundSessionInUseByAnotherProcess:
                    return "Background Session In Use By Another Process"
                case .BackgroundSessionWasDisconnected:
                    return "Background Session Was Disconnected"

            }
        }
    }
}
