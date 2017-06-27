//  This file was automatically generated and should not be edited.

import Apollo

public final class TrainerQuery: GraphQLQuery {
  public static let operationString =
    "query Trainer($name: String!) {" +
    "  Trainer(name: $name) {" +
    "    __typename" +
    "    name" +
    "    ownedPokemons {" +
    "      __typename" +
    "      name" +
    "      url" +
    "    }" +
    "    _ownedPokemonsMeta {" +
    "      __typename" +
    "      count" +
    "    }" +
    "  }" +
    "}"

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [Selection] = [
      Field("Trainer", arguments: ["name": Variable("name")], type: .object(Data.Trainer.self)),
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
        Field("ownedPokemons", type: .list(.nonNull(.object(Trainer.OwnedPokemon.self)))),
        Field("_ownedPokemonsMeta", type: .nonNull(.object(Trainer.OwnedPokemonsMetum.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(name: String? = nil, ownedPokemons: [OwnedPokemon]? = nil, ownedPokemonsMeta: OwnedPokemonsMetum) {
        self.init(snapshot: ["__typename": "Trainer", "name": name, "ownedPokemons": ownedPokemons, "ownedPokemonsMeta": ownedPokemonsMeta])
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

      public var ownedPokemons: [OwnedPokemon]? {
        get {
          return (snapshot["ownedPokemons"]! as! [Snapshot]?).flatMap { $0.map { OwnedPokemon(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "ownedPokemons")
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

      public struct OwnedPokemon: GraphQLSelectionSet {
        public static let possibleTypes = ["Pokemon"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("name", type: .scalar(String.self)),
          Field("url", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String? = nil, url: String? = nil) {
          self.init(snapshot: ["__typename": "Pokemon", "name": name, "url": url])
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

        public var url: String? {
          get {
            return snapshot["url"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
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