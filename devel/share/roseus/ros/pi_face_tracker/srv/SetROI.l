;; Auto-generated. Do not edit!


(when (boundp 'pi_face_tracker::SetROI)
  (if (not (find-package "PI_FACE_TRACKER"))
    (make-package "PI_FACE_TRACKER"))
  (shadow 'SetROI (find-package "PI_FACE_TRACKER")))
(unless (find-package "PI_FACE_TRACKER::SETROI")
  (make-package "PI_FACE_TRACKER::SETROI"))
(unless (find-package "PI_FACE_TRACKER::SETROIREQUEST")
  (make-package "PI_FACE_TRACKER::SETROIREQUEST"))
(unless (find-package "PI_FACE_TRACKER::SETROIRESPONSE")
  (make-package "PI_FACE_TRACKER::SETROIRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass pi_face_tracker::SetROIRequest
  :super ros::object
  :slots (_roi ))

(defmethod pi_face_tracker::SetROIRequest
  (:init
   (&key
    ((:roi __roi) (instance sensor_msgs::RegionOfInterest :init))
    )
   (send-super :init)
   (setq _roi __roi)
   self)
  (:roi
   (&rest __roi)
   (if (keywordp (car __roi))
       (send* _roi __roi)
     (progn
       (if __roi (setq _roi (car __roi)))
       _roi)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/RegionOfInterest _roi
    (send _roi :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/RegionOfInterest _roi
       (send _roi :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/RegionOfInterest _roi
     (send _roi :deserialize buf ptr-) (incf ptr- (send _roi :serialization-length))
   ;;
   self)
  )

(defclass pi_face_tracker::SetROIResponse
  :super ros::object
  :slots ())

(defmethod pi_face_tracker::SetROIResponse
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

(defclass pi_face_tracker::SetROI
  :super ros::object
  :slots ())

(setf (get pi_face_tracker::SetROI :md5sum-) "9586986cb2458d45fdbda6087252affd")
(setf (get pi_face_tracker::SetROI :datatype-) "pi_face_tracker/SetROI")
(setf (get pi_face_tracker::SetROI :request) pi_face_tracker::SetROIRequest)
(setf (get pi_face_tracker::SetROI :response) pi_face_tracker::SetROIResponse)

(defmethod pi_face_tracker::SetROIRequest
  (:response () (instance pi_face_tracker::SetROIResponse :init)))

(setf (get pi_face_tracker::SetROIRequest :md5sum-) "9586986cb2458d45fdbda6087252affd")
(setf (get pi_face_tracker::SetROIRequest :datatype-) "pi_face_tracker/SetROIRequest")
(setf (get pi_face_tracker::SetROIRequest :definition-)
      "sensor_msgs/RegionOfInterest roi

================================================================================
MSG: sensor_msgs/RegionOfInterest
# This message is used to specify a region of interest within an image.
#
# When used to specify the ROI setting of the camera when the image was
# taken, the height and width fields should either match the height and
# width fields for the associated image; or height = width = 0
# indicates that the full resolution image was captured.

uint32 x_offset  # Leftmost pixel of the ROI
                 # (0 if the ROI includes the left edge of the image)
uint32 y_offset  # Topmost pixel of the ROI
                 # (0 if the ROI includes the top edge of the image)
uint32 height    # Height of ROI
uint32 width     # Width of ROI

# True if a distinct rectified ROI should be calculated from the \"raw\"
# ROI in this message. Typically this should be False if the full image
# is captured (ROI not used), and True if a subwindow is captured (ROI
# used).
bool do_rectify
---

")

(setf (get pi_face_tracker::SetROIResponse :md5sum-) "9586986cb2458d45fdbda6087252affd")
(setf (get pi_face_tracker::SetROIResponse :datatype-) "pi_face_tracker/SetROIResponse")
(setf (get pi_face_tracker::SetROIResponse :definition-)
      "sensor_msgs/RegionOfInterest roi

================================================================================
MSG: sensor_msgs/RegionOfInterest
# This message is used to specify a region of interest within an image.
#
# When used to specify the ROI setting of the camera when the image was
# taken, the height and width fields should either match the height and
# width fields for the associated image; or height = width = 0
# indicates that the full resolution image was captured.

uint32 x_offset  # Leftmost pixel of the ROI
                 # (0 if the ROI includes the left edge of the image)
uint32 y_offset  # Topmost pixel of the ROI
                 # (0 if the ROI includes the top edge of the image)
uint32 height    # Height of ROI
uint32 width     # Width of ROI

# True if a distinct rectified ROI should be calculated from the \"raw\"
# ROI in this message. Typically this should be False if the full image
# is captured (ROI not used), and True if a subwindow is captured (ROI
# used).
bool do_rectify
---

")



(provide :pi_face_tracker/SetROI "9586986cb2458d45fdbda6087252affd")


