Template.chart1.rendered = () ->

    m = [
      80
      80
      80
      80
    ]
    # margins
    w = 1000 - (m[1]) - (m[3])
    # width
    h = 400 - (m[0]) - (m[2])
    # height
    data = [
      3
      6
      2
      7
      5
      2
      0
      3
      8
      9
      2
      5
      9
      3
      6
      3
      6
      2
      7
      5
      2
      1
      3
      8
      9
      2
      5
      9
      2
      7
    ]
    x = d3.scale.linear().domain([
      0
      data.length
    ]).range([
      0
      w
    ])
    y = d3.scale.linear().domain([
      0
      10
    ]).range([
      h
      0
    ])
    line = d3.svg.line().x((d, i) ->
      console.log 'Plotting X value for data point: ' + d + ' using index: ' + i + ' to be at: ' + x(i) + ' using our xScale.'
      x i
    ).y((d) ->
      console.log 'Plotting Y value for data point: ' + d + ' to be at: ' + y(d) + ' using our yScale.'
      y d
    )
    graph = d3.select('#graph').append('svg:svg').attr('width', w + m[1] + m[3]).attr('height', h + m[0] + m[2]).append('svg:g').attr('transform', 'translate(' + m[3] + ',' + m[0] + ')')
    xAxis = d3.svg.axis().scale(x).tickSize(-h).tickSubdivide(true)
    graph.append('svg:g').attr('class', 'x axis').attr('transform', 'translate(0,' + h + ')').call xAxis
    yAxisLeft = d3.svg.axis().scale(y).ticks(4).orient('left')
    graph.append('svg:g').attr('class', 'y axis').attr('transform', 'translate(-25,0)').call yAxisLeft
    graph.append('svg:path').attr 'd', line(data)