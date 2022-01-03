# kill the process
exec { 'killmenow':
  path    => 'alx-system_engineering-devops/0x0A-configuration_management',
  creates => 'alx-system_engineering-devops/0x0A-configuration_management',
  command => 'pkill -9 -f killmenow' 
}