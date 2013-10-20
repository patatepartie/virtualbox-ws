module VBox
  class Host < Base

    # Attributes

    def dvd_drives
      dvd_drives = WebService.send_request(:i_host_get_dvd_drives, _this)
      dvd_drives.to_a.map do |dvd_drive|
        Medium.new(dvd_drive)
      end
    end

    def floppy_drives
      floppy_drives = WebService.send_request(:i_host_get_floppy_drives, _this)
      floppy_drives.to_a.map do |floppy_drive|
        Medium.new(floppy_drive)
      end
    end

    def usb_devices
      usb_devices = WebService.send_request(:i_host_get_usb_devices, _this)
      usb_devices.to_a.map do |usb_device|
        HostUSBDevice.new(usb_device)
      end
    end

    def usb_devices_filters
      usb_device_filters = WebService.send_request(:i_host_get_usb_device_filters, _this)
      usb_device_filters.to_a.map do |usb_device_filter|
        HostUSBDeviceFilter.new(usb_device_filter)
      end
    end

    def network_interfaces
      network_interfaces = WebService.send_request(:i_host_get_network_interfaces, _this)
      network_interfaces.to_a.map do |network_interface|
        HostNetworkInterface.new(network_interface)
      end
    end

    def processor_count
      WebService.send_request(:i_host_get_processor_count, _this)
    end

    def processor_online_count
      WebService.send_request(:i_host_get_processor_online_count, _this)
    end

    def processor_core_count
      WebService.send_request(:i_host_get_processor_core_count, _this)
    end

    def memory_size
      WebService.send_request(:i_host_get_memory_size, _this)
    end

    def memory_available
      WebService.send_request(:i_host_get_memory_available, _this)
    end

    def operating_system
      WebService.send_request(:i_host_get_operating_system, _this)
    end

    def os_version
      WebService.send_request(:i_host_get_os_version, _this)
    end

    def utc_time
      WebService.send_request(:i_host_get_utc_time, _this)
    end

    def acceleration_3d_available
      WebService.send_request(:i_host_get_acceleration_3d_available, _this)
    end

    # Methods

    def create_host_only_network_interface
      progress, host_only_network_interface = WebService.send_request(:i_host_create_host_only_network_interface,
                                                                            _this)
      [Progress.new(progress),
       HostNetworkInterface.new(host_only_network_interface[:host_interface])]
    end

    def create_usb_device_filter(args={})
      ensure_hash args
      usb_device_filter = WebService.send_request(:i_host_create_usb_device_filter, _this.merge(args))
      HostUSBDeviceFilter.new(usb_device_filter)
    end

    def find_host_dvd_drive(args={})
      ensure_hash args
      host_dvd_drive = WebService.send_request(:i_host_find_host_dvd_drive, _this.merge(args))
      Medium.new(host_dvd_drive)
    end

    def find_host_floppy_drive(args={})
      ensure_hash args
      host_floppy_drive = WebService.send_request(:i_host_find_host_floppy_drive, _this.merge(args))
      Medium.new(host_floppy_drive)
    end

    def find_host_network_interface_by_id(args={})
      ensure_hash args
      host_network_interface = WebService.send_request(:i_host_find_host_network_interface_by_id, _this.merge(args))
      HostNetworkInterface.new(host_network_interface)
    end

    def find_host_network_interfaces_of_type(args={})
      ensure_hash args
      host_network_interfaces = WebService.send_request(:i_host_find_host_network_interfaces_of_type, _this.merge(args))
      host_network_interfaces.map do |host_network_interface|
        HostNetworkInterface.new(host_network_interface)
      end
    end

    def find_usb_device_by_address(args={})
      ensure_hash args
      usb_device = WebService.send_request(:i_host_find_usb_device_by_address, _this.merge(args))
      HostUSBDevice.new(usb_device)
    end

    def find_usb_device_by_id(args={})
      ensure_hash args
      usb_device = WebService.send_request(:i_host_find_usb_device_by_id, _this.merge(args))
      HostUSBDevice.new(usb_device)
    end

    def generate_mac_address
      WebService.send_request(:i_host_generate_mac_address, _this)
    end

    def get_processor_cpuid_leaf(args={})
      ensure_hash args
      WebService.send_request(:i_host_get_processor_cpuid_leaf, _this.merge(args))
    end

    def get_processor_description(args={})
      ensure_hash args
      WebService.send_request(:i_host_get_processor_description, _this.merge(args))
    end

    def get_processor_feature(args={})
      ensure_hash args
      WebService.send_request(:i_host_get_processor_feature, _this.merge(args))
    end

    def get_processor_speed(args={})
      ensure_hash args
      WebService.send_request(:i_host_get_processor_speed, _this.merge(args))
    end

    def insert_usb_device_filter(args={})
      ensure_hash args
      args.referize! :filter
      WebService.send_request(:i_host_insert_usb_device_filter, _this.merge(args))
    end

    def remove_host_only_network_interface(args={})
      ensure_hash args
      WebService.send_request(:i_host_remove_host_only_network_interface, _this.merge(args))
    end

    def remove_usb_device_filter(args={})
      ensure_hash args
      WebService.send_request(:i_host_remove_usb_device_filter, _this.merge(args))
    end
  end
end
