# Generated by Django 2.2.6 on 2020-06-08 13:44

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Nongsaro_sickdatas',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sick_data', models.CharField(max_length=300)),
                ('dumy_data', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Pestidata',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pesti_name', models.CharField(max_length=100)),
                ('pesti_name2', models.CharField(max_length=100)),
                ('dis_name', models.CharField(max_length=100)),
                ('pestiuse', models.CharField(max_length=100)),
                ('pesti_img', models.CharField(max_length=100)),
                ('toxic_name', models.CharField(max_length=100)),
                ('dilutunit', models.CharField(max_length=100)),
                ('usesuit_time', models.CharField(max_length=100)),
                ('use_num', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Sickdata',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('crop_name', models.CharField(max_length=100)),
                ('sick_kind', models.CharField(max_length=100)),
                ('sick_name', models.CharField(max_length=100)),
                ('sick_img', models.CharField(max_length=100)),
                ('prevent_method', models.TextField()),
                ('sick_symptoms', models.TextField()),
                ('sick_condition', models.TextField()),
                ('pesti_datas', models.ManyToManyField(related_name='pesti_data', to='pages.Pestidata')),
            ],
        ),
        migrations.CreateModel(
            name='Nongsaro',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('crop_kind', models.CharField(max_length=100)),
                ('crop_state', models.CharField(max_length=100)),
                ('sick_kind', models.CharField(max_length=100)),
                ('crop_name', models.CharField(max_length=100)),
                ('sick_name', models.CharField(max_length=100)),
                ('sick_datas', models.ManyToManyField(related_name='nongsaro_sickdata', to='pages.Nongsaro_sickdatas')),
            ],
        ),
    ]
