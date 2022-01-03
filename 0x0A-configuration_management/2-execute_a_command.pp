# kill the process
exec { 'killmenow':
  path    => 'killmenow',
  command => 'pkill -9 -f killmenow' 
}