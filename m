Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AC46996F
	for <regressions@lists.linux.dev>; Wed,  3 Apr 2024 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712132269; cv=none; b=Xs1fQfhcc3/qH1rIC0hj44iLw0U8XqC8NjClLN8hgJzC/YnK/iEoLqq8fhLt4RpnKE2w8lKxEHsvDJ0RO77t0ujYP62EcAt+upInrJsqzfbvCvCBDsXA4OBYCrXT9ym2AJB2zLLZaFeL8jcmUStCMtLVZ7yXjt8NWBTE7H4jjE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712132269; c=relaxed/simple;
	bh=WZVLpsgEZyMee2esS1uHXrzyFJR0vhK0SpAjmX1pzA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MstVYEarGHK7/D7yUtNqAFwUqFxPTOGqAr+O2r2SJrb68Z2kvtK2PXBMJZDGzbx7H+BZpvcaPq56cipOHIgKyv9Kexi0yeVG3z1WiO3VV7meEYdP5XpcJglWrpbfjHjjJTGDhH4ftB62Zt1etQRiuDmg8bz+usXVvKER0fJJaKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GIwqZl4V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GIwqZl4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712132267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SdMK7f7rQBNlLOVVhFtlCqSnYbgxL7W9IIMpIkzT6qw=;
	b=GIwqZl4VFSd4Sf/bQk8LUEVd8YJ0t3Eprh4EdphaamPv+U32DULfAaL6yCLbmNy3fWwCrr
	xynNM1FHimHCv4qMxKrrLFvS5qzfQN7Rc3WmwkL7Jq0Xk2F+8zOsedFIhpZes+DKIu1Yqe
	/k9XMg4Wj3kdoXLjCLKco6Ue6Aex78s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-QgwkB8oGPLmoax3m9UYK5g-1; Wed, 03 Apr 2024 04:17:45 -0400
X-MC-Unique: QgwkB8oGPLmoax3m9UYK5g-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a4e9ac44d37so44397866b.0
        for <regressions@lists.linux.dev>; Wed, 03 Apr 2024 01:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712132264; x=1712737064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdMK7f7rQBNlLOVVhFtlCqSnYbgxL7W9IIMpIkzT6qw=;
        b=swZKwHgLE7j55ub2zI6YJnD6BKZbBRi1vHafsCBviV5wwMR+GPBUPHwVp3zXrxFH9i
         R10pqPBMneG0wyWiSJ2Y49uXCEf3ckJ7BTFMxByV68378zHebu67AZhfVKPACF6zf7qC
         DxSSu7oRq1najRtTy/dG4daaHBkObmKDc235eYXA48fiBkhRX1VhRj+/kgQznBAhdEpo
         EyPGzknfNNpPAwnqyq3uC7sBwqYRQf69jKUH3Lf9Wa7aYQXdWAjHVx46jf8+YXfKxakc
         rRnHI7Lg2FPmkqG6H3Ot1AeUaiV7CI2Dv9Y3Ib7IDrcH/OrJ0abgPk5MGSZQfSMfiymx
         kP0w==
X-Forwarded-Encrypted: i=1; AJvYcCWbPRFNm6XMRWof9eXak7/4Kqrdv2N/Mp1BtiGWYJMYelLGfe+zdf5okNLLqceCgdEgzO9hJBBIiwy8w4OOd/roxRTCyClTro+/Xno=
X-Gm-Message-State: AOJu0YzeyWWZ3ZP8cZ+ObzbyP5BCj+uXeIHRVEA1zlT0PwRePbVMBO3y
	flGS/6oZTHzlUyCNxNU/Cl/fVYYgj/rTldILasmfctsScHlGW+dAi7R8KUBCi2PuuY/uYhAI/pU
	zLEA2NmOBeFxiPG2yW2vjnMIhu3TnVhmRaXCc34ecvD9G1u8s6nKFRQVxouQ0
X-Received: by 2002:a17:906:470c:b0:a4e:6957:de24 with SMTP id y12-20020a170906470c00b00a4e6957de24mr1303529ejq.37.1712132264445;
        Wed, 03 Apr 2024 01:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9W+msJ9cw1PLqVvsdlsPE3wNn+yIqe/WBgeUUUFOwvy3JKmF6zlJAQklGl8EXuEy+A1yZ1Q==
X-Received: by 2002:a17:906:470c:b0:a4e:6957:de24 with SMTP id y12-20020a170906470c00b00a4e6957de24mr1303520ejq.37.1712132264063;
        Wed, 03 Apr 2024 01:17:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n10-20020a170906118a00b00a461d2a3374sm7470177eja.47.2024.04.03.01.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 01:17:43 -0700 (PDT)
Message-ID: <0303f5f6-05f8-43c7-8922-11de2550d356@redhat.com>
Date: Wed, 3 Apr 2024 10:17:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpiolib: Fix triggering "kobject: 'gpiochipX' is not
 initialized, yet" kobject_get() errors
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 regressions@lists.linux.dev
References: <20240402164345.14065-1-hdegoede@redhat.com>
 <CAHp75VeJYASFaxwG2yuAdBLn7H5hK1BESP7p+3CzBVmNdCTpwg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeJYASFaxwG2yuAdBLn7H5hK1BESP7p+3CzBVmNdCTpwg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/2/24 6:51 PM, Andy Shevchenko wrote:
> On Tue, Apr 2, 2024 at 7:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> When a gpiochip gets added by loading a module, then another driver may
>> be waiting for that gpiochip to load on the deferred-probe list.
>>
>> If the deferred-probe for the consumer of gpiochip then triggers between
>> the gpiodev_add_to_list_unlocked() calls which makes gpio_device_find()
>> see the chip and the gpiochip_setup_dev() later then gpio_device_find()
>> does a kobject_get() on an uninitialzed kobject since the kobject is
> 
> uninitialized

Bartosz, can you fix this up while merging or do you prefer a v3?


>> initialized by gpiochip_setup_dev() calling device_initialize():
>>
>>  arizona spi-10WM5102:00: cannot find GPIO chip arizona, deferring
>>  arizona spi-10WM5102:00: cannot find GPIO chip arizona, deferring
>>  ------------[ cut here ]------------
>>  kobject: 'gpiochip5' (00000000241466f2): is not initialized, yet kobject_get() is being called.
>>  WARNING: CPU: 3 PID: 42 at lib/kobject.c:640 kobject_get+0x43/0x70
>>  Call Trace:
>>   kobject_get
>>   gpio_device_find
>>   gpiod_find_and_request
>>   gpiod_get
>>   snd_byt_wm5102_mc_probe
>>
>> Not only is the device not initialized yet, but when the gpio-device is
>> added to the list things like the irqchip also have not been initialized
>> yet.
>>
>> So gpio_device_find() should really ignore the gpio-device until
>> gpiochip_add_data_with_key() is fully done. Add a device_is_registered()
>> check to gpio_device_find() to ignore gpio-devices on the list which are
>> not yet fully initialized.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thank you for the review.

Regards,

Hans


