document.addEventListener "DOMContentLoaded", ->
  source_elem = document.getElementById('graphviz_file')
  return unless source_elem

  source_data = source_elem.innerText
  target = document.getElementById('graphviz_render')

  image = Viz source_data,
    format: 'png-image-element'
  target.appendChild image
