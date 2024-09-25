
(cl:in-package :asdf)

(defsystem "rb5_navigation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ImageWithCentroids" :depends-on ("_package_ImageWithCentroids"))
    (:file "_package_ImageWithCentroids" :depends-on ("_package"))
  ))