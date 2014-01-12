global = this

global.setupVisitsIndex = ->

  $(".delete-visit-btn").on "click", ->
    $row = $(this).closest("tr")
    patient_id = $row.attr("data-item-id")
    visit_id = $row.attr("data-visit-id")
    $.ajax
      type: "Delete"
      data:
        patient_id: patient_id
        id: visit_id
      url: Routes.patient_visits_path(patient_id, visit_id)
      dataType: "JSON"
      success: ->
        delete_rows($row)
      error: ->
        console.log("Deletion failed")


  delete_rows = ($row) ->
    $row.children().each ->
      $(this).animate({'padding-top' : 0, 'padding-bottom' : 0 }, 'slow')
      $(this).wrapInner("<div />").children("div").slideUp('slow', ->
        $row.remove()
      )
