from rest_framework import serializers
from .models import CommitteeInfo, Committee


class CommitteeInfoSerializer(serializers.ModelSerializer):
        class Meta:
            model = CommitteeInfo
            fields=('committeeid', 'committeename', 'street1', 'street2', 'city',
                    'state','zipcode', 'treasurerprefix', 'treasurerfirstname', 'text',
                    'treasurermiddlename', 'treasurerlastname', 'treasurersuffix',
                    'created_at','is_submitted' )
            read_only_fields = ('created_at', 'updated_at')

        # Methods to save the model objects to the database

        def create(self, validated_data):
            return CommitteeInfo.objects.create(**validated_data)


        def update(self, instance, validated_data):
            instance.committeeid = validated_data.get('committeeid', instance.committeeid)
            instance.committeename = validated_data.get('committeename', instance.committeename)
            instance.street1 = validated_data.get('street1', instance.street1)
            instance.street2 = validated_data.get('street2', instance.street2)
            instance.city = validated_data.get('city', instance.city)
            instance.state = validated_data.get('state', instance.state)
            instance.text = validated_data.get('text', instance.text)            
            instance.reason = validated_data.get('text', instance.text)
            instance.zipcode = validated_data.get('zipcode', instance.zipcode)
            instance.treasurerlastname = validated_data.get('treasurerlastname', instance.treasurerlastname)
            instance.treasurerfirstname = validated_data.get('treasurerfirstname', instance.treasurerfirstname)
            instance.treasurermiddlename = validated_data.get('treasurermiddlename', instance.treasurermiddletname)
            instance.treasurerprefix = validated_data.get('treasurerprefix', instance.treasurerprefix)
            instance.treasurersuffix = validated_data.get('treasurersuffix', instance.treasurersuffix)
            is_submitted.text = validated_data.get('is_submitted', instance.is_submitted)            
            instance.save()
            return instance



class CommitteeSerializer(serializers.ModelSerializer):
        class Meta:
            model = Committee
            fields=('committeeid', 'committeename', 'street1', 'street2', 'city',
                    'state','zipcode', 'treasurerprefix', 'treasurerfirstname',
                    'treasurermiddlename', 'treasurerlastname', 'treasurersuffix',
                    'created_at' )
            read_only_fields = ('created_at', 'updated_at')

        # Methods to save the model objects to the database

        def create(self, validated_data):
            return Committee.objects.create(**validated_data)


        def update(self, instance, validated_data):
            instance.committeeid = validated_data.get('committeeid', instance.committeeid)
            instance.committeename = validated_data.get('committeename', instance.committeename)
            instance.street1 = validated_data.get('street1', instance.street1)
            instance.street2 = validated_data.get('street2', instance.street2)
            instance.city = validated_data.get('city', instance.city)
            instance.state = validated_data.get('state', instance.state)
            instance.zipcode = validated_data.get('zipcode', instance.zipcode)
            instance.treasurerlastname = validated_data.get('treasurerlastname', instance.treasurerlastname)
            instance.treasurerfirstname = validated_data.get('treasurerfirstname', instance.treasurerfirstname)
            instance.treasurermiddlename = validated_data.get('treasurermiddlename', instance.treasurermiddletname)
            instance.treasurerprefix = validated_data.get('treasurerprefix', instance.treasurerprefix)
            instance.treasurersuffix = validated_data.get('treasurersuffix', instance.treasurersuffix) 
            instance.save()
            return instance


            






            
