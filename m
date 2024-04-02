Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6CB85285
	for <regressions@lists.linux.dev>; Tue,  2 Apr 2024 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065269; cv=none; b=sN4p7dJoEbMkmVfGIkmCDAEpRYxf8dYTiU0XsFnM5ynlIoLtpiNPCqg+ogCb309bk+3qNvBKQSa38runk06qR6e6mnsMmWmAzTCLGu/Vxxzm3rP//n9x/5GTq+9RqhK4YOmOohjJw3hlyqwyqIjpjfj5PF6l8kdMAhr08HTGdjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065269; c=relaxed/simple;
	bh=fSmUEcJkMiaEn5CB8sSP3SxvGvNVpxw0TJkE/LxdJVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrK3Wyr8fqzzOSAfw/bETWNVA47vHJ8rbc+fTjwhoX7S2kVkKZkEwGVtPXrS6fayIOlWtIAsvDyDirg1wTbPJmPU8N5HswCKR0nHzQ7u0YIinMdd4x5vRTrIITZrnYlRglLjWGPf3jjx5kmHwxd16pOB9lixpFXGXlos9TmGFQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HHDsgS1R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HHDsgS1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712065266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1iNybg/HGgjMFLmB8r7gE55WyymvOpYihwbPUaOsCw=;
	b=HHDsgS1R8pmVvw56Fp/wfPlKmtKfrj2TFSt1NlyQjFV6iKWSA0i20BNGPKwA8HQh6T9Pkj
	FwkgnOvvxYTsvdKRZPrm7h8rHJNCgFjq3I4Vgf3/PW/rBRM1dUUQyS2Dgi0bQxUY9dJv2r
	epaHAyu2aQowbsLSqiUaABCSFxJXzCE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-AiXhZCvCNVykygmjovvYOA-1; Tue, 02 Apr 2024 09:41:03 -0400
X-MC-Unique: AiXhZCvCNVykygmjovvYOA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a4943e972d1so610985666b.0
        for <regressions@lists.linux.dev>; Tue, 02 Apr 2024 06:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712065262; x=1712670062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1iNybg/HGgjMFLmB8r7gE55WyymvOpYihwbPUaOsCw=;
        b=SpC/5GVwKRXBb7AiFtE5FtrpB7dLaD+ojnKkF03asHvyibBVxmrL7xjrHbDpXRp8ZK
         v1zz6xcGYUFuXph/kRvnSxb4Xm6glc4fads6g2NqH6QqckRgoqcCR2ZeCTKdTFoOW2xn
         EKBIDvATaeEM6SEQiSpp6xWYAFDKs4nXNWURyBJd4YJa9gmZFDIHMAE7RoyNuznHMHRy
         sjEKndA3f+dr8yLNn/MwYiX+EQN+st2VHwFqrWKCsX5LgqkGDQLTnANySDKku9toQsMO
         9loHYMXl0Ov1Cp9M9QBu2wtpEk84awoE/5xlmHGXWQ4kA+TlK85eOrm0bokYu54JJ9T4
         guLA==
X-Forwarded-Encrypted: i=1; AJvYcCWlz+fnIerhNZU+Ccx3idkF58C0mMGkzxsoh3AM2dOzkYo+rGlYBGEwJgxIWcN1pZ/A1OfWBNTlhQCCla8iNlHRqpWGqUYoyHMb7KE=
X-Gm-Message-State: AOJu0YzHkHAXlPR6ajKM+UALSMRkcsEdnSk4QJP4daOJvI5dBsJjOmzK
	/UrJs5SdZmMkGJTmYJKh3MLkwaFNw737sTc53dIZ4zzvy+0SrnAgHE4ZfHLFP/ygDq0yBKZPDxx
	TAdljvOt0At2RlvwRKLHIW/cQpt8meGcoYXcQlABXImzZNvHP40L8rg6Omi5i
X-Received: by 2002:a17:907:9488:b0:a4e:58f0:922d with SMTP id dm8-20020a170907948800b00a4e58f0922dmr7866368ejc.22.1712065262066;
        Tue, 02 Apr 2024 06:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKDmFGZIoVsSTi0KlJmjjJyKBZ8ifM82H0Bfvo0aF8XA2+r0tQ3lZ/fAvcHNpyQfvO2WGsMg==
X-Received: by 2002:a17:907:9488:b0:a4e:58f0:922d with SMTP id dm8-20020a170907948800b00a4e58f0922dmr7866344ejc.22.1712065261575;
        Tue, 02 Apr 2024 06:41:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w17-20020a170906185100b00a4e9359fbe8sm259504eje.44.2024.04.02.06.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 06:41:01 -0700 (PDT)
Message-ID: <634bbfb6-a5a4-40ae-b89f-5fc50db43d4f@redhat.com>
Date: Tue, 2 Apr 2024 15:41:00 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [6.9 gpiolib regression] gpiolib: triggers: kobject: 'gpiochipX'
 is not, initialized, yet kobject_get() errors
To: Bartosz Golaszewski <brgl@bgdev.pl>, Hans de Goede <hans@hansg.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Andy Shevchenko <andy@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org>
 <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 3/29/24 4:16 PM, Bartosz Golaszewski wrote:
> On Fri, 29 Mar 2024 15:11:21 +0100, Hans de Goede <hans@hansg.org> said:
>> Hi All,
>>
>> I've already tried to fix this, so let me just copy and paste my half finished patch
>> to explain the problem.
>>
>> I was planning on submitting this as a RFC patch at least, but there are also some
>> other new issues with 6.9 on this tablet and I'm not sure how this interacts
>> with those issues and I don't have time to work on this any further this weekend.
>>
>> Anyways below is the patch / bug report.
>>
>> I'm wondering if a better fix would be to add a "ready" flag to gdev
>> and may gpiochip_find ignore not yet ready chips (we need them on
>> the list before they are ready to reserve the GPIO numbers) ?
>>
>> Regards,
>>
>> Hans
>>
> 
> Hi Hans!
> 
> Thanks for the report. I hope I'm not being naive here but would the following
> one-liner work?
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ce94e37bcbee..69f365ccbfd8 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *data,
> 
>  		gc = srcu_dereference(gdev->chip, &gdev->srcu);
> 
> -		if (gc && match(gc, data))
> +		if (device_is_registered(&gdev->dev) && gc && match(gc, data))
>  			return gpio_device_get(gdev);
>  	}
> 
> This would make gpio_device_find() ignore any GPIO device that's not yet
> registered on the GPIO bus which is almost the last step of the registration
> process right before creating the sysfs attributes.

Yes that should work and it has the added advantage that it also waits
for things like the irqchip to be setup before gpio_device_find() will
find the gpio-device.

I cannot trigger the race every boot, but I do hit it quite regularly
and with this change I've done 10 successful consecutive boots, so
I believe that this indeed fixes the race.

I've prepared a patch with this fix now which I'll send out shortly.

As for Andy's suggestion I'm not all that familiar with the RCU stuff,
but I think that if we were to go that route then the device_is_registered()
check should be moved up to above the "guard(srcu)(&gdev->srcu);"
line rather then above the "gc = srcu_deref..." line, since in that
case we are not using the gdev->chip pointer at all if we bail ?

Anyways for now I've just gone with your suggested 1 liner.

Regards,

Hans


p.s.

While looking into this I noticed one other possible problem,
unless gpiochip_add_data_with_key() and gpiolib_dev_init() are
guaranteed to never run at the same time then we may end up calling
gpiochip_setup_dev() twice, once from gpiolib_dev_init() and
once from gpiochip_add_data_with_key() when the 2 race.


