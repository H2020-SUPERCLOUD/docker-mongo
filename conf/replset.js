config = {_id: 'monfamily',
    members: [
      {_id: 0, host: 'mon1:27017'},
      {_id: 1, host: 'mon2:27017'},
      {_id: 2, host: 'mon3:27017', arbiterOnly: true},
    ]
  }

rs.initiate(config)
