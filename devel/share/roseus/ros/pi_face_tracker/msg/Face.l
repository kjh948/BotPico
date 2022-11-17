;; Auto-generated. Do not edit!


(when (boundp 'pi_face_tracker::Face)
  (if (not (find-package "PI_FACE_TRACKER"))
    (make-package "PI_FACE_TRACKER"))
  (shadow 'Face (find-package "PI_FACE_TRACKER")))
(unless (find-package "PI_FACE_TRACKER::FACE")
  (make-package "PI_FACE_TRACKER::FACE"))

(in-package "ROS")
;;//! \htmlinclude Face.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass pi_face_tracker::Face
  :super ros::object
  :slots (_id _point _attention ))

(defmethod pi_face_tracker::Face
  (:init
   (&key
    ((:id __id) 0)
    ((:point __point) (instance geometry_msgs::Point :init))
    ((:attention __attention) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _point __point)
   (setq _attention (float __attention))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:attention
   (&optional __attention)
   (if __attention (setq _attention __attention)) _attention)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; geometry_msgs/Point _point
    (send _point :serialization-length)
    ;; float32 _attention
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; geometry_msgs/Point _point
       (send _point :serialize s)
     ;; float32 _attention
       (sys::poke _attention (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;; float32 _attention
     (setq _attention (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pi_face_tracker::Face :md5sum-) "4e50a53ae9f2ade62039cc5bdc75e8c3")
(setf (get pi_face_tracker::Face :datatype-) "pi_face_tracker/Face")
(setf (get pi_face_tracker::Face :definition-)
      "# Face in 3D space
int32 id
geometry_msgs/Point point
float32 attention


================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :pi_face_tracker/Face "4e50a53ae9f2ade62039cc5bdc75e8c3")


