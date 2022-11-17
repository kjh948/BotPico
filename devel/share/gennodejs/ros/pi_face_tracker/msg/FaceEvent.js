// Auto-generated. Do not edit!

// (in-package pi_face_tracker.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class FaceEvent {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.face_event = null;
      this.face_id = null;
    }
    else {
      if (initObj.hasOwnProperty('face_event')) {
        this.face_event = initObj.face_event
      }
      else {
        this.face_event = '';
      }
      if (initObj.hasOwnProperty('face_id')) {
        this.face_id = initObj.face_id
      }
      else {
        this.face_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FaceEvent
    // Serialize message field [face_event]
    bufferOffset = _serializer.string(obj.face_event, buffer, bufferOffset);
    // Serialize message field [face_id]
    bufferOffset = _serializer.int32(obj.face_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FaceEvent
    let len;
    let data = new FaceEvent(null);
    // Deserialize message field [face_event]
    data.face_event = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [face_id]
    data.face_id = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.face_event);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pi_face_tracker/FaceEvent';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5adeac26feae2331d8e18267bc285e92';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string face_event
    int32 face_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FaceEvent(null);
    if (msg.face_event !== undefined) {
      resolved.face_event = msg.face_event;
    }
    else {
      resolved.face_event = ''
    }

    if (msg.face_id !== undefined) {
      resolved.face_id = msg.face_id;
    }
    else {
      resolved.face_id = 0
    }

    return resolved;
    }
};

module.exports = FaceEvent;
