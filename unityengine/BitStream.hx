package unityengine;

@:native("UnityEngine.BitStream") @:final
extern class BitStream extends dotnet.system.Object {
  public var isReading(default,never) : Bool;
  public var isWriting(default,never) : Bool;

  public function new() : Void;

  @:overload(function(value:Bool) : Void {})
  @:overload(function(value:dotnet.system.Char) : Void {})
  @:overload(function(value:Int) : Void {})
  @:overload(function(value:Single) : Void {})
  @:overload(function(value:Single, maxDelta:Single) : Void {})
  @:overload(function(value:Quaternion) : Void {})
  @:overload(function(value:Quaternion, maxDelta:Single) : Void {})
  @:overload(function(value:Vector3) : Void {})
  @:overload(function(value:Vector3, maxDelta:Single) : Void {})
  @:overload(function(value:NetworkPlayer) : Void {})
  public function Serialize(viewID:NetworkViewID) : Void;
}

