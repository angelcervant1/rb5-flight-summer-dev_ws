// Auto-generated. Do not edit!

// (in-package rb5_navigation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class ImageWithCentroids {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.image = null;
      this.centroids = null;
      this.class_labels = null;
      this.confidence_scores = null;
      this.object_ids = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('image')) {
        this.image = initObj.image
      }
      else {
        this.image = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('centroids')) {
        this.centroids = initObj.centroids
      }
      else {
        this.centroids = [];
      }
      if (initObj.hasOwnProperty('class_labels')) {
        this.class_labels = initObj.class_labels
      }
      else {
        this.class_labels = [];
      }
      if (initObj.hasOwnProperty('confidence_scores')) {
        this.confidence_scores = initObj.confidence_scores
      }
      else {
        this.confidence_scores = [];
      }
      if (initObj.hasOwnProperty('object_ids')) {
        this.object_ids = initObj.object_ids
      }
      else {
        this.object_ids = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImageWithCentroids
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.image, buffer, bufferOffset);
    // Serialize message field [centroids]
    // Serialize the length for message field [centroids]
    bufferOffset = _serializer.uint32(obj.centroids.length, buffer, bufferOffset);
    obj.centroids.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [class_labels]
    bufferOffset = _arraySerializer.string(obj.class_labels, buffer, bufferOffset, null);
    // Serialize message field [confidence_scores]
    bufferOffset = _arraySerializer.float32(obj.confidence_scores, buffer, bufferOffset, null);
    // Serialize message field [object_ids]
    bufferOffset = _arraySerializer.int32(obj.object_ids, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImageWithCentroids
    let len;
    let data = new ImageWithCentroids(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [image]
    data.image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [centroids]
    // Deserialize array length for message field [centroids]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.centroids = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.centroids[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [class_labels]
    data.class_labels = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [confidence_scores]
    data.confidence_scores = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [object_ids]
    data.object_ids = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += sensor_msgs.msg.Image.getMessageSize(object.image);
    length += 24 * object.centroids.length;
    object.class_labels.forEach((val) => {
      length += 4 + val.length;
    });
    length += 4 * object.confidence_scores.length;
    length += 4 * object.object_ids.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rb5_navigation/ImageWithCentroids';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1bdd093e7970e7ba29f28db175e0d31f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header                        # Includes a timestamp and frame ID
    
    sensor_msgs/Image image              # The image frame
    
    geometry_msgs/Point[] centroids      # List of centroids
    string[] class_labels                # Class labels (e.g., 'person', 'car')
    float32[] confidence_scores          # Confidence scores for each detected object
    int32[] object_ids                   # Unique object IDs for tracking (optional)
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImageWithCentroids(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.image !== undefined) {
      resolved.image = sensor_msgs.msg.Image.Resolve(msg.image)
    }
    else {
      resolved.image = new sensor_msgs.msg.Image()
    }

    if (msg.centroids !== undefined) {
      resolved.centroids = new Array(msg.centroids.length);
      for (let i = 0; i < resolved.centroids.length; ++i) {
        resolved.centroids[i] = geometry_msgs.msg.Point.Resolve(msg.centroids[i]);
      }
    }
    else {
      resolved.centroids = []
    }

    if (msg.class_labels !== undefined) {
      resolved.class_labels = msg.class_labels;
    }
    else {
      resolved.class_labels = []
    }

    if (msg.confidence_scores !== undefined) {
      resolved.confidence_scores = msg.confidence_scores;
    }
    else {
      resolved.confidence_scores = []
    }

    if (msg.object_ids !== undefined) {
      resolved.object_ids = msg.object_ids;
    }
    else {
      resolved.object_ids = []
    }

    return resolved;
    }
};

module.exports = ImageWithCentroids;
