# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.
{
    'name' : 'my module',
    'version' : '0.1',
    'sequence': 185,
    'category': 'Human Resources/Fleet',
    'website' : 'https://www.odoo.com/page/fleet',
    'summary' : 'Test creating new module for Odoo 14',
    'description' : """ """,
    'depends': [
        'base',
    ],
    'data': [
        'security/ir.model.access.csv',
        'views/my_table_view.xml',
    ],

    'demo': [],

    'installable': True,
    'application': True,
    'license': 'LGPL-3',
}
