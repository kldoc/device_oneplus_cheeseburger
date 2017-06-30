#
# Copyright (C) 2017 The Linux Foundation
# Copyright (C) 2017 The halogenOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from OPPO common
-include device/oppo/common/BoardConfigCommon.mk

TARGET_OTA_ASSERT_DEVICE := OnePlus5,cheeseburger,oneplus5,op5,A5000

PLATFORM_PATH := device/oneplus/cheeseburger

# Bootloader
TARGET_BOARD_PLATFORM := msm8998
TARGET_BOOTLOADER_BOARD_NAME := msm8998
TARGET_NO_BOOTLOADER := true

# Use Snapdragon LLVM, if available
TARGET_USE_SDCLANG := true

BOARD_VENDOR := oneplus
BOARD_USES_QCOM_HARDWARE := true

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/bluetooth
BOARD_HAS_QCA_BT_ROME := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_BTNV := true
#QCOM_BT_USE_SMD_TTY := true

TARGET_USES_UEFI := true

# Kernel
TARGET_KERNEL_VERSION := 4.4
ifeq ($(BOARD_KERNEL_CMDLINE),)
ifeq ($(TARGET_KERNEL_VERSION),4.4)
     BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 earlycon=msm_serial_dm,0xc1b0000
else
     BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 earlycon=msm_hsl_uart,0xc1b0000
endif
BOARD_KERNEL_CMDLINE += \
        androidboot.hardware=qcom \
        androidboot.configfs=true \
        androidboot.usbcontroller=a800000.dwc3 \
        ehci-hcd.park=3 \
        sched_enable_hmp=1 \
        sched_enable_power_aware=1 \
        service_locator.enable=1 \
        swiotlb=2048 \
        user_debug=31 \
        msm_rtb.filter=0x237 \
        lpm_levels.sleep_disabled=1 \
        swiotlb=2048 \
        androidboot.selinux=permissive
endif

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_KERNEL_IMAGE_NAME  := Image.gz-dtb
BOARD_RAMDISK_OFFSET     := 0x02000000
TARGET_KERNEL_APPEND_DTB := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8998
TARGET_KERNEL_CONFIG := oneplus5_defconfig
TARGET_KERNEL_APPEND_DTB := true
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_CROSS_COMPILE_PREFIX := aarch64-linux-android-

TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.qcom

# Images
#TARGET_NO_RECOVERY := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 32212254720
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x04000000
BOARD_FRP_PARTITION_NAME := frp
PRODUCT_SUPPORTS_VERITY := true
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/bootdevice/by-name/system
BOARD_HAS_LARGE_FILESYSTEM := true

# Graphics
USE_OPENGL_RENDERER := true
HWUI_COMPILE_FOR_PERF := true

TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_QCOM_BSP := true
TARGET_USES_COLOR_METADATA := true

BOARD_EGL_CFG := $(PLATFORM_PATH)/egl.cfg

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096

VSYNC_EVENT_PHASE_OFFSET_NS := 0
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 0

TARGET_BOARD_PLATFORM_GPU := qcom-adreno540
HAVE_ADRENO_SOURCE := false
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# List of AAPT configurations
PRODUCT_AAPT_CONFIG += xlarge large

# Audio
BOARD_USES_GENERIC_AUDIO := true
BOARD_QTI_CAMERA_32BIT_ONLY := true
TARGET_NO_RPC := true

AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := false
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_CUSTOMSTEREO := true
AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true

AUDIO_FINE_TUNED_OPTIMIZATIONS := true

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_USES_MEDIA_EXTENSIONS := true

# Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_INIT_VENDOR_LIB := libinit_cheeseburger
TARGET_INIT_COLDBOOT_TIMEOUT := 8

# HW encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw

# Disable basic dexpreopt
WITH_DEXPREOPT := false

# RIL
TARGET_RIL_VARIANT := caf

# Enable peripheral manager
TARGET_PER_MGR_ENABLED := true

# Sensors
TARGET_USES_SSC := true
USE_SENSOR_MULTI_HAL := true

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Charger
#BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm

# NFC
#TARGET_USES_NQ_NFC := true
#NQ3XX_PRESENT := true

# WLAN
WLAN_CHIPSET := qca_cld3

BOARD_HAVE_QCOM_FM := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/include

# Enabling IMS Feature
TARGET_USES_IMS := true

-include vendor/oneplus/cheeseburger/BoardConfigVendor.mk
