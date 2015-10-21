config = {_id: 'monfamily',
    members: [
      {_id: 0, host: 'mon1.containers.dev:27017'},
      {_id: 1, host: 'mon2.containers.dev:27017'},
      {_id: 2, host: 'mon3.containers.dev:27017'},
      {_id: 3, host: 'mon4.containers.dev:27017', arbiterOnly: true},
    ]
  }

rs.initiate(config)
