;; Auto-generated. Do not edit!


(when (boundp 'pi_face_tracker::KeyCommand)
  (if (not (find-package "PI_FACE_TRACKER"))
    (make-package "PI_FACE_TRACKER"))
  (shadow 'KeyCommand (find-package "PI_FACE_TRACKER")))
(unless (find-package "PI_FACE_TRACKER::KEYCOMMAND")
  (make-package "PI_FACE_TRACKER::KEYCOMMAND"))
(unless (find-package "PI_FACE_TRACKER::KEYCOMMANDREQUEST")
  (make-package "PI_FACE_TRACKER::KEYCOMMANDREQUEST"))
(unless (find-package "PI_FACE_TRACKER::KEYCOMMANDRESPONSE")
  (make-package "PI_FACE_TRACKER::KEYCOMMANDRESPONSE"))

(in-package "ROS")





(defclass pi_face_tracker::KeyCommandRequest
  :super ros::object
  :slots (_command ))

(defmethod pi_face_tracker::KeyCommandRequest
  (:init
   (&key
    ((:command __command) "")
    )
   (send-super :init)
   (setq _command (string __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass pi_face_tracker::KeyCommandResponse
  :super ros::object
  :slots ())

(defmethod pi_face_tracker::KeyCommandResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass pi_face_tracker::KeyCommand
  :super ros::object
  :slots ())

(setf (get pi_face_tracker::KeyCommand :md5sum-) "cba5e21e920a3a2b7b375cb65b64cdea")
(setf (get pi_face_tracker::KeyCommand :datatype-) "pi_face_tracker/KeyCommand")
(setf (get pi_face_tracker::KeyCommand :request) pi_face_tracker::KeyCommandRequest)
(setf (get pi_face_tracker::KeyCommand :response) pi_face_tracker::KeyCommandResponse)

(defmethod pi_face_tracker::KeyCommandRequest
  (:response () (instance pi_face_tracker::KeyCommandResponse :init)))

(setf (get pi_face_tracker::KeyCommandRequest :md5sum-) "cba5e21e920a3a2b7b375cb65b64cdea")
(setf (get pi_face_tracker::KeyCommandRequest :datatype-) "pi_face_tracker/KeyCommandRequest")
(setf (get pi_face_tracker::KeyCommandRequest :definition-)
      "string command
---

")

(setf (get pi_face_tracker::KeyCommandResponse :md5sum-) "cba5e21e920a3a2b7b375cb65b64cdea")
(setf (get pi_face_tracker::KeyCommandResponse :datatype-) "pi_face_tracker/KeyCommandResponse")
(setf (get pi_face_tracker::KeyCommandResponse :definition-)
      "string command
---

")



(provide :pi_face_tracker/KeyCommand "cba5e21e920a3a2b7b375cb65b64cdea")


