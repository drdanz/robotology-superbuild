# Copyright (C) 2017  iCub Facility, Istituto Italiano di Tecnologia
# Authors: Silvio Traversaro <silvio.traversaro@iit.it>
# CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(YARP QUIET)

set(ICUB_DEPENDS "")
list(APPEND ICUB_DEPENDS YARP)

if(ROBOTOLOGY_ENABLE_ICUB_ROBOT_ETH OR ROBOTOLOGY_ENABLE_ICUB_ROBOT_CAN)
  set(ROBOTOLOGY_ENABLE_ICUB_ROBOT ON)
  find_or_build_package(icub-firmware-shared QUIET)
  list(APPEND ICUB_DEPENDS icub-firmware-shared)
endif()

ycm_ep_helper(ICUB TYPE GIT
                   STYLE GITHUB
                   REPOSITORY robotology/icub-main.git
                   DEPENDS YARP
                   COMPONENT robotology
                   CMAKE_CACHE_ARGS -DENABLE_icubmod_cartesiancontrollerserver:BOOL=ON
                                    -DENABLE_icubmod_cartesiancontrollerclient:BOOL=ON
                                    -DENABLE_icubmod_gazecontrollerclient:BOOL=ON
                                    -DENABLE_icubmod_serial:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT}
                                    -DENABLE_icubmod_serialport:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT}
                                    -DENABLE_icubmod_dragonfly2:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT}
                                    -DENABLE_icubmod_portaudio:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT}
                                    -DENABLE_icubmod_sharedcan:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_CAN}
                                    -DENABLE_icubmod_canmotioncontrol:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_CAN}
                                    -DENABLE_icubmod_canBusAnalogSensor:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_CAN}
                                    -DENABLE_icubmod_canBusInertialMTB:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_CAN}
                                    -DENABLE_icubmod_canBusSkin:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_CAN}
                                    -DENABLE_icubmod_canBusVirtualAnalogSensor:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_CAN}
                                    -DENABLE_icubmod_cfw2can:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_CAN}
                                    -DENABLE_icubmod_embObjStrain:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_ETH}
                                    -DENABLE_icubmod_embObjMais:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_ETH}
                                    -DENABLE_icubmod_embObjInertials:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_ETH}
                                    -DENABLE_icubmod_embObjMotionControl:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_ETH}
                                    -DENABLE_icubmod_embObjSkin:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_ETH}
                                    -DENABLE_icubmod_embObjVirtualAnalogSensor:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_ETH}
                                    -DENABLE_icubmod_parametricCalibratorEth:BOOL=${ROBOTOLOGY_ENABLE_ICUB_ROBOT_ETH})