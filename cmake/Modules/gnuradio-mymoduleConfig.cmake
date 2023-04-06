find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_MYMODULE gnuradio-mymodule)

FIND_PATH(
    GR_MYMODULE_INCLUDE_DIRS
    NAMES gnuradio/mymodule/api.h
    HINTS $ENV{MYMODULE_DIR}/include
        ${PC_MYMODULE_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_MYMODULE_LIBRARIES
    NAMES gnuradio-mymodule
    HINTS $ENV{MYMODULE_DIR}/lib
        ${PC_MYMODULE_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-mymoduleTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_MYMODULE DEFAULT_MSG GR_MYMODULE_LIBRARIES GR_MYMODULE_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_MYMODULE_LIBRARIES GR_MYMODULE_INCLUDE_DIRS)
