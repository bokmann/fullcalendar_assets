$(document).ready ->	
  $('#calendar').fullCalendar
    editable: true,        
    header:
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    defaultView: 'month',
    height: 500,
    slotMinutes: 15,
      
    eventSources: [{
      url: '/events',
      ignoreTimezone: false
    }],
      
    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5"
  
    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(event);

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent(event);

      
updateEvent = (the_event) ->
  $.update "/events/" + the_event.id,
    event: 
      title: the_event.title,
      starts_at: "" + the_event.start,
      ends_at: "" + the_event.end,
      description: the_event.description
