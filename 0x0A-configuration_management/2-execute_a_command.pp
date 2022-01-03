
exec { 'killmenow':
  path    => 'killmenow',
  command => 'pkill -9 -f killmenow' 
}