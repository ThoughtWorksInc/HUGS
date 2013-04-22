package unityengine;

@:native("UnityEngine.OffMeshLink") @:final
extern class OffMeshLink extends Component {
  public var activated : Bool;
  public var occupied(default,never) : Bool;
  public var costOverride : Single;

  public function new() : Void;
}

