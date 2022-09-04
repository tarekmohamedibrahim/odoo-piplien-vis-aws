# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from dateutil.relativedelta import relativedelta

from odoo import api, fields, models, _


class my_table(models.Model):
    _name = 'my.table'

    name = fields.Char('1111')
    name2 = fields.Char('2222')
    name3 = fields.Char('3333')
