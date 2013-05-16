package hugs;

import unityengine.GameObject;
import unityengine.Component;
import unityengine.Quaternion;
import unityengine.Vector3;

import dotnet.system.collections.IEnumerable;
import dotnet.system.collections.IEnumerator;

class HUGSWrapper {

  public static function getTypedComponent<T>(c:Component, type:Class<T>):T {
    return cast c.GetComponent(Type.getClassName(type));
  }

  public static function addTypedComponent<T>(g:GameObject, type:Class<T>):T {
    return cast g.AddComponent(Type.getClassName(type));
  }
  
  public static function adaptEnumerable(enumerable:IEnumerable) : EnumeratorAdapter<Dynamic> {
    return new EnumeratorAdapter<Dynamic>(enumerable.GetEnumerator());
  }

  public static function adaptEnumerableT<T>(enumerable:IEnumerable, type:Class<T>) : EnumeratorAdapter<T> {
    return new EnumeratorAdapter<T>(enumerable.GetEnumerator());
  }
}

class QuaternionMethods
{
  public static inline function mul(a:Quaternion, b:Quaternion) : Quaternion {
    return untyped __cs__("a*b");
  }

  public static inline function rotatePoint(a:Quaternion, b:Vector3) : Vector3 {
    return untyped __cs__("a*b");
  }
}

class Vector3Methods
{
  public static inline function add(a:Vector3, b:Vector3) : Vector3 {
    return untyped __cs__("a+b");
  }

  public static inline function sub(a:Vector3, b:Vector3) : Vector3 {
    return untyped __cs__("a-b");
  }

  public static inline function mul(a:Vector3, b:Float) : Vector3 {
    return untyped __cs__("a*b");
  }

  public static inline function div(a:Vector3, b:Float) : Vector3 {
    return untyped __cs__("a/b");
  }
}

class EnumeratorAdapter<T>
{
  public var enumerator(default, null):IEnumerator;
  public function new(enumerator:IEnumerator) {
    this.enumerator = enumerator;
  }

  public function next() : T {
    // Current is not exported, because currently vars are not exported from interfaces
    return untyped __cs__("(T)this.enumerator.Current");
  }

  public function hasNext() : Bool {
    return this.enumerator.MoveNext();
  }
}
