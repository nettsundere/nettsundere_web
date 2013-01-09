class StateEventSelectInput < SimpleForm::Inputs::CollectionInput
  def input
    state = state_from_state_event_name(attribute_name)
    transitions = transitions_for(state)
    human_state_name = current_state_name(state)

    options = input_options.merge(:include_blank => human_state_name)
    @builder.collection_select(
      attribute_name,
      transitions,
      :event,
      :human_to_name,
      options,
      input_html_options
    )
  end

  private
    def state_from_state_event_name(state_event_name)
      state_event_name[0..-7]
    end

    def current_state_name(state)
      object.send("human_#{state}_name")
    end

    def transitions_for(state)
      object.send("#{state}_transitions")
    end
end
