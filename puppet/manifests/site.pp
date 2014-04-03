node default{
  class {
    'app':
      instances       => {
        'app-hello'   => {
          app_content => 'Hello World!',
          port        => '81',
        },
        'app-php'     => {
          app_content => '<?php phpinfo(); ?>',
          is_php      => true,
        }
      }
  }

  firewall { 
  '100 accept 80':
    chain   => 'INPUT',
    action  => 'accept',
    proto   => 'tcp',
    dport   => '80';

  '101 accept 81':
    chain   => 'INPUT',
    action  => 'accept',
    proto   => 'tcp',
    dport   => '81';
  }

}
