# Create your models here.

from django.db import models
from django.core.validators import FileExtensionValidator
#from .validators import validate_is_pdf
from django.utils.translation import ugettext_lazy as _

#class Reports(models.Model):
#    reporttype = models.Charfield(max_length=50)
    
class Cmte_Report_Types_View(models.Model):   
    cmte_id = models.CharField(max_length=9)
    filing_freq = models.CharField(max_length=1, blank=True, null=True)
    form_type = models.CharField(max_length=10)
    report_type = models.CharField(max_length=10)
    rpt_type_desc = models.CharField(max_length=200, blank=True, null=True)
    regular_special_report_ind = models.CharField(max_length=3, blank=True, null=True)
    rpt_type_info = models.CharField(max_length=200, blank=True, null=True)
    rpt_type_order = models.IntegerField(blank=True, null=True)
    cvg_start_date = models.DateField(blank=True, null=True)
    cvg_end_date = models.DateField(blank=True, null=True)
    due_date = models.DateField(blank=True, null=True)

    class Meta:
        unique_together = (('cmte_id', 'form_type','report_type'),)


