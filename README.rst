==============
glance-formula
==============

Install and configure the openstack glance services.

This formula requires the `keystone formula <https://github.com/saltstack-formulas/keystone-formula>`_ and
`mysql-formula <https://github.com/saltstack-formulas/mysql-formula>`_.

.. note::

    See the full `Openstack Install Documentation
    <http://docs.openstack.org/>`_.

Available states
================

.. contents::
    :local:

``glance``
----------

Installs all components: client, server (including api and registry services), config files, and keystone user

``glance.db``
-------------

Sets up the mysql database for glance.

Requires `mysql-formula <https://github.com/saltstack-formulas/mysql-formula>`_.

``glance.keystone``
-------------------

Adds glance user and service (with endpoints) to keystone.

Requires the `keystone formula <https://github.com/saltstack-formulas/keystone-formula>`_.

``glance.server``
-----------------

Installs the glance services, sets up config files, and starts the services.

``glance.client``
-----------------

Install the glance client.

``glance.config.api``
---------------------

Manage the glance api configuration file.

``glance.config.registry``
--------------------------

Manage the glance registry configuration file.
