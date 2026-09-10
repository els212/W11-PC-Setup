@echo off
sc config NVDisplay.ContainerLocalSystem start=disabled
sc stop NVDisplay.ContainerLocalSystem
exit