# terminate the process using pkill
exec { 'killmenow':
  command  => 'pkill -15 killmenow',
  provider => 'shell',
}