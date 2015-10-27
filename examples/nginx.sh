package 'nginx' $(
  action install
)

service 'nginx' $(
  action enable install
)
