Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642511527A0
	for <regressions@lists.linux.dev>; Sat,  1 Jun 2024 20:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717272363; cv=none; b=FlRIxeZP48CuDOQXsHfA2oF8+DdQu8SS+qwbHPTE+lQtENURVpNUYXGLyEBI+qzlmtMUEwh90MnX3WYPG5OPT1sJqzs1I6kaUVq8gpqTy+8i+ynnauAC2lecpjHhMrbXoT9cWQKmhyCvgfFnPpCn9kI96fH/m+rt4gA77/VUIW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717272363; c=relaxed/simple;
	bh=bb1Eh6sYxp0wiXwMLIgdauY1kNYKOWwZ0sTYj+x+3i4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DFLvHNB8k85W+1TETeF6bcwQ8s92FF+gh4zCFftx3XIYnKL/OjjKErvabw7/CGwUMKVInkZOngx6dSh99Ygf1A3hbPrkE2aITX4TxMjorRNU/PdFnoZTfEs20Plvkpo6sEbzN3QmQd5//eHIoDvIJomSUIaogaD3kXOELSHbQT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HAn9nG5G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HAn9nG5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717272360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dzxohq/lDop4X+G5bOl0wtRNygcADEx/hc58/q+dn7c=;
	b=HAn9nG5GpH0Sr3CNB6equ/aC/Z/5wvlUdhPQTGDq8wMDPXlxd7hw+3UFs4qV+Tkz1DlVg4
	N0jW5RP4sUl4dvyM1m3HcbtoelJ0ViJ5j/Z18uJ7KJGHP4lOS8GGXSy451MG4FhdTrb1oI
	gJrY59dkmoSvUoxLPmSyU/pOEyNkfmo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-cgfysXGrM3-kCSprTVhnJA-1; Sat, 01 Jun 2024 16:05:57 -0400
X-MC-Unique: cgfysXGrM3-kCSprTVhnJA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a68c70ab413so35075066b.1
        for <regressions@lists.linux.dev>; Sat, 01 Jun 2024 13:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717272356; x=1717877156;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzxohq/lDop4X+G5bOl0wtRNygcADEx/hc58/q+dn7c=;
        b=iyc2eP3yblXEUgRbF6Hom/XRkZMqBoqbEvOjp6cpwlzcSgEoafCHfKDUqLHoY1emLl
         bW4ZV2QPDb16rVFM0bsXoQaSulwrz31Lcv4yXDJOXQxnn94N9YCUtARR0Toj2xzc+uNS
         8wVQdm2aSn0LpfCngYu4Kl6U0l6ZXiYAHtoWihJ0m2kgIHfT1whi7Hhd39Q31MBXxUh0
         48cFmTF9o7EFu/eIgL4YJHOJbrrcuRRKhYA2a9ypz6Q6654v4tLkyVk75PRPVyzdXHKq
         HPGwnyZS2pVBIfpNbVGkdtsLV5IG4R22ZO5jkXFkDRkaJiEnZp4CTFx8XlNgk0+JfIU9
         QatA==
X-Gm-Message-State: AOJu0Yy0YbbPXg8LrCeryWaH8ExRFas+1mu+zXam6hlDdgKj4ss9UDdo
	oeYHyumilX0AqjTsHdsaHj32yfGEwhyOk1Dzx5HbvFM798umW+tOZJz+2VHfL5xkw5K2ljWa+Cx
	0voubbYs1KHqBYNM9omwtnZpLR6x2WPgqPFZqGSqDfwJVKGSaUJe7ShDGKAQpv5u/W7XFH3ij/4
	cWW06aVdMvb3Fe+Zq9Xwnyd+OgBy64zz4J+7YotHSd2p62ac0=
X-Received: by 2002:a17:906:5a8c:b0:a68:e834:e9bb with SMTP id a640c23a62f3a-a68e834ff24mr25612466b.35.1717272355910;
        Sat, 01 Jun 2024 13:05:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKBjI4khq4cOxujM+nFtg2T6bx0NqxvdpUtcJC72aKWj08HWBrV5C0F9kUUcWZtUreaiC0mQ==
X-Received: by 2002:a17:906:5a8c:b0:a68:e834:e9bb with SMTP id a640c23a62f3a-a68e834ff24mr25609766b.35.1717272355320;
        Sat, 01 Jun 2024 13:05:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6848423bc9sm210815066b.147.2024.06.01.13.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jun 2024 13:05:54 -0700 (PDT)
Message-ID: <d7c555cc-d07c-4f22-9636-9ebb44165e1d@redhat.com>
Date: Sat, 1 Jun 2024 22:05:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
From: Hans de Goede <hdegoede@redhat.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linux LEDs <linux-leds@vger.kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, johanneswueller@gmail.com,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Genes Lists <lists@sapience.com>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
 <d8f8b1b2-1ffd-435a-8bed-b1a05d16a270@redhat.com>
In-Reply-To: <d8f8b1b2-1ffd-435a-8bed-b1a05d16a270@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 5/31/24 12:22 PM, Hans de Goede wrote:
> Hi,
> 
> On 5/31/24 11:50 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 5/31/24 10:39 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> [adding the LED folks and the regressions list to the list of recipients]
>>>
>>> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
>>> for once, to make this easily accessible to everyone.
>>>
>>> Lee, Pavel, could you look into below regression report please? Thread
>>> starts here:
>>> https://lore.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com/
>>>
>>> Another report with somewhat similar symptom can be found here:
>>> https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/
>>>
>>> See also Russell's analysis of that report below (many many thx for
>>> that, much appreciated Russel!).
>>>
>>> To my untrained eyes all of this sounds a lot like we still have a 6.9
>>> regression related to the LED code somewhere. Reminder, we had earlier
>>> trouble, but that was avoided through other measures:
>>>
>>> * 3d913719df14c2 ("wifi: iwlwifi: Use request_module_nowait") /
>>> https://lore.kernel.org/lkml/30f757e3-73c5-5473-c1f8-328bab98fd7d@candelatech.com/
>>>
>>> * c04d1b9ecce565 ("igc: Fix LED-related deadlock on driver unbind") /
>>> https://lore.kernel.org/all/ZhRD3cOtz5i-61PB@mail-itl/
>>>
>>> * 19fa4f2a85d777 ("r8169: fix LED-related deadlock on module removal")
>>>
>>> That iwlwifi commit even calls it self "work around". The developer that
>>> submitted it bisected the problem to a LED merge, but sadly that was the
>>> end of it. :-/
>>
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
>>
>> But there is a price to this, besides the locking problem this also
>> causes the ledtrig-netdev module to load on pretty much everyones
>> systems (when build as a module) even though 99.999% of our users
>> likely does not need this at all...
>>
>> Given this price and the troubles this is causing I think it might be best
>> to revert 66601a29bb23. There might still be a locking issue when setting
>> the trigger to netdev manually (I'll check and follow up) but this should
>> fix the regression users are hitting since typically users do not set
>> the trigger manually.
> 
> Ok, I can confirm that the lockdep warning is gone for me with 66601a29bb23
> reverted. Unfortunately it does still happen after a "modprobe ledtrig_netdev"
> (to add it to the list of available triggers) and then setting the trigger
> for /sys/class/leds/enp42s0-0::lan to netdev manually.
> 
> Still reverting 66601a29bb23 should avoid the problem getting triggered
> and this would seem like a safe fix especially for the 6.9 series and
> then the necessary time can be taken to fix the actual underlying locking
> issue which 66601a29bb23 exposes.

I recently wrote a new input-events LED trigger:
https://lore.kernel.org/linux-leds/20240531135910.168965-2-hdegoede@redhat.com/

and I just found out this has a very similar deadlock problem. It seems
there it a generic problem with LEDs or LED triggers getting registered
by subsystems while holding a global lock from that subsystem vs
the activate / deactivate method of the trigger calling functions of that
same subsystem which require that same global lock.

I came up with a fix but that just fixed the activate() path leaving
a similar deadlock in place in the deactivate path:

https://lore.kernel.org/linux-leds/20240601195528.48308-1-hdegoede@redhat.com/
https://lore.kernel.org/linux-leds/20240601195528.48308-3-hdegoede@redhat.com/

So this seems to be a non trivial problem to solve. For the new input-events
trigger I plan to solve this by switching to a single input_handler which will
be registered at module_init() time instead of having a handler per LED and
registering that handler at activate() time.

But I have no idea how to solve this for the netdev trigger I just wanted
to share my experience with the input-events trigger in case it is useful.

Regards,

Hans


