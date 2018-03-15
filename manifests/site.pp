## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}
# here is the line 32

node 'test40.local' {
  # This is where you can declare classes for all nodes.
  # Example  
  class { 'java8': 
    java_se       => 'jdk',
    # version_major => '162',
    # version_minor => 'b12',
    # hash          => '0da788060d494f5095bf8624735fa2f1',
  }
  include maven
  include jenkins
}

node 'pclient.local' {

  class { 'java8':
    java_se       => 'jdk',
  }

  class { 'sonarqube':
  }
}

node 'jenkins.local' {

  java::oracle { 'jdk8':
    ensure        => 'present',
    version_major => '8u162',
    version_minor => 'b12',
    url_hash      => '0da788060d494f5095bf8624735fa2f1',
    java_se       => 'jdk',
  }

  include maven
  include jenkins
}                         
