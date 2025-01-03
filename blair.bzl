load(":target_variants.bzl", "la_variants")
load(":msm_kernel_la.bzl", "define_msm_la")
load(":image_opts.bzl", "boot_image_opts")

target_name = "blair"

def define_blair():
    _blair_in_tree_modules = [
        # keep sorted
        "drivers/char/rdbg.ko",
        "drivers/clk/qcom/clk-dummy.ko",
        "drivers/clk/qcom/clk-qcom.ko",
        "drivers/clk/qcom/clk-rpmh.ko",
        "drivers/clk/qcom/clk-smd-rpm.ko",
        "drivers/clk/qcom/clk-spmi-pmic-div.ko",
        "drivers/clk/qcom/debugcc-blair.ko",
        "drivers/clk/qcom/debugcc-holi.ko",
        "drivers/clk/qcom/dispcc-blair.ko",
        "drivers/clk/qcom/dispcc-holi.ko",
        "drivers/clk/qcom/gcc-blair.ko",
        "drivers/clk/qcom/gcc-holi.ko",
        "drivers/clk/qcom/gdsc-regulator.ko",
        "drivers/clk/qcom/gpucc-blair.ko",
        "drivers/clk/qcom/gpucc-holi.ko",
        "drivers/cpufreq/qcom-cpufreq-hw.ko",
        "drivers/cpufreq/qcom-cpufreq-hw-debug.ko",
        "drivers/cpuidle/governors/qcom_lpm.ko",
        "drivers/dma-buf/heaps/qcom_dma_heaps.ko",
        "drivers/dma/qcom/bam_dma.ko",
        "drivers/dma/qcom/msm_gpi.ko",
        "drivers/edac/kryo_arm64_edac.ko",
        "drivers/firmware/qcom-scm.ko",
        "drivers/hwspinlock/qcom_hwspinlock.ko",
        "drivers/hwtracing/coresight/coresight.ko",
        "drivers/hwtracing/coresight/coresight-csr.ko",
        "drivers/hwtracing/coresight/coresight-cti.ko",
        "drivers/hwtracing/coresight/coresight-dummy.ko",
        "drivers/hwtracing/coresight/coresight-funnel.ko",
        "drivers/hwtracing/coresight/coresight-hwevent.ko",
        "drivers/hwtracing/coresight/coresight-remote-etm.ko",
        "drivers/hwtracing/coresight/coresight-replicator.ko",
        "drivers/hwtracing/coresight/coresight-stm.ko",
        "drivers/hwtracing/coresight/coresight-tgu.ko",
        "drivers/hwtracing/coresight/coresight-tmc.ko",
        "drivers/hwtracing/coresight/coresight-tmc-sec.ko",
        "drivers/hwtracing/coresight/coresight-tpda.ko",
        "drivers/hwtracing/coresight/coresight-tpdm.ko",
        "drivers/hwtracing/stm/stm_console.ko",
        "drivers/hwtracing/stm/stm_core.ko",
        "drivers/hwtracing/stm/stm_ftrace.ko",
        "drivers/hwtracing/stm/stm_heartbeat.ko",
        "drivers/hwtracing/stm/stm_p_ost.ko",
        "drivers/i2c/busses/i2c-msm-geni.ko",
        "drivers/i3c/master/i3c-master-msm-geni.ko",
        "drivers/iio/adc/qcom-spmi-adc5.ko",
        "drivers/iio/adc/qcom-vadc-common.ko",
        "drivers/input/misc/pm8941-pwrkey.ko",
        "drivers/input/misc/qpnp-power-on.ko",
        "drivers/input/touchscreen/usbtouchscreen.ko",
        "drivers/interconnect/icc-test.ko",
        "drivers/interconnect/qcom/icc-debug.ko",
        "drivers/interconnect/qcom/icc-rpm.ko",
        "drivers/interconnect/qcom/qnoc-blair.ko",
        "drivers/interconnect/qcom/qnoc-holi.ko",
        "drivers/interconnect/qcom/qnoc-qos-rpm.ko",
        "drivers/iommu/arm/arm-smmu/arm_smmu.ko",
        "drivers/iommu/iommu-logger.ko",
        "drivers/iommu/msm_dma_iommu_mapping.ko",
        "drivers/iommu/qcom_iommu_debug.ko",
        "drivers/iommu/qcom_iommu_util.ko",
        "drivers/irqchip/irq-qcom-mpm.ko",
        "drivers/irqchip/msm_show_resume_irq.ko",
        "drivers/irqchip/qcom-mpm.ko",
	"drivers/leds/aw210xx/leds_aw210xx.ko",
        "drivers/leds/leds-qpnp-flash-v2.ko",
        "drivers/leds/leds-qpnp-vibrator-ldo.ko",
        "drivers/leds/leds-qti-tri-led.ko",
        "drivers/mailbox/msm_qmp.ko",
        "drivers/mailbox/qcom-ipcc.ko",
        "drivers/mfd/qcom-i2c-pmic.ko",
        "drivers/mfd/qcom-spmi-pmic.ko",
        "drivers/mmc/host/cqhci.ko",
        "drivers/mmc/host/sdhci-msm.ko",
        "drivers/mmc/host/sdhci-msm-scaling.ko",
        "drivers/nvmem/nvmem_qcom-spmi-sdam.ko",
        "drivers/nvmem/nvmem_qfprom.ko",
        "drivers/perf/qcom_llcc_pmu.ko",
        "drivers/phy/qualcomm/phy-qcom-ufs.ko",
        "drivers/phy/qualcomm/phy-qcom-ufs-qmp-v3.ko",
        "drivers/phy/qualcomm/phy-qcom-ufs-qmp-v4.ko",
        "drivers/phy/qualcomm/phy-qcom-ufs-qmp-v4-blair.ko",
        "drivers/phy/qualcomm/phy-qcom-ufs-qrbtc-sdm845.ko",
        "drivers/pinctrl/qcom/pinctrl-blair.ko",
        "drivers/pinctrl/qcom/pinctrl-holi.ko",
        "drivers/pinctrl/qcom/pinctrl-msm.ko",
        "drivers/pinctrl/qcom/pinctrl-spmi-gpio.ko",
        "drivers/pinctrl/qcom/pinctrl-spmi-mpp.ko",
        "drivers/power/reset/msm-poweroff.ko",
        "drivers/power/reset/qcom-dload-mode.ko",
        "drivers/power/reset/qcom-pon.ko",
        "drivers/power/reset/reboot-mode.ko",
        #ifdef OPLUS_FEATURE_CHG_BASIC
        "drivers/usb/typec/tcpc/tcpc_class.ko",
        "drivers/usb/typec/tcpc/tcpci_late_sync.ko",
        "drivers/usb/typec/tcpc/pd_dbg_info.ko",
        "drivers/usb/typec/tcpc/rt-regmap.ko",
        "drivers/power/oplus/v1/oplus_chg.ko",
        #endif // OPLUS_FEATURE_CHG_BASIC
        "drivers/power/supply/qcom/qcom-qpnp-qg.ko",
        "drivers/power/supply/qcom/qcom-smb1355-charger.ko",
        "drivers/power/supply/qcom/qcom-smb1398-charger.ko",
        "drivers/power/supply/qcom/qpnp-smb5-main.ko",
        "drivers/pwm/pwm-qti-lpg.ko",
        "drivers/regulator/debug-regulator.ko",
        "drivers/regulator/proxy-consumer.ko",
        "drivers/regulator/qcom_pm8008-regulator.ko",
        "drivers/regulator/qpnp-amoled-regulator.ko",
        "drivers/regulator/qpnp-lcdb-regulator.ko",
        "drivers/regulator/qti-fixed-regulator.ko",
        "drivers/regulator/refgen.ko",
        "drivers/regulator/rpm-smd-regulator.ko",
        "drivers/regulator/stub-regulator.ko",
        "drivers/regulator/camera_wl2868c/oplus_camera_wl2868c.ko",
        "drivers/regulator/camera_aw37004/oplus_camera_aw37004.ko",
        "drivers/remoteproc/qcom_pil_info.ko",
        "drivers/remoteproc/qcom_q6v5.ko",
        "drivers/remoteproc/qcom_q6v5_pas.ko",
        "drivers/remoteproc/qcom_sysmon.ko",
        "drivers/remoteproc/rproc_qcom_common.ko",
        "drivers/rpmsg/glink_pkt.ko",
        "drivers/rpmsg/qcom_glink.ko",
        "drivers/rpmsg/qcom_glink_rpm.ko",
        "drivers/rpmsg/qcom_glink_smem.ko",
        "drivers/rpmsg/qcom_glink_spss.ko",
        "drivers/rpmsg/rpm-smd.ko",
        "drivers/rtc/rtc-pm8xxx.ko",
        "drivers/scsi/sg.ko",
        "drivers/slimbus/slim-qcom-ngd-ctrl.ko",
        "drivers/slimbus/slimbus.ko",
        "drivers/soc/oplus/boot/cmdline_parser/oplusboot.ko",
        "drivers/soc/oplus/boot/cmdline_parser/oplus_ftm_mode.ko",
        "drivers/soc/oplus/boot/cmdline_parser/buildvariant.ko",
        "drivers/soc/oplus/boot/cmdline_parser/cdt_integrity.ko",
        "drivers/soc/oplus/boot/cmdline_parser/oplus_charger_present.ko",
        "drivers/soc/oplus/boot/oplus_projectinfo/oplus_bsp_boot_projectinfo.ko",
        "drivers/soc/oplus/boot/bootmode/boot_mode.ko",
        "drivers/soc/oplus/boot/bootloader_log/bootloader_log.ko",
        "drivers/soc/qcom/rpm-smd-debug.ko",
        "drivers/soc/oplus/boot/htb/tango32.ko",
        "drivers/soc/oplus/boot/qcom_watchdog/qcom_enhance_watchdog.ko",
        "drivers/soc/qcom/boot_stats.ko",
        "drivers/soc/qcom/cdsprm.ko",
        "drivers/soc/qcom/cmd-db.ko",
        "drivers/soc/qcom/core_hang_detect.ko",
        "drivers/soc/qcom/crypto-qti.ko",
        "drivers/soc/qcom/dcc_v2.ko",
        "drivers/soc/qcom/dcvs/bwmon.ko",
        "drivers/soc/qcom/dcvs/memlat.ko",
        "drivers/soc/qcom/dcvs/qcom-dcvs.ko",
        "drivers/soc/qcom/dcvs/qcom-pmu-lib.ko",
        "drivers/soc/qcom/debug_symbol.ko",
        "drivers/soc/qcom/eud.ko",
        "drivers/soc/qcom/fsa4480-i2c.ko",
        "drivers/soc/qcom/gic_intr_routing.ko",
        "drivers/soc/qcom/glink_probe.ko",
        "drivers/soc/qcom/hung_task_enh.ko",
        "drivers/soc/qcom/hwkm_v1.ko",
        "drivers/soc/qcom/mdt_loader.ko",
        "drivers/soc/qcom/mem-hooks.ko",
        "drivers/soc/qcom/mem-offline.ko",
        "drivers/soc/qcom/mem_buf/mem_buf.ko",
        "drivers/soc/qcom/mem_buf/mem_buf_dev.ko",
        "drivers/soc/qcom/memory_dump_v2.ko",
        "drivers/soc/qcom/memshare/heap_mem_ext_v01.ko",
        "drivers/soc/qcom/memshare/msm_memshare.ko",
        "drivers/soc/qcom/minidump.ko",
        "drivers/soc/qcom/msm_performance.ko",
        "drivers/soc/qcom/panel_event_notifier.ko",
        "drivers/soc/qcom/pdr_interface.ko",
        "drivers/soc/qcom/qcom_cpu_vendor_hooks.ko",
        "drivers/soc/qcom/qcom_logbuf_boot_log.ko",
        "drivers/soc/qcom/qcom_logbuf_vendor_hooks.ko",
        "drivers/soc/qcom/qcom_ramdump.ko",
        "drivers/soc/qcom/qcom_rpmh.ko",
        "drivers/soc/qcom/qcom_soc_wdt.ko",
        "drivers/soc/qcom/qcom_stats.ko",
        "drivers/soc/qcom/qcom_va_minidump.ko",
        "drivers/soc/qcom/qcom_wdt_core.ko",
        "drivers/soc/qcom/qfprom-sys.ko",
        "drivers/soc/qcom/qmi_helpers.ko",
        "drivers/soc/qcom/rpm_master_stat.ko",
        "drivers/soc/qcom/rpmhpd.ko",
        "drivers/soc/qcom/rq_stats.ko",
        "drivers/soc/qcom/secure_buffer.ko",
        "drivers/soc/qcom/smem.ko",
        "drivers/soc/qcom/smp2p.ko",
        "drivers/soc/qcom/smp2p_sleepstate.ko",
        "drivers/soc/qcom/smsm.ko",
        "drivers/soc/qcom/socinfo.ko",
        "drivers/soc/qcom/sps/sps_drv.ko",
        "drivers/spi/spi-msm-geni.ko",
        "drivers/spi/spidev.ko",
        "drivers/spmi/spmi-pmic-arb.ko",
        "drivers/spmi/spmi-pmic-arb-debug.ko",
        "drivers/thermal/qcom/bcl_pmic5.ko",
        "drivers/thermal/qcom/bcl_soc.ko",
        "drivers/thermal/qcom/cpu_hotplug.ko",
        "drivers/thermal/qcom/cx_ipeak_cdev.ko",
        "drivers/thermal/qcom/devfreq_vdd_cdev.ko",
        "drivers/thermal/qcom/msm-tsens-driver.ko",
        "drivers/thermal/qcom/qcom-spmi-adc-tm5.ko",
        "drivers/thermal/qcom/qcom-spmi-temp-alarm.ko",
        "drivers/thermal/qcom/qti_cpufreq_cdev.ko",
        "drivers/thermal/qcom/qti_devfreq_cdev.ko",
        "drivers/thermal/qcom/qti_qmi_cdev.ko",
        "drivers/thermal/qcom/qti_qmi_sensor.ko",
        "drivers/thermal/qcom/regulator_cdev.ko",
        "drivers/thermal/qcom/rpm_smd_cooling_device.ko",
        "drivers/thermal/qcom/thermal_pause.ko",
        "drivers/tty/serial/msm_geni_serial.ko",
        "drivers/ufs/host/ufs_qcom.ko",
        "drivers/ufs/host/ufshcd-crypto-qti.ko",
        "drivers/uio/msm_sharedmem/msm_sharedmem.ko",
        "drivers/usb/dwc3/dwc3-msm.ko",
        "drivers/usb/gadget/function/f_fs_ipc_log.ko",
        "drivers/usb/gadget/function/usb_f_ccid.ko",
        "drivers/usb/gadget/function/usb_f_cdev.ko",
        "drivers/usb/gadget/function/usb_f_gsi.ko",
        "drivers/usb/gadget/function/usb_f_qdss.ko",
        "drivers/usb/misc/ehset.ko",
        "drivers/usb/pd/qpnp-pdphy.ko",
        "drivers/usb/pd/usbpd.ko",
        "drivers/usb/phy/phy-generic.ko",
        "drivers/usb/phy/phy-msm-qusb.ko",
        "drivers/usb/phy/phy-msm-qusb-v2.ko",
        "drivers/usb/phy/phy-msm-snps-hs.ko",
        "drivers/usb/phy/phy-msm-ssusb-qmp.ko",
        "drivers/usb/phy/phy-qcom-emu.ko",
        "kernel/msm_sysstats.ko",
        "kernel/sched/walt/sched-walt.ko",
        "kernel/trace/qcom_ipc_logging.ko",
        "net/mac80211/mac80211.ko",
        "net/qrtr/qrtr.ko",
        "net/qrtr/qrtr-smd.ko",
        "net/wireless/cfg80211.ko",
        "sound/usb/snd-usb-audio-qmi.ko",
        #ifdef OPLUS_FEATURE_TP_BASIC
        "drivers/soc/oplus/device_info/device_info.ko",
        "drivers/soc/oplus/dft/common/feedback/kernel_fb.ko",
        "drivers/base/kernelFwUpdate/oplus_bsp_fw_update.ko",
        "drivers/base/touchpanel_notify/oplus_bsp_tp_notify.ko",
        #endif /*OPLUS_FEATURE_TP_BASIC*/
        "drivers/soc/oplus/dft/common/olc/olc.ko",
        "drivers/soc/oplus/multimedia/oplus_mm_kevent.ko",
        "drivers/soc/oplus/multimedia/oplus_mm_kevent_fb.ko",
        "kernel/oplus_cpu/cpufreq_health/oplus_bsp_cpufreq_health.ko",
        "kernel/oplus_cpu/sched/eas_opt/oplus_bsp_eas_opt.ko",
        "kernel/oplus_cpu/sched/sched_assist/oplus_bsp_sched_assist.ko",
        "kernel/oplus_cpu/sched/frame_boost/oplus_bsp_frame_boost.ko",
        "kernel/oplus_cpu/sched/task_cpustats/oplus_bsp_task_cpustats.ko",
        "kernel/oplus_cpu/sched/task_sched/oplus_bsp_task_sched.ko",
        "kernel/oplus_cpu/sched/sched_info/oplus_bsp_schedinfo.ko",
        "drivers/soc/oplus/mdmrst/oplus_mdmrst.ko",
        "mm/mm_osvelte/oplus_bsp_mm_osvelte.ko",
        "kernel/oplus_cpu/uad/cpufreq_uag.ko",
        "kernel/oplus_cpu/uad/ua_cpu_ioctl.ko",
        "kernel/oplus_cpu/oplus_omrg/oplus_bsp_omrg.ko",
        "kernel/oplus_cpu/cpufreq_bouncing/cpufreq_bouncing.ko",
        "drivers/misc/oplus_procs_load/oplus_procs_load.ko",
        "drivers/soc/oplus/storage/common/storage_log/oplus_storage_log.ko",
        "drivers/soc/oplus/storage/common/oplus_uprobe/oplus_uprobe.ko",
    ]

    _blair_consolidate_in_tree_modules = _blair_in_tree_modules + [
        # keep sorted
        "drivers/hwtracing/coresight/coresight-etm4x.ko",
        "drivers/misc/lkdtm/lkdtm.ko",
        "kernel/locking/locktorture.ko",
        "kernel/rcu/rcutorture.ko",
#ifdef OPLUS_KERNEL_STABILITY
#baixue.xie#BSP.Kernel.Stability,2024/01/26 add for sched-walt-debug
#        "kernel/sched/walt/sched-walt-debug.ko",
#endif OPLUS_KERNEL_STABILITY
        "kernel/torture.ko",
        "lib/atomic64_test.ko",
        "lib/test_user_copy.ko",
    ]

    for variant in la_variants:
        if variant == "consolidate":
            mod_list = _blair_consolidate_in_tree_modules
        else:
            mod_list = _blair_in_tree_modules

        define_msm_la(
            msm_target = target_name,
            variant = variant,
            in_tree_module_list = mod_list,
            boot_image_opts = boot_image_opts(
                earlycon_addr = "qcom_geni,0x4c8c000",
                kernel_vendor_cmdline_extras = [
                    # do not sort
                    "console=ttyMSM0,115200n8",
                    "qcom_geni_serial.con_enabled=1",
                    "bootconfig",
                ],
            ),
        )
