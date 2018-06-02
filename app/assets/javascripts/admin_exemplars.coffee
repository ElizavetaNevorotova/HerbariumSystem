$(document).on 'change', '.exemplar_kind_family_id', (e) ->
  $.ajax '/exemplar_collections',
    type: 'GET'
    data: { parent_id: e.target.value }