# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from pi_face_tracker/Faces.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import pi_face_tracker.msg

class Faces(genpy.Message):
  _md5sum = "795fcad51e08073ca70078799c464613"
  _type = "pi_face_tracker/Faces"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# Multiple faces
Face[] faces
================================================================================
MSG: pi_face_tracker/Face
# Face in 3D space
int32 id
geometry_msgs/Point point
float32 attention


================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
"""
  __slots__ = ['faces']
  _slot_types = ['pi_face_tracker/Face[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       faces

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Faces, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.faces is None:
        self.faces = []
    else:
      self.faces = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.faces)
      buff.write(_struct_I.pack(length))
      for val1 in self.faces:
        _x = val1.id
        buff.write(_get_struct_i().pack(_x))
        _v1 = val1.point
        _x = _v1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
        _x = val1.attention
        buff.write(_get_struct_f().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.faces is None:
        self.faces = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.faces = []
      for i in range(0, length):
        val1 = pi_face_tracker.msg.Face()
        start = end
        end += 4
        (val1.id,) = _get_struct_i().unpack(str[start:end])
        _v2 = val1.point
        _x = _v2
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        start = end
        end += 4
        (val1.attention,) = _get_struct_f().unpack(str[start:end])
        self.faces.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.faces)
      buff.write(_struct_I.pack(length))
      for val1 in self.faces:
        _x = val1.id
        buff.write(_get_struct_i().pack(_x))
        _v3 = val1.point
        _x = _v3
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
        _x = val1.attention
        buff.write(_get_struct_f().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.faces is None:
        self.faces = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.faces = []
      for i in range(0, length):
        val1 = pi_face_tracker.msg.Face()
        start = end
        end += 4
        (val1.id,) = _get_struct_i().unpack(str[start:end])
        _v4 = val1.point
        _x = _v4
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        start = end
        end += 4
        (val1.attention,) = _get_struct_f().unpack(str[start:end])
        self.faces.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3d = None
def _get_struct_3d():
    global _struct_3d
    if _struct_3d is None:
        _struct_3d = struct.Struct("<3d")
    return _struct_3d
_struct_f = None
def _get_struct_f():
    global _struct_f
    if _struct_f is None:
        _struct_f = struct.Struct("<f")
    return _struct_f
_struct_i = None
def _get_struct_i():
    global _struct_i
    if _struct_i is None:
        _struct_i = struct.Struct("<i")
    return _struct_i
