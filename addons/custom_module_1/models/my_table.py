# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from dateutil.relativedelta import relativedelta

from odoo import api, fields, models, _


class my_table(models.Model):
    _name = 'my.table'

    name = fields.Char('x-S3')
    name2 = fields.Char('Y-S3')
    name3 = fields.Char('Z-S3')
