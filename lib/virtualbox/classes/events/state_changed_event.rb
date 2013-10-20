module VBox
  class StateChangedEvent < Event

    # Attributes

    def state
      WebService.send_request(:i_state_changed_event_get_state, _this)
    end
  end
end
