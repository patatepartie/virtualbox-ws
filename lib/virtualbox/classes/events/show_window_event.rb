module VBox
  class ShowWindowEvent < MachineEvent

    # Attributes

    def win_id
      WebService.send_request(:i_show_window_event_get_win_id, _this)
    end
  end
end
