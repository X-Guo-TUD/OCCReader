# Copyright (C) 2014-2015  KIT-INR/NK 
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
#

#SET(CASROOT $ENV{CAS_ROOT_DIR})
SET(CASROOT $ENV{CASROOT})
MESSAGE( ${CASROOT} )
# SET(OCC_VERSION_MAJOR 6)
# SET(OCC_VERSION_MINOR 7)
# SET(OCC_VERSION_MAINTENANCE 10)
SET(CAS_VERSION_DEVELOPMENT 0)

FIND_FILE(ff Standard_Version.hxx ${CASROOT}/include/opencascade ${CASROOT}/inc)    
IF(ff)
  FILE(STRINGS ${ff} CAS_VERSION_DEVELOPMENT_STR
      REGEX "^ *#define OCC_VERSION_DEVELOPMENT *\"dev\".*$")
  IF(CAS_VERSION_DEVELOPMENT_STR)
    SET(CAS_VERSION_DEVELOPMENT 1)
  ENDIF(CAS_VERSION_DEVELOPMENT_STR)
ENDIF(ff)

SET(CAS_CPPFLAGS)
# SET(CAS_CPPFLAGS ${CAS_CPPFLAGS} -DOCC_VERSION_MAJOR=${OCC_VERSION_MAJOR})
# SET(CAS_CPPFLAGS ${CAS_CPPFLAGS} -DOCC_VERSION_MINOR=${OCC_VERSION_MINOR})
# SET(CAS_CPPFLAGS ${CAS_CPPFLAGS} -DOCC_VERSION_MAINTENANCE=${OCC_VERSION_MAINTENANCE})
SET(CAS_CPPFLAGS ${CAS_CPPFLAGS} -DLIN -DLINTEL -DCSFDB)
SET(CAS_DEFINITIONS "-DLIN -DLINTEL -DCSFDB")
SET(CAS_CPPFLAGS ${CAS_CPPFLAGS} -DNo_exception)
SET(CAS_DEFINITIONS "${CAS_DEFINITIONS} -DNo_exception")
SET(CAS_CPPFLAGS ${CAS_CPPFLAGS} -DHAVE_CONFIG_H)
SET(CAS_DEFINITIONS "${CAS_DEFINITIONS} -DHAVE_CONFIG_H")
SET(CAS_CPPFLAGS ${CAS_CPPFLAGS} -DHAVE_LIMITS_H)
SET(CAS_DEFINITIONS "${CAS_DEFINITIONS} -DHAVE_LIMITS_H")
SET(CAS_CPPFLAGS ${CAS_CPPFLAGS} -I${CASROOT}/inc) # to be removed
SET(CAS_INCLUDE_DIRS ${CASROOT}/inc)
MESSAGE( ${CAS_INCLUDE_DIRS} )

IF(CMAKE_SIZEOF_VOID_P STREQUAL 8)
  SET(CAS_CPPFLAGS ${CAS_CPPFLAGS} -D_OCC64)
ENDIF(CMAKE_SIZEOF_VOID_P STREQUAL 8)

IF(CAS_VERSION_DEVELOPMENT STREQUAL 1)
  SET(CAS_CPPFLAGS "${CAS_CPPFLAGS} -DCAS_VERSION_DEVELOPMENT")
ENDIF(CAS_VERSION_DEVELOPMENT STREQUAL 1)

IF(WINDOWS)
#  IF(PARAVIEW_BUILD_ARCHITECTURE STREQUAL 32)
#    SET(CASROOT_LIBDIR ${CASROOT}/win32/vc10/lib)
#  ELSE(PARAVIEW_BUILD_ARCHITECTURE STREQUAL 64)
    SET(CASROOT_LIBDIR ${CASROOT}/win64/vc10/lib)
#  ENDIF(CMAKE_BUILD_TYPE STREQUAL Debug)
# SET(CASROOT_LIBDIR ${CASROOT}/win32/lib)
ELSE(WINDOWS)
  SET(CASROOT_LIBDIR ${CASROOT}/lib)
ENDIF(WINDOWS)
MESSAGE( ${CASROOT_LIBDIR} )

SET(CMAKE_LIBRARY_PATH ${CASROOT_LIBDIR})

IF(NOT WINDOWS)
  FIND_LIBRARY(Xmu Xmu)
  IF(Xmu)
    SET(CAS_LDPATH ${Xmu})
  ENDIF(Xmu)
ENDIF(NOT WINDOWS)

#FIND_LIBRARY(BinLPlugin BinLPlugin)
#FIND_LIBRARY(BinPlugin BinPlugin)
#FIND_LIBRARY(BinTObjPlugin BinTObjPlugin)
#FIND_LIBRARY(BinXCAFPlugin BinXCAFPlugin)
FIND_LIBRARY(FWOSPlugin FWOSPlugin)
# FIND_LIBRARY(mscmd mscmd)
FIND_LIBRARY(PTKernel PTKernel)
FIND_LIBRARY(StdLPlugin StdLPlugin)
FIND_LIBRARY(StdPlugin StdPlugin)
FIND_LIBRARY(TKAdvTools TKAdvTools)
FIND_LIBRARY(TKBin TKBin)
FIND_LIBRARY(TKBinL TKBinL)
FIND_LIBRARY(TKBinTObj TKBinTObj)
FIND_LIBRARY(TKBinXCAF TKBinXCAF)
FIND_LIBRARY(TKBO TKBO)
FIND_LIBRARY(TKBool TKBool)
FIND_LIBRARY(TKBRep TKBRep)
FIND_LIBRARY(TKCAF TKCAF)
FIND_LIBRARY(TKCDF TKCDF)
# FIND_LIBRARY(TKCDLFront TKCDLFront)
# FIND_LIBRARY(TKCPPClient TKCPPClient)
# FIND_LIBRARY(TKCPPExt TKCPPExt)
# FIND_LIBRARY(TKCPPIntExt TKCPPIntExt)
# FIND_LIBRARY(TKCPPJini TKCPPJini)
# FIND_LIBRARY(TKCSFDBSchema TKCSFDBSchema)
# FIND_LIBRARY(TKDCAF TKDCAF)
# FIND_LIBRARY(TKDraw TKDraw)
FIND_LIBRARY(TKernel TKernel)
FIND_LIBRARY(TKFeat TKFeat)
FIND_LIBRARY(TKFillet TKFillet)
FIND_LIBRARY(TKG2d TKG2d)
FIND_LIBRARY(TKG3d TKG3d)
FIND_LIBRARY(TKGeomAlgo TKGeomAlgo)
FIND_LIBRARY(TKGeomBase TKGeomBase)
FIND_LIBRARY(TKHLR TKHLR)
# FIND_LIBRARY(TKIDLFront TKIDLFront)
FIND_LIBRARY(TKIGES TKIGES)
FIND_LIBRARY(TKLCAF TKLCAF)
FIND_LIBRARY(TKMath TKMath)
FIND_LIBRARY(TKMesh TKMesh)
FIND_LIBRARY(TKMeshVS TKMeshVS)
FIND_LIBRARY(TKNIS TKNIS)
FIND_LIBRARY(TKOffset TKOffset)
FIND_LIBRARY(TKOpenGl TKOpenGl)
FIND_LIBRARY(TKPCAF TKPCAF)
FIND_LIBRARY(TKPLCAF TKPLCAF)
FIND_LIBRARY(TKPrim TKPrim)
FIND_LIBRARY(TKPShape TKPShape)
FIND_LIBRARY(TKService TKService)
FIND_LIBRARY(TKShapeSchema TKShapeSchema)
FIND_LIBRARY(TKShHealing TKShHealing)
FIND_LIBRARY(TKStdLSchema TKStdLSchema)
FIND_LIBRARY(TKStdSchema TKStdSchema)
FIND_LIBRARY(TKSTEP TKSTEP)
FIND_LIBRARY(TKSTEP209 TKSTEP209)
FIND_LIBRARY(TKSTEPAttr TKSTEPAttr)
FIND_LIBRARY(TKSTEPBase TKSTEPBase)
FIND_LIBRARY(TKSTL TKSTL)
# FIND_LIBRARY(TKTCPPExt TKTCPPExt)
FIND_LIBRARY(TKTObj TKTObj)
# FIND_LIBRARY(TKTObjDRAW TKTObjDRAW)
FIND_LIBRARY(TKTopAlgo TKTopAlgo)
# FIND_LIBRARY(TKTopTest TKTopTest)
FIND_LIBRARY(TKV2d TKV2d)
FIND_LIBRARY(TKV3d TKV3d)
# FIND_LIBRARY(TKViewerTest TKViewerTest)
FIND_LIBRARY(TKVRML TKVRML)
# FIND_LIBRARY(TKWOK TKWOK)
# FIND_LIBRARY(TKWOKTcl TKWOKTcl)
FIND_LIBRARY(TKXCAF TKXCAF)
FIND_LIBRARY(TKXCAFSchema TKXCAFSchema)
# FIND_LIBRARY(TKXDEDRAW TKXDEDRAW)
FIND_LIBRARY(TKXDEIGES TKXDEIGES)
FIND_LIBRARY(TKXDESTEP TKXDESTEP)
FIND_LIBRARY(TKXMesh TKXMesh)
FIND_LIBRARY(TKXml TKXml)
FIND_LIBRARY(TKXmlL TKXmlL)
FIND_LIBRARY(TKXmlTObj TKXmlTObj)
FIND_LIBRARY(TKXmlXCAF TKXmlXCAF)
FIND_LIBRARY(TKXSBase TKXSBase)
# FIND_LIBRARY(TKXSDRAW TKXSDRAW)
# FIND_LIBRARY(wokcmd wokcmd)
# FIND_LIBRARY(wokdeliverysteps wokdeliverysteps)
# FIND_LIBRARY(wokdfltsteps wokdfltsteps)
# FIND_LIBRARY(wokobjssteps wokobjssteps)
# FIND_LIBRARY(wokorbixsteps wokorbixsteps)
# FIND_LIBRARY(woksteps woksteps)
# FIND_LIBRARY(woktoolscmd woktoolscmd)
# FIND_LIBRARY(wokutilscmd wokutilscmd)
FIND_LIBRARY(XCAFPlugin XCAFPlugin)
FIND_LIBRARY(XmlLPlugin XmlLPlugin)
FIND_LIBRARY(XmlPlugin XmlPlugin)
FIND_LIBRARY(XmlTObjPlugin XmlTObjPlugin)
FIND_LIBRARY(XmlXCAFPlugin XmlXCAFPlugin)

SET(CAS_KERNEL ${TKernel} ${TKMath})
SET(CAS_OCAF ${TKernel} ${TKMath} ${TKCDF} ${TKLCAF})
SET(CAS_VIEWER ${TKService} ${TKV3d} ${TKG3d} ${TKGeomBase} ${TKBRep})
SET(CAS_OCAFVIS ${TKCAF} ${TKBRep} ${TKG2d})
SET(CAS_MODELER ${TKG3d} ${TKGeomBase} ${TKGeomAlgo} ${TKBRep} ${TKTopAlgo} ${TKG2d})

SET(TKV3d_EA ${TKernel} ${TKMath} ${TKV3d})
SET(TKBool_EA ${TKernel} ${TKMath} ${TKBRep} ${TKG2d} ${TKG3d} ${TKGeomBase} ${TKGeomAlgo} ${TKTopAlgo} ${TKBool})
SET(TKBRep_EA ${TKernel} ${TKMath} ${TKBRep})
SET(TKIGES_EA ${TKernel} ${TKMath} ${TKXSBase} ${TKBRep} ${TKIGES})
SET(TKSTEP_EA ${TKernel} ${TKMath} ${TKXSBase} ${TKBRep} ${TKSTEP})
SET(TKSTL_EA ${TKernel} ${TKMath} ${TKSTL})
SET(TKCAF_EA ${TKPrim} ${TKCAF})

SET(TKV3d ${TKV3d_EA})
SET(TKBool ${TKBool_EA})
SET(TKBRep ${TKBRep_EA})
SET(TKIGES ${TKIGES_EA})
SET(TKSTEP ${TKSTEP_EA})
SET(TKSTL ${TKSTL_EA})
SET(TKCAF ${TKCAF_EA})

IF(StdPlugin)
  SET(CAS_STDPLUGIN StdPlugin)
ELSE(StdPlugin)
  IF(TKStdLSchema)
    SET(CAS_STDPLUGIN TKStdSchema)
  ENDIF(TKStdLSchema)
ENDIF(StdPlugin)
