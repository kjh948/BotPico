// Generated by gencpp from file pi_face_tracker/Faces.msg
// DO NOT EDIT!


#ifndef PI_FACE_TRACKER_MESSAGE_FACES_H
#define PI_FACE_TRACKER_MESSAGE_FACES_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <pi_face_tracker/Face.h>

namespace pi_face_tracker
{
template <class ContainerAllocator>
struct Faces_
{
  typedef Faces_<ContainerAllocator> Type;

  Faces_()
    : faces()  {
    }
  Faces_(const ContainerAllocator& _alloc)
    : faces(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::pi_face_tracker::Face_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::pi_face_tracker::Face_<ContainerAllocator> >::other >  _faces_type;
  _faces_type faces;





  typedef boost::shared_ptr< ::pi_face_tracker::Faces_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pi_face_tracker::Faces_<ContainerAllocator> const> ConstPtr;

}; // struct Faces_

typedef ::pi_face_tracker::Faces_<std::allocator<void> > Faces;

typedef boost::shared_ptr< ::pi_face_tracker::Faces > FacesPtr;
typedef boost::shared_ptr< ::pi_face_tracker::Faces const> FacesConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pi_face_tracker::Faces_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pi_face_tracker::Faces_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::pi_face_tracker::Faces_<ContainerAllocator1> & lhs, const ::pi_face_tracker::Faces_<ContainerAllocator2> & rhs)
{
  return lhs.faces == rhs.faces;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::pi_face_tracker::Faces_<ContainerAllocator1> & lhs, const ::pi_face_tracker::Faces_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace pi_face_tracker

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::pi_face_tracker::Faces_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pi_face_tracker::Faces_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pi_face_tracker::Faces_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pi_face_tracker::Faces_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pi_face_tracker::Faces_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pi_face_tracker::Faces_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pi_face_tracker::Faces_<ContainerAllocator> >
{
  static const char* value()
  {
    return "795fcad51e08073ca70078799c464613";
  }

  static const char* value(const ::pi_face_tracker::Faces_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x795fcad51e08073cULL;
  static const uint64_t static_value2 = 0xa70078799c464613ULL;
};

template<class ContainerAllocator>
struct DataType< ::pi_face_tracker::Faces_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pi_face_tracker/Faces";
  }

  static const char* value(const ::pi_face_tracker::Faces_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pi_face_tracker::Faces_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Multiple faces\n"
"Face[] faces\n"
"================================================================================\n"
"MSG: pi_face_tracker/Face\n"
"# Face in 3D space\n"
"int32 id\n"
"geometry_msgs/Point point\n"
"float32 attention\n"
"\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::pi_face_tracker::Faces_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pi_face_tracker::Faces_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.faces);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Faces_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pi_face_tracker::Faces_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pi_face_tracker::Faces_<ContainerAllocator>& v)
  {
    s << indent << "faces[]" << std::endl;
    for (size_t i = 0; i < v.faces.size(); ++i)
    {
      s << indent << "  faces[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::pi_face_tracker::Face_<ContainerAllocator> >::stream(s, indent + "    ", v.faces[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // PI_FACE_TRACKER_MESSAGE_FACES_H
