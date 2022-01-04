# terminate the process using pkill
exec { 'killmenow':
  provider  => 'shell',
  command   => 'pkill -15 killmenow',
}