from django.contrib import admin
from .models import Farm   # import your model


@admin.register(Farm)
class FarmAdmin(admin.ModelAdmin):
    list_display = ("id", "name", "location", "livestock_count", "farmer")  # fields to show in list view
    search_fields = ("name", "location", "farmer__name")  # add farmer name if your Farmer model has 'name'
    list_filter = ("location",)  # optional filter sidebar
