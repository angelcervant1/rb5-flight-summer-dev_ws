; Auto-generated. Do not edit!


(cl:in-package rb5_navigation-msg)


;//! \htmlinclude ImageWithCentroids.msg.html

(cl:defclass <ImageWithCentroids> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (centroids
    :reader centroids
    :initarg :centroids
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (class_labels
    :reader class_labels
    :initarg :class_labels
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (confidence_scores
    :reader confidence_scores
    :initarg :confidence_scores
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (object_ids
    :reader object_ids
    :initarg :object_ids
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass ImageWithCentroids (<ImageWithCentroids>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImageWithCentroids>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImageWithCentroids)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rb5_navigation-msg:<ImageWithCentroids> is deprecated: use rb5_navigation-msg:ImageWithCentroids instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ImageWithCentroids>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rb5_navigation-msg:header-val is deprecated.  Use rb5_navigation-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <ImageWithCentroids>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rb5_navigation-msg:image-val is deprecated.  Use rb5_navigation-msg:image instead.")
  (image m))

(cl:ensure-generic-function 'centroids-val :lambda-list '(m))
(cl:defmethod centroids-val ((m <ImageWithCentroids>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rb5_navigation-msg:centroids-val is deprecated.  Use rb5_navigation-msg:centroids instead.")
  (centroids m))

(cl:ensure-generic-function 'class_labels-val :lambda-list '(m))
(cl:defmethod class_labels-val ((m <ImageWithCentroids>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rb5_navigation-msg:class_labels-val is deprecated.  Use rb5_navigation-msg:class_labels instead.")
  (class_labels m))

(cl:ensure-generic-function 'confidence_scores-val :lambda-list '(m))
(cl:defmethod confidence_scores-val ((m <ImageWithCentroids>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rb5_navigation-msg:confidence_scores-val is deprecated.  Use rb5_navigation-msg:confidence_scores instead.")
  (confidence_scores m))

(cl:ensure-generic-function 'object_ids-val :lambda-list '(m))
(cl:defmethod object_ids-val ((m <ImageWithCentroids>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rb5_navigation-msg:object_ids-val is deprecated.  Use rb5_navigation-msg:object_ids instead.")
  (object_ids m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImageWithCentroids>) ostream)
  "Serializes a message object of type '<ImageWithCentroids>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'centroids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'centroids))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'class_labels))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'class_labels))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'confidence_scores))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'confidence_scores))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'object_ids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'object_ids))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImageWithCentroids>) istream)
  "Deserializes a message object of type '<ImageWithCentroids>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'centroids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'centroids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'class_labels) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'class_labels)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'confidence_scores) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'confidence_scores)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'object_ids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'object_ids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImageWithCentroids>)))
  "Returns string type for a message object of type '<ImageWithCentroids>"
  "rb5_navigation/ImageWithCentroids")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImageWithCentroids)))
  "Returns string type for a message object of type 'ImageWithCentroids"
  "rb5_navigation/ImageWithCentroids")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImageWithCentroids>)))
  "Returns md5sum for a message object of type '<ImageWithCentroids>"
  "1bdd093e7970e7ba29f28db175e0d31f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImageWithCentroids)))
  "Returns md5sum for a message object of type 'ImageWithCentroids"
  "1bdd093e7970e7ba29f28db175e0d31f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImageWithCentroids>)))
  "Returns full string definition for message of type '<ImageWithCentroids>"
  (cl:format cl:nil "Header header                        # Includes a timestamp and frame ID~%~%sensor_msgs/Image image              # The image frame~%~%geometry_msgs/Point[] centroids      # List of centroids~%string[] class_labels                # Class labels (e.g., 'person', 'car')~%float32[] confidence_scores          # Confidence scores for each detected object~%int32[] object_ids                   # Unique object IDs for tracking (optional)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImageWithCentroids)))
  "Returns full string definition for message of type 'ImageWithCentroids"
  (cl:format cl:nil "Header header                        # Includes a timestamp and frame ID~%~%sensor_msgs/Image image              # The image frame~%~%geometry_msgs/Point[] centroids      # List of centroids~%string[] class_labels                # Class labels (e.g., 'person', 'car')~%float32[] confidence_scores          # Confidence scores for each detected object~%int32[] object_ids                   # Unique object IDs for tracking (optional)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImageWithCentroids>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'centroids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'class_labels) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'confidence_scores) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'object_ids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImageWithCentroids>))
  "Converts a ROS message object to a list"
  (cl:list 'ImageWithCentroids
    (cl:cons ':header (header msg))
    (cl:cons ':image (image msg))
    (cl:cons ':centroids (centroids msg))
    (cl:cons ':class_labels (class_labels msg))
    (cl:cons ':confidence_scores (confidence_scores msg))
    (cl:cons ':object_ids (object_ids msg))
))
