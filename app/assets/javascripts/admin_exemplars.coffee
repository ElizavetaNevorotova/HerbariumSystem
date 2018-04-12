$(document).on 'change', '.exemplar_kind_family_id', (e)->
  $.ajax '/exemplar_collections',
    type: 'GET'
    dataType: 'json'
    data: { parent_id: e.target.value }
    success: (data, textStatus, jqXHR) ->
      console.log('aaa')
      for name, value in data['collection']
        $('.exemplar_kind_clan_id').find('select').append($('<option>').text(name).attr('value', value))