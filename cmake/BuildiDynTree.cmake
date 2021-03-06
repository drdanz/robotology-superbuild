# Copyright (C) 2017  iCub Facility, Istituto Italiano di Tecnologia
# Authors: Silvio Traversaro <silvio.traversaro@iit.it>
# CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)
find_or_build_package(ICUB QUIET)

set(iDynTree_DEPENDS "")
list(APPEND iDynTree_DEPENDS YARP)
list(APPEND iDynTree_DEPENDS ICUB)

ycm_ep_helper(iDynTree TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology/idyntree.git
              TAG master
              COMPONENT robotology
              CMAKE_ARGS -DIDYNTREE_USES_MATLAB:BOOL=${ROBOTOLOGY_USES_MATLAB}
                         -DIDYNTREE_USES_PYTHON:BOOL=${ROBOTOLOGY_USES_PYTHON}
                         -DIDYNTREE_USES_OCTAVE:BOOL=${ROBOTOLOGY_USES_OCTAVE}
              DEPENDS ${iDynTree_DEPENDS})
