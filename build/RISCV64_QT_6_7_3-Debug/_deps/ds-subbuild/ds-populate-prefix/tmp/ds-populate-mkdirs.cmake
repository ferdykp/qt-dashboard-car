# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/inno/project-qt/Dashboard1/build/RISCV64_QT_6_7_3-Debug/_deps/ds-src"
  "/home/inno/project-qt/Dashboard1/build/RISCV64_QT_6_7_3-Debug/_deps/ds-build"
  "/home/inno/project-qt/Dashboard1/build/RISCV64_QT_6_7_3-Debug/_deps/ds-subbuild/ds-populate-prefix"
  "/home/inno/project-qt/Dashboard1/build/RISCV64_QT_6_7_3-Debug/_deps/ds-subbuild/ds-populate-prefix/tmp"
  "/home/inno/project-qt/Dashboard1/build/RISCV64_QT_6_7_3-Debug/_deps/ds-subbuild/ds-populate-prefix/src/ds-populate-stamp"
  "/home/inno/project-qt/Dashboard1/build/RISCV64_QT_6_7_3-Debug/_deps/ds-subbuild/ds-populate-prefix/src"
  "/home/inno/project-qt/Dashboard1/build/RISCV64_QT_6_7_3-Debug/_deps/ds-subbuild/ds-populate-prefix/src/ds-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/inno/project-qt/Dashboard1/build/RISCV64_QT_6_7_3-Debug/_deps/ds-subbuild/ds-populate-prefix/src/ds-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/inno/project-qt/Dashboard1/build/RISCV64_QT_6_7_3-Debug/_deps/ds-subbuild/ds-populate-prefix/src/ds-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
