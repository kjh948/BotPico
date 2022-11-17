;; Auto-generated. Do not edit!


(when (boundp 'pi_face_tracker::FaceEvent)
  (if (not (find-package "PI_FACE_TRACKER"))
    (make-package "PI_FACE_TRACKER"))
  (shadow 'FaceEvent (find-package "PI_FACE_TRACKER")))
(unless (find-package "PI_FACE_TRACKER::FACEEVENT")
  (make-package "PI_FACE_TRACKER::FACEEVENT"))

(in-package "ROS")
;;//! \htmlinclude FaceEvent.msg.html


(defclass pi_face_tracker::FaceEvent
  :super ros::object
  :slots (_face_event _face_id ))

(defmethod pi_face_tracker::FaceEvent
  (:init
   (&key
    ((:face_event __face_event) "")
    ((:face_id __face_id) 0)
    )
   (send-super :init)
   (setq _face_event (string __face_event))
   (setq _face_id (round __face_id))
   self)
  (:face_event
   (&optional __face_event)
   (if __face_event (setq _face_event __face_event)) _face_event)
  (:face_id
   (&optional __face_id)
   (if __face_id (setq _face_id __face_id)) _face_id)
  (:serialization-length
   ()
   (+
    ;; string _face_event
    4 (length _face_event)
    ;; int32 _face_id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _face_event
       (write-long (length _face_event) s) (princ _face_event s)
     ;; int32 _face_id
       (write-long _face_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _face_event
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _face_event (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _face_id
     (setq _face_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pi_face_tracker::FaceEvent :md5sum-) "5adeac26feae2331d8e18267bc285e92")
(setf (get pi_face_tracker::FaceEvent :datatype-) "pi_face_tracker/FaceEvent")
(setf (get pi_face_tracker::FaceEvent :definition-)
      "string face_event
int32 face_id

")



(provide :pi_face_tracker/FaceEvent "5adeac26feae2331d8e18267bc285e92")


