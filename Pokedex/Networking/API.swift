//  This file was automatically generated and should not be edited.

import Apollo

public final class TrainerQuery: GraphQLQuery {
  public static let operationString =
    "query Trainer {" +
    "  Trainer(name: \"Rafael da Silva Ferreira\") {" +
    "    __typename" +
    "    name" +
    "    _ownedPokemonsMeta {" +
    "      __typename" +
    "      count" +
    "    }" +
    "  }" +
    "}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [Selection] = [
      Field("Trainer", arguments: ["name": "Rafael da Silva Ferreira"], type: .object(Data.Trainer.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(trainer: Trainer? = nil) {
      self.init(snapshot: ["__typename": "Query", "trainer": trainer])
    }

    public var trainer: Trainer? {
      get {
        return (snapshot["Trainer"]! as! Snapshot?).flatMap { Trainer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "Trainer")
      }
    }

    public struct Trainer: GraphQLSelectionSet {
      public static let possibleTypes = ["Trainer"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("name", type: .scalar(String.self)),
        Field("_ownedPokemonsMeta", type: .nonNull(.object(Trainer.OwnedPokemonsMetum.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(name: String? = nil, ownedPokemonsMeta: OwnedPokemonsMetum) {
        self.init(snapshot: ["__typename": "Trainer", "name": name, "ownedPokemonsMeta": ownedPokemonsMeta])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"]! as! String?
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// Meta information about the query.
      public var ownedPokemonsMeta: OwnedPokemonsMetum {
        get {
          return OwnedPokemonsMetum(snapshot: snapshot["_ownedPokemonsMeta"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "_ownedPokemonsMeta")
        }
      }

      public struct OwnedPokemonsMetum: GraphQLSelectionSet {
        public static let possibleTypes = ["_QueryMeta"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("count", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(count: Int) {
          self.init(snapshot: ["__typename": "_QueryMeta", "count": count])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return snapshot["count"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "count")
          }
        }
      }
    }
  }
}