module VBox
  class StorageDeviceChangedEvent < Event

    # Attributes

    def storage_device
      WebService.send_request(:i_storage_device_changed_event_get_storage_device, _this)
    end

    def removed
      WebService.send_request(:i_storage_device_changed_event_get_removed, _this)
    end
  end
end
