;; Auto-generated. Do not edit!


(when (boundp 'pi_face_tracker::Faces)
  (if (not (find-package "PI_FACE_TRACKER"))
    (make-package "PI_FACE_TRACKER"))
  (shadow 'Faces (find-package "PI_FACE_TRACKER")))
(unless (find-package "PI_FACE_TRACKER::FACES")
  (make-package "PI_FACE_TRACKER::FACES"))

(in-package "ROS")
;;//! \htmlinclude Faces.msg.html


(defclass pi_face_tracker::Faces
  :super ros::object
  :slots (_faces ))

(defmethod pi_face_tracker::Faces
  (:init
   (&key
    ((:faces __faces) ())
    )
   (send-super :init)
   (setq _faces __faces)
   self)
  (:faces
   (&rest __faces)
   (if (keywordp (car __faces))
       (send* _faces __faces)
     (progn
       (if __faces (setq _faces (car __faces)))
       _faces)))
  (:serialization-length
   ()
   (+
    ;; pi_face_tracker/Face[] _faces
    (apply #'+ (send-all _faces :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; pi_face_tracker/Face[] _faces
     (write-long (length _faces) s)
     (dolist (elem _faces)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; pi_face_tracker/Face[] _faces
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _faces (let (r) (dotimes (i n) (push (instance pi_face_tracker::Face :init) r)) r))
     (dolist (elem- _faces)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get pi_face_tracker::Faces :md5sum-) "795fcad51e08073ca70078799c464613")
(setf (get pi_face_tracker::Faces :datatype-) "pi_face_tracker/Faces")
(setf (get pi_face_tracker::Faces :definition-)
      "# Multiple faces
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

")



(provide :pi_face_tracker/Faces "795fcad51e08073ca70078799c464613")


