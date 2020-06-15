
  <% unless current_user.appointments.find_by_event_id(event.id).nil? || event.host == current_user %>
    <%= link_to "I'm going", appointments_path({attendee_id: current_user.id, event_id: event.id, status: true}), method: :post, data: { confirm: 'Are you sure?' } %>
  <% end %>
