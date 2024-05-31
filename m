Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5866C158A02
	for <regressions@lists.linux.dev>; Fri, 31 May 2024 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717161081; cv=none; b=ek5tEpAfEkEsQmCoSdRjh+Ot29mEn7kZKGddzvF7hH0D7CS7JpO76mOK+EHsu5d5EdOZe5WnZ7wxZVd4SCtbqgMRN5cCNr3bT68qFWgF9MF0mG/jj6Ah7MsxupVErSMoxa6dI2Jr/9FRBCRzIXP0mOQq9XWywuboyNhfZNUCRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717161081; c=relaxed/simple;
	bh=c3XdctI4qUJlJfz5ADlPYS/uW7u8v1FB/rMrC5LHkds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NrwiuCWEEhskOvJxletd0G9xQZ0arc7p1NZ9z76NgJpBuvKzr+tp4zlBVHp+27v9+xUnWVGFx2FAfTmSZ6JYiNuFEDWLHa82f2qfMPQk0FKZIIkt5wLXY5AX58ZfFnei0dsWGXIx0Yj5soHjufN2V6/nLdc4TsffKaaMM0myvGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VsWS0fjg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VsWS0fjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717161079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Px56jy9il/IYwkPayrMIkBySKFiPmogiNfHl+A5skDU=;
	b=VsWS0fjgShR/OgeiVF+dMjd90ZryTNSZExTJ4NSq8TxMDgVxS3cAiWxGZXOO0+Ok7Yq+Tn
	1EIb1gWN6zB8rCNAVelz8oKoOz+bd6c0iAKhu79IojSY1eSQcF62NH4hrTcKt1yYRKhDod
	5edjcaiqtQhzKibW4s3F4ZPX3crxOnQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590--H6fxrkjOYiKhRvE04vuHA-1; Fri, 31 May 2024 09:11:18 -0400
X-MC-Unique: -H6fxrkjOYiKhRvE04vuHA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a688f6df640so19458766b.1
        for <regressions@lists.linux.dev>; Fri, 31 May 2024 06:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717161077; x=1717765877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Px56jy9il/IYwkPayrMIkBySKFiPmogiNfHl+A5skDU=;
        b=pVXf25492eFLme0E5nD0Z4cGJ+CHnY7Xw4hypgTGg9v4wh7CFZiP05vw5fGcLIveDe
         JFaT1r48KtwMtNvcI3nk1Bas27voTQ8+DtouLbEG9Kd3458vVDuXOBE7eVumNrfCNFZv
         d0gSCZwQCwqc9qMbRLsGmuvvEihMS7QhKUaDMcAScbK9oGYCB73pfRvtMqkVpXC8xO1m
         Pvf82MbSij5yIAfYdddOtvZDn5N5V3k2HuCiwJHC87tWmJajNrAHKrLMRDHB+8ie65RR
         ign5sToFB+hB2sNm47Kb+xKPtGvQN9f28gz99FMVeIAVpLbHNEJyjTMZ2ETKaWLPuOHD
         6TyQ==
X-Gm-Message-State: AOJu0YxAPRz66SLCx8vdrR/Iqpa/QoMNxTMsO41WOu4X5cWORlaoQIQV
	v99lCsBygqHAs78waUTBwH2MTtRghRWuFyUfuvrjVafXVqY/712VMyk6j6IccLhR6LT0ZiOIEvx
	DQ+oD+MM7DkSjGHrI3SneltscWhOgZb/FGnJFe8DaQu4wRix+JzBLSZMFRQSG
X-Received: by 2002:a17:906:7ac7:b0:a68:13d8:3d00 with SMTP id a640c23a62f3a-a6821f4e6d6mr150501366b.56.1717161076957;
        Fri, 31 May 2024 06:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFApD+njPNUgEgZoAQ0f63kVWmn84bRFqq8Ou8YZKepQ4ySoVE/xIS7SnQ8n3/uLsbJXQVPHg==
X-Received: by 2002:a17:906:7ac7:b0:a68:13d8:3d00 with SMTP id a640c23a62f3a-a6821f4e6d6mr150497366b.56.1717161076394;
        Fri, 31 May 2024 06:11:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73f9b84sm85694766b.64.2024.05.31.06.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 06:11:16 -0700 (PDT)
Message-ID: <2a6045e2-031a-46b6-9943-eaae21d85e37@redhat.com>
Date: Fri, 31 May 2024 15:11:15 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linux LEDs <linux-leds@vger.kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, johanneswueller@gmail.com,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Genes Lists <lists@sapience.com>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
 <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/31/24 2:54 PM, Andrew Lunn wrote:
>> I actually have been looking at a ledtrig-netdev lockdep warning yesterday
>> which I believe is the same thing. I'll include the lockdep trace below.
>>
>> According to lockdep there indeed is a ABBA (ish) cyclic deadlock with
>> the rtnl mutex vs led-triggers related locks. I believe that this problem
>> may be a pre-existing problem but this now actually gets hit in kernels >=
>> 6.9 because of commit 66601a29bb23 ("leds: class: If no default trigger is
>> given, make hw_control trigger the default trigger"). Before that commit
>> the "netdev" trigger would not be bound / set as phy LEDs trigger by default.
>>
>> +Cc Heiner Kallweit who authored that commit.
>>
>> The netdev trigger typically is not needed because the PHY LEDs are typically
>> under hw-control and the netdev trigger even tries to leave things that way
>> so setting it as the active trigger for the LED class device is basically
>> a no-op. I guess the goal of that commit is correctly have the triggers
>> file content reflect that the LED is controlled by a netdev and to allow
>> changing the hw-control mode without the user first needing to set netdev
>> as trigger before being able to change the mode.
> 
> It was not the intention that this triggers is loaded for all
> systems.

Right note there are really 2 separate issues (or 1 issue
and one question) here:

1. The locking issue which this commit has exposed (but existed before)

2. If it is desirable to load / activate ledtrig-netdev by default on
   quite a lot of machines where it does not really gain us anything ?

For now I think we should focus on 1.

Still about 2:

> It should only be those that actually have LEDs which can be
> controlled:
> 
> drivers/net/ethernet/realtek/r8169_leds.c:	led_cdev->hw_control_trigger = "netdev";
> drivers/net/ethernet/realtek/r8169_leds.c:	led_cdev->hw_control_trigger = "netdev";
> drivers/net/ethernet/intel/igc/igc_leds.c:	led_cdev->hw_control_trigger = "netdev";
> drivers/net/dsa/qca/qca8k-leds.c:		port_led->cdev.hw_control_trigger = "netdev";
> drivers/net/phy/phy_device.c:		cdev->hw_control_trigger = "netdev";

Well those drivers combined, esp. with the generic phy_device in there
does mean that the ledtrig-netdev module now gets loaded on a whole lot
of x86 machines where before it would not. On one hand those machines
are plenty powerful typically, so what is one more module. OTOH I don't
think many users if any at all want to change the hwcontrol mode for
those LEDs...

> Reverting this patch does seem like a good way forward, but i would
> also like to give Heiner a little bit of time to see if he has a quick
> real fix.

Ack.

Regards,

Hans



