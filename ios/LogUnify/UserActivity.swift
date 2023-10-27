// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: UserActivity
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf
import LogUnify
// @@protoc_insertion_point(additional_imports)
// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

enum Event: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case impression // = 1
  case click // = 2

  init() {
    self = .impression
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 1: self = .impression
    case 2: self = .click
    default: return nil
    }
  }

  var rawValue: Int {
    switch self {
    case .impression: return 1
    case .click: return 2
    }
  }

}

#if swift(>=4.2)

extension Event: CaseIterable {
  // Support synthesized by the compiler.
}

#endif  // swift(>=4.2)

enum Surface: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case screen1 // = 1
  case screen2 // = 2
  case topNav // = 3
  case optionsMenu // = 4
  case bottomFab // = 5

  init() {
    self = .screen1
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 1: self = .screen1
    case 2: self = .screen2
    case 3: self = .topNav
    case 4: self = .optionsMenu
    case 5: self = .bottomFab
    default: return nil
    }
  }

  var rawValue: Int {
    switch self {
    case .screen1: return 1
    case .screen2: return 2
    case .topNav: return 3
    case .optionsMenu: return 4
    case .bottomFab: return 5
    }
  }

}

#if swift(>=4.2)

extension Surface: CaseIterable {
  // Support synthesized by the compiler.
}

#endif  // swift(>=4.2)

enum ButtonType: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case next // = 1
  case previous // = 2
  case fab // = 3
  case options // = 4
  case settings // = 5

  init() {
    self = .next
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 1: self = .next
    case 2: self = .previous
    case 3: self = .fab
    case 4: self = .options
    case 5: self = .settings
    default: return nil
    }
  }

  var rawValue: Int {
    switch self {
    case .next: return 1
    case .previous: return 2
    case .fab: return 3
    case .options: return 4
    case .settings: return 5
    }
  }

}

#if swift(>=4.2)

extension ButtonType: CaseIterable {
  // Support synthesized by the compiler.
}

#endif  // swift(>=4.2)

struct UserActivity {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var userID: String {
    get {return _userID ?? String()}
    set {_userID = newValue}
  }
  /// Returns true if `userID` has been explicitly set.
  var hasUserID: Bool {return self._userID != nil}
  /// Clears the value of `userID`. Subsequent reads from it will return its default value.
  mutating func clearUserID() {self._userID = nil}

  var surface: Surface {
    get {return _surface ?? .screen1}
    set {_surface = newValue}
  }
  /// Returns true if `surface` has been explicitly set.
  var hasSurface: Bool {return self._surface != nil}
  /// Clears the value of `surface`. Subsequent reads from it will return its default value.
  mutating func clearSurface() {self._surface = nil}

  var buttonType: ButtonType {
    get {return _buttonType ?? .next}
    set {_buttonType = newValue}
  }
  /// Returns true if `buttonType` has been explicitly set.
  var hasButtonType: Bool {return self._buttonType != nil}
  /// Clears the value of `buttonType`. Subsequent reads from it will return its default value.
  mutating func clearButtonType() {self._buttonType = nil}

  var event: Event {
    get {return _event ?? .impression}
    set {_event = newValue}
  }
  /// Returns true if `event` has been explicitly set.
  var hasEvent: Bool {return self._event != nil}
  /// Clears the value of `event`. Subsequent reads from it will return its default value.
  mutating func clearEvent() {self._event = nil}

  var sessionID: String {
    get {return _sessionID ?? String()}
    set {_sessionID = newValue}
  }
  /// Returns true if `sessionID` has been explicitly set.
  var hasSessionID: Bool {return self._sessionID != nil}
  /// Clears the value of `sessionID`. Subsequent reads from it will return its default value.
  mutating func clearSessionID() {self._sessionID = nil}

  var stringArray: [String] = []

  var intArray: [Int32] = []

  var stringIntMap: Dictionary<String,Int32> = [:]

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _userID: String? = nil
  fileprivate var _surface: Surface? = nil
  fileprivate var _buttonType: ButtonType? = nil
  fileprivate var _event: Event? = nil
  fileprivate var _sessionID: String? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Event: @unchecked Sendable {}
extension Surface: @unchecked Sendable {}
extension ButtonType: @unchecked Sendable {}
extension UserActivity: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Extension support defined in UserActivity.

// MARK: - Extension Properties

// Swift Extensions on the exteneded Messages to add easy access to the declared
// extension fields. The names are based on the extension field name from the proto
// declaration. To avoid naming collisions, the names are prefixed with the name of
// the scope where the extend directive occurs.

extension SwiftProtobuf.Google_Protobuf_MessageOptions {

  var UserActivity_schemaName: String {
    get {return getExtensionValue(ext: UserActivity.Extensions.schema_name) ?? String()}
    set {setExtensionValue(ext: UserActivity.Extensions.schema_name, value: newValue)}
  }
  /// Returns true if extension `UserActivity.Extensions.schema_name`
  /// has been explicitly set.
  var hasUserActivity_schemaName: Bool {
    return hasExtensionValue(ext: UserActivity.Extensions.schema_name)
  }
  /// Clears the value of extension `UserActivity.Extensions.schema_name`.
  /// Subsequent reads from it will return its default value.
  mutating func clearUserActivity_schemaName() {
    clearExtensionValue(ext: UserActivity.Extensions.schema_name)
  }

  var UserActivity_projectName: String {
    get {return getExtensionValue(ext: UserActivity.Extensions.project_name) ?? String()}
    set {setExtensionValue(ext: UserActivity.Extensions.project_name, value: newValue)}
  }
  /// Returns true if extension `UserActivity.Extensions.project_name`
  /// has been explicitly set.
  var hasUserActivity_projectName: Bool {
    return hasExtensionValue(ext: UserActivity.Extensions.project_name)
  }
  /// Clears the value of extension `UserActivity.Extensions.project_name`.
  /// Subsequent reads from it will return its default value.
  mutating func clearUserActivity_projectName() {
    clearExtensionValue(ext: UserActivity.Extensions.project_name)
  }

  var UserActivity_enabledCanonicalFields: String {
    get {return getExtensionValue(ext: UserActivity.Extensions.enabled_canonical_fields) ?? String()}
    set {setExtensionValue(ext: UserActivity.Extensions.enabled_canonical_fields, value: newValue)}
  }
  /// Returns true if extension `UserActivity.Extensions.enabled_canonical_fields`
  /// has been explicitly set.
  var hasUserActivity_enabledCanonicalFields: Bool {
    return hasExtensionValue(ext: UserActivity.Extensions.enabled_canonical_fields)
  }
  /// Clears the value of extension `UserActivity.Extensions.enabled_canonical_fields`.
  /// Subsequent reads from it will return its default value.
  mutating func clearUserActivity_enabledCanonicalFields() {
    clearExtensionValue(ext: UserActivity.Extensions.enabled_canonical_fields)
  }

}

// MARK: - File's ExtensionMap: UserActivity_Extensions

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
let UserActivity_Extensions: SwiftProtobuf.SimpleExtensionMap = [
  UserActivity.Extensions.schema_name,
  UserActivity.Extensions.project_name,
  UserActivity.Extensions.enabled_canonical_fields
]

// Extension Objects - The only reason these might be needed is when manually
// constructing a `SimpleExtensionMap`, otherwise, use the above _Extension Properties_
// accessors for the extension fields on the messages directly.

extension UserActivity {
  enum Extensions {
    static let schema_name = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, SwiftProtobuf.Google_Protobuf_MessageOptions>(
      _protobuf_fieldNumber: 1001,
      fieldName: "UserActivity.schema_name"
    )

    static let project_name = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, SwiftProtobuf.Google_Protobuf_MessageOptions>(
      _protobuf_fieldNumber: 1002,
      fieldName: "UserActivity.project_name"
    )

    static let enabled_canonical_fields = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, SwiftProtobuf.Google_Protobuf_MessageOptions>(
      _protobuf_fieldNumber: 1003,
      fieldName: "UserActivity.enabled_canonical_fields"
    )
  }
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Event: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "IMPRESSION"),
    2: .same(proto: "CLICK"),
  ]
}

extension Surface: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "SCREEN_1"),
    2: .same(proto: "SCREEN_2"),
    3: .same(proto: "TOP_NAV"),
    4: .same(proto: "OPTIONS_MENU"),
    5: .same(proto: "BOTTOM_FAB"),
  ]
}

extension ButtonType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "NEXT"),
    2: .same(proto: "PREVIOUS"),
    3: .same(proto: "FAB"),
    4: .same(proto: "OPTIONS"),
    5: .same(proto: "SETTINGS"),
  ]
}

extension UserActivity: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "UserActivity"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "user_id"),
    2: .same(proto: "surface"),
    3: .standard(proto: "button_type"),
    4: .same(proto: "event"),
    5: .standard(proto: "session_id"),
    6: .standard(proto: "string_array"),
    7: .standard(proto: "int_array"),
    8: .standard(proto: "string_int_map"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self._userID) }()
      case 2: try { try decoder.decodeSingularEnumField(value: &self._surface) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self._buttonType) }()
      case 4: try { try decoder.decodeSingularEnumField(value: &self._event) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self._sessionID) }()
      case 6: try { try decoder.decodeRepeatedStringField(value: &self.stringArray) }()
      case 7: try { try decoder.decodeRepeatedInt32Field(value: &self.intArray) }()
      case 8: try { try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufInt32>.self, value: &self.stringIntMap) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._userID {
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._surface {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._buttonType {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._event {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 4)
    } }()
    try { if let v = self._sessionID {
      try visitor.visitSingularStringField(value: v, fieldNumber: 5)
    } }()
    if !self.stringArray.isEmpty {
      try visitor.visitRepeatedStringField(value: self.stringArray, fieldNumber: 6)
    }
    if !self.intArray.isEmpty {
      try visitor.visitRepeatedInt32Field(value: self.intArray, fieldNumber: 7)
    }
    if !self.stringIntMap.isEmpty {
      try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufInt32>.self, value: self.stringIntMap, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: UserActivity, rhs: UserActivity) -> Bool {
    if lhs._userID != rhs._userID {return false}
    if lhs._surface != rhs._surface {return false}
    if lhs._buttonType != rhs._buttonType {return false}
    if lhs._event != rhs._event {return false}
    if lhs._sessionID != rhs._sessionID {return false}
    if lhs.stringArray != rhs.stringArray {return false}
    if lhs.intArray != rhs.intArray {return false}
    if lhs.stringIntMap != rhs.stringIntMap {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
extension UserActivity: LogUnify.Event {
  func getSchemaName() -> String {
    return "UserActivity"
  }

  func getProjectName() -> String {
     return "TestProject"
  }

  func serialize() throws -> Data {
    return try self.serializedData()
  }

  func log() {
    do {
      try UnifyLogger.getInstance().logEvent(self)
    } catch let err {
      NSLog("Failed to log to backend due to error: \(err)")
    }
  }
}
// @@protoc_insertion_point(global_scope)
