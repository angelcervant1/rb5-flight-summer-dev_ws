;; Auto-generated. Do not edit!


(when (boundp 'rb5_navigation::ImageWithCentroids)
  (if (not (find-package "RB5_NAVIGATION"))
    (make-package "RB5_NAVIGATION"))
  (shadow 'ImageWithCentroids (find-package "RB5_NAVIGATION")))
(unless (find-package "RB5_NAVIGATION::IMAGEWITHCENTROIDS")
  (make-package "RB5_NAVIGATION::IMAGEWITHCENTROIDS"))

(in-package "ROS")
;;//! \htmlinclude ImageWithCentroids.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass rb5_navigation::ImageWithCentroids
  :super ros::object
  :slots (_header _image _centroids _class_labels _confidence_scores _object_ids ))

(defmethod rb5_navigation::ImageWithCentroids
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:image __image) (instance sensor_msgs::Image :init))
    ((:centroids __centroids) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:class_labels __class_labels) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:confidence_scores __confidence_scores) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:object_ids __object_ids) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _image __image)
   (setq _centroids __centroids)
   (setq _class_labels __class_labels)
   (setq _confidence_scores __confidence_scores)
   (setq _object_ids __object_ids)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:centroids
   (&rest __centroids)
   (if (keywordp (car __centroids))
       (send* _centroids __centroids)
     (progn
       (if __centroids (setq _centroids (car __centroids)))
       _centroids)))
  (:class_labels
   (&optional __class_labels)
   (if __class_labels (setq _class_labels __class_labels)) _class_labels)
  (:confidence_scores
   (&optional __confidence_scores)
   (if __confidence_scores (setq _confidence_scores __confidence_scores)) _confidence_scores)
  (:object_ids
   (&optional __object_ids)
   (if __object_ids (setq _object_ids __object_ids)) _object_ids)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; sensor_msgs/Image _image
    (send _image :serialization-length)
    ;; geometry_msgs/Point[] _centroids
    (apply #'+ (send-all _centroids :serialization-length)) 4
    ;; string[] _class_labels
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _class_labels)) 4
    ;; float32[] _confidence_scores
    (* 4    (length _confidence_scores)) 4
    ;; int32[] _object_ids
    (* 4    (length _object_ids)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; sensor_msgs/Image _image
       (send _image :serialize s)
     ;; geometry_msgs/Point[] _centroids
     (write-long (length _centroids) s)
     (dolist (elem _centroids)
       (send elem :serialize s)
       )
     ;; string[] _class_labels
     (write-long (length _class_labels) s)
     (dolist (elem _class_labels)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float32[] _confidence_scores
     (write-long (length _confidence_scores) s)
     (dotimes (i (length _confidence_scores))
       (sys::poke (elt _confidence_scores i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32[] _object_ids
     (write-long (length _object_ids) s)
     (dotimes (i (length _object_ids))
       (write-long (elt _object_ids i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; sensor_msgs/Image _image
     (send _image :deserialize buf ptr-) (incf ptr- (send _image :serialization-length))
   ;; geometry_msgs/Point[] _centroids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _centroids (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _centroids)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string[] _class_labels
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _class_labels (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _class_labels i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float32[] _confidence_scores
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _confidence_scores (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _confidence_scores i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32[] _object_ids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object_ids (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _object_ids i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get rb5_navigation::ImageWithCentroids :md5sum-) "1bdd093e7970e7ba29f28db175e0d31f")
(setf (get rb5_navigation::ImageWithCentroids :datatype-) "rb5_navigation/ImageWithCentroids")
(setf (get rb5_navigation::ImageWithCentroids :definition-)
      "Header header                        # Includes a timestamp and frame ID

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

")



(provide :rb5_navigation/ImageWithCentroids "1bdd093e7970e7ba29f28db175e0d31f")


