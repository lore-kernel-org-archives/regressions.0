Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBAA62F
	for <regressions@lists.linux.dev>; Sat, 18 Feb 2023 10:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676717230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcEw9uxKBAie7cQ4FiqtVONnWVk+5H4SBHGJOKQGQEM=;
	b=d4G+1pnRHGsI4XH8m6atwlyEUfQ2lwzlb3w31RbXZyYh8pI5JB5j7V6iw0Y7P/Ic52Ddlb
	tTuSTg4TE2TtMisHh4i/UQsOsuYFh5yfz5+vEMjx46heu+s4HZ1lcsCcB7XKQjMWfk6WRm
	WZnfsh7Pj5jeRCdMMhCs6oXrRizS6l0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-iuNk4VovMuuC9ZDAOU351g-1; Sat, 18 Feb 2023 05:47:09 -0500
X-MC-Unique: iuNk4VovMuuC9ZDAOU351g-1
Received: by mail-ed1-f69.google.com with SMTP id i28-20020a0564020f1c00b004aab4319cedso415377eda.2
        for <regressions@lists.linux.dev>; Sat, 18 Feb 2023 02:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcEw9uxKBAie7cQ4FiqtVONnWVk+5H4SBHGJOKQGQEM=;
        b=mR89Cken7QK63vlMwRWYWBz1bZ9wzXOo9w64x0i76/E4Nkwd8KXAVY+nOdkCPfBnCK
         UNQe/aeVKGT4GaErJS5NK6R+linvNEkL7awTxf7PISGX4t96hhojlTzY/vxS7CdjTNbM
         UiQkcr2TZr690C5tOcBvsBWrqs82cq5ksU+ngzfKZGgwq5seUFvvdPjosW6XpMhTKs9W
         3CRm3Spetdc9ijiNnkJRtRnRbc5L/7trldolSkRVheLMwDv21Bl5AT9KAqOL/cqSTX6M
         seBfeVdKr5T3cvVcAocbvcX4lZgrYOp+xKnUaT1sjKLXhNuBoBnmL+wevn9QX6vhUuHI
         0DDA==
X-Gm-Message-State: AO0yUKW4lS+4iOTNNKW6sZnTGvCcNFy8euzVOBpBsmg19V3hL2bvoZ1Z
	PGa0pj7C3ylU1HeDBFtoV4vk/9A9U+oBZMdSyh/yCyyY1g87aklpeDaUUB0B6ju7ogeWWtc6JHR
	uFQhFDRDoW7qbqkzQlIUFVDg=
X-Received: by 2002:a50:ef0b:0:b0:4aa:a5b2:b26b with SMTP id m11-20020a50ef0b000000b004aaa5b2b26bmr3720735eds.29.1676717228163;
        Sat, 18 Feb 2023 02:47:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/XLwvqBVenRY0DqyPbTo9JYxat8aABi0wXC96V1lHuKZ7Me4qqTInY42npHACnNHlb3gT82w==
X-Received: by 2002:a50:ef0b:0:b0:4aa:a5b2:b26b with SMTP id m11-20020a50ef0b000000b004aaa5b2b26bmr3720725eds.29.1676717227874;
        Sat, 18 Feb 2023 02:47:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 26-20020a508e5a000000b004ad7abf007asm2462524edx.74.2023.02.18.02.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 02:47:07 -0800 (PST)
Message-ID: <16d7757c-46f0-1cf6-f6f9-bf6681fbd255@redhat.com>
Date: Sat, 18 Feb 2023 11:47:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] platform/x86: nvidia-wmi-ec-backlight: Add force
 module parameter
To: Daniel Dadap <ddadap@nvidia.com>
Cc: Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Luke McCarthy <mail@lukehmcc.com>, platform-driver-x86@vger.kernel.org,
 regressions@lists.linux.dev
References: <20230217144208.5721-1-hdegoede@redhat.com>
 <Y++fL1Wzy+6CYBYj@ddadap-lakeline.nvidia.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y++fL1Wzy+6CYBYj@ddadap-lakeline.nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/17/23 16:37, Daniel Dadap wrote:
> Thanks, Hans. The new commit message sounds more appropriate.
> 
> Reviewed-by: Daniel Dadap <ddadap@nvidia.com>

Thanks. I have pushed this to pdx86/for-next now so that it
will go to Linus during the merge-window and on to the
stable kernel series from there.

Regards,

Hans




> 
> On Fri, Feb 17, 2023 at 03:42:08PM +0100, Hans de Goede wrote:
>> On some Lenovo Legion models, the backlight might be driven by either
>> one of nvidia_wmi_ec_backlight or amdgpu_bl0 at different times.
>>
>> When the Nvidia WMI EC backlight interface reports the backlight is
>> controlled by the EC, the current backlight handling only registers
>> nvidia_wmi_ec_backlight (and registers no other backlight interfaces).
>>
>> This hides (never registers) the amdgpu_bl0 interface, where as prior
>> to 6.1.4 users would have both nvidia_wmi_ec_backlight and amdgpu_bl0
>> and could work around things in userspace.
>>
>> Add a force module parameter which can be used with acpi_backlight=native
>> to restore the old behavior as a workound (for now) by passing:
>>
>> "acpi_backlight=native nvidia-wmi-ec-backlight.force=1"
>>
>> Fixes: 8d0ca287fd8c ("platform/x86: nvidia-wmi-ec-backlight: Use acpi_video_get_backlight_type()")
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217026
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Reword commit message
>> ---
>>  drivers/platform/x86/nvidia-wmi-ec-backlight.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>> index baccdf658538..1b572c90c76e 100644
>> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>> @@ -12,6 +12,10 @@
>>  #include <linux/wmi.h>
>>  #include <acpi/video.h>
>>  
>> +static bool force;
>> +module_param(force, bool, 0444);
>> +MODULE_PARM_DESC(force, "Force loading (disable acpi_backlight=xxx checks");
>> +
>>  /**
>>   * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
>>   * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
>> @@ -91,7 +95,7 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
>>  	int ret;
>>  
>>  	/* drivers/acpi/video_detect.c also checks that SOURCE == EC */
>> -	if (acpi_video_get_backlight_type() != acpi_backlight_nvidia_wmi_ec)
>> +	if (!force && acpi_video_get_backlight_type() != acpi_backlight_nvidia_wmi_ec)
>>  		return -ENODEV;
>>  
>>  	/*
>> -- 
>> 2.39.1
>>
> 

