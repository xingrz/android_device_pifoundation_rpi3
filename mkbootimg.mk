TARGET_BOOT_OUT := $(PRODUCT_OUT)/boot

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.zip

INTERNAL_BOOTZIP_FILES := $(filter $(TARGET_BOOT_OUT)/%, \
	$(ALL_PREBUILT) \
	$(ALL_GENERATED_SOURCES) \
	$(ALL_DEFAULT_INSTALLED_MODULES))

$(INSTALLED_BOOTIMAGE_TARGET): $(ZIP) \
		$(INTERNAL_BOOTZIP_FILES) \
		$(INTERNAL_BOOTIMAGE_FILES) \
		$(BOOTIMAGE_EXTRA_DEPS)
	$(call pretty,"Target boot zip archive: $@")
	$(hide) mkdir -p $(TARGET_BOOT_OUT)
	$(hide) cp -f $(INSTALLED_KERNEL_TARGET) $(TARGET_BOOT_OUT)/zImage
	$(hide) cp -f $(INSTALLED_RAMDISK_TARGET) $(TARGET_BOOT_OUT)/ramdisk.img
	$(hide) echo "initrd=$(BOARD_RAMDISK_OFFSET) $(BOARD_KERNEL_CMDLINE)" > $(TARGET_BOOT_OUT)/cmdline.txt
	$(hide) pushd $(TARGET_BOOT_OUT); zip -r -9 $@ *; popd
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE))
	@echo -e ${CL_CYN}"Made boot archive: $@"${CL_RST}
