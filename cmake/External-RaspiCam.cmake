message("External project: RaspiCam")

ExternalProject_Add(raspicamera
  GIT_REPOSITORY ${git_protocol}://github.com/cedricve/raspicam
  SOURCE_DIR raspicamera
  BINARY_DIR raspicamera-build
  UPDATE_COMMAND ""
  PATCH_COMMAND ""
  CMAKE_GENERATOR ${gen}
  CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/thirdparty
)
add_dependencies(raspicamera userland)

set(RASPBERRYPI_INCLUDE_DIR ${CMAKE_BINARY_DIR}/thirdparty/include/)
set(RASPBERRYPI_LIBRARY_DIR ${CMAKE_BINARY_DIR}/thirdparty/lib/)

include_directories(${RASPBERRYPI_INCLUDE_DIR})
link_directories(${RASPBERRYPI_LIBRARY_DIR})

set(RASPBERRYPI_LIBRARIES raspicam raspicam_cv mmal mmal_core mmal_util)