module VBox
  class MachineDataChangedEvent < MachineEvent

    # Attributes

    def temporary
      WebService.send_request(:i_machine_data_changed_event_get_temporary, _this)
    end
  end
end