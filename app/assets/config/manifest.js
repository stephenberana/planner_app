//= link_tree ../images
//= link_directory ../stylesheets .css

$('.task-completed-cb:checkbox').change ->
    $.ajax
        url: '/tasks/' + @value + '/set_completed'
        type: 'PUT'
        data: { completed: $(this.Attr('checked'))}
        success: -> alert('Task completed!')