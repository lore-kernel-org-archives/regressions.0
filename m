Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5610017F518
	for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 15:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718204791; cv=none; b=Ro1nuA6L+ewIl2zG+IuQytbBJHwyAoyh/a/E6oV0oTdeZm+umD6bLvuLwXraTYreITT1Jb8marS/GFB8ILaNUL/NdRoTgUE1t0FJ9RA9OkRhnn1KAEuHsXUuORdRO1Kph2hqF7hAGS1b9y0pyGApDvar9qaSe3YB8kT/rd5hiF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718204791; c=relaxed/simple;
	bh=5we2Y+XLd2wlSst2G2Z5MVRqPclSs0U0AlWjCzGlW8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2iyTjCdxsNEsr5LvjcHRXNlHRMBuvZwQ0aIuaKvZDrL+G4UJH/FVrc+xoLAiW9lkjqn6Vd4bSzPqT+jewHphCMxb9WlYZuxfYzwwg7MQ+IIZrojc41IBggmzTX+fGmqrIg+X7qwB/U5PEbNongIuz5wU0AjTE5FLcvShWO1vf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YsL5KPd/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YsL5KPd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718204787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FlBK1lXnYxOaBm1ZmKIaxQIxNCgBUHLdXZz//Al24TM=;
	b=YsL5KPd/Xca4Y2O09D9/gb/z55PDrZdInr8nIN6uZHUOtZRT9vhlg5qGJLJqVANXh3Kn66
	nM4T4gaucL2FBQQ2Hbg11OwqlENVWGjrpZ1D0xl/vrwzwVzbqUwcpfaYuCCzGu3rDrdvuP
	xOU9nArYQ2/7/OCrOSr3HEQaBnmBw3g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-Z-Mxd22-MGG5C8KQ7ikjow-1; Wed, 12 Jun 2024 11:06:26 -0400
X-MC-Unique: Z-Mxd22-MGG5C8KQ7ikjow-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a6ef7afd90aso265160166b.2
        for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 08:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718204784; x=1718809584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FlBK1lXnYxOaBm1ZmKIaxQIxNCgBUHLdXZz//Al24TM=;
        b=RZ0QWt+z6z7f2lMuj8hwCwu5tUGZiSgbTjUHpauogEOeMOpaX2oR35YAFNYHQnRf5f
         46mxR2OXikaqb2ON5PuUjJtpSEZirsshVNJaXOaKS+5SG9KNTaTNz9epGgWLjc95Oy7y
         uTa10Kj4BbRVJ44ZFFZ1WRSHCVC6ViUfxMbpBxWvHIv01b+spbe9szBrjWpp0QEwuIqs
         Ki4CWIO8Pz0NWs0AS17VSMej0ccXsC/+0SliGHpQh3Xssh6PSEzGgCZHOGvcVZ+41bqg
         2yCMgIbLh+RrQcNZqqMWTo23dMjlvo4eYZ5fb27ACCVrDLx4Y25Df5cz1Vs7Mc66lNMk
         X1Eg==
X-Gm-Message-State: AOJu0Yxhvci3+KxwxIBhoJPRqOoXoJiwNbVI82npcCGB/clTwdH8PGy7
	W7e8A6OL4V43MnIQJdTvUnGd6ayoYVjly0IJ2H8BW4+jNuF4ddnYIDsUMXsxxblqllGVTv9Tz2I
	dOUBqvaccBQHFzv67tJxy4Kt/iXzR3jDA8jGPx4YPUtSBQKUA1IrF0o/FPFES81yha3YNvuCJ2w
	pdy0Z3yF1yfCOe9h7yCvGSWvdSdiQpOtCsaer1Pa/Sx2x8
X-Received: by 2002:a17:906:aada:b0:a6e:fb3a:b661 with SMTP id a640c23a62f3a-a6f4801bf90mr130411166b.68.1718204784516;
        Wed, 12 Jun 2024 08:06:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZj7wtMYwmm76l1Osgqf1B08FFo8UEjlk5nAOAYuayJKax/ySRZ3zRrQyCyy0eRvo53EdKMg==
X-Received: by 2002:a17:906:aada:b0:a6e:fb3a:b661 with SMTP id a640c23a62f3a-a6f4801bf90mr130408266b.68.1718204784012;
        Wed, 12 Jun 2024 08:06:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0e47b8f7sm555729566b.31.2024.06.12.08.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 08:06:23 -0700 (PDT)
Message-ID: <0cdc9042-2cad-48d4-8eb6-0732cf9e7dfa@redhat.com>
Date: Wed, 12 Jun 2024 17:06:22 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: class: Revert: "If no default trigger is given,
 make hw_control trigger the default trigger"
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-leds@vger.kernel.org, Genes Lists <lists@sapience.com>,
 =?UTF-8?Q?Johannes_W=C3=BCller?= <johanneswueller@gmail.com>,
 stable@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
References: <20240607101847.23037-1-hdegoede@redhat.com>
 <6ebdcaca-c95a-48bc-b1ca-51cc1d7a86a5@lunn.ch>
 <7a73693e-87b4-4161-a058-4e36f50e1376@redhat.com>
 <5e93d4ea-0247-4803-9c0e-215d009fb9d3@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5e93d4ea-0247-4803-9c0e-215d009fb9d3@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/12/24 4:58 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
> 
> Hans, from your point of view, how fast should we try to mainline this
> revert? I got the impression that you want it merged there rather sooner
> than later -- and that sounds appropriate to me.

There are at least 2 separate bug reports from 6.9 users who are gettinhg
stuck tasks which should be fixed by this, so yes this should go upstream
soon.

> So should we maybe ask
> Linus on Friday to pick this up from here? Ideally of course with an ACK
> from Pavel or Lee.

Indeed having an ack from Lee or Pavel here would be great!

Regards,

Hans




> 
> Ciao, Thorsten
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> #regzbot poke
> 
> On 07.06.24 17:26, Hans de Goede wrote:
>> On 6/7/24 2:03 PM, Andrew Lunn wrote:
>>> On Fri, Jun 07, 2024 at 12:18:47PM +0200, Hans de Goede wrote:
>>>> Commit 66601a29bb23 ("leds: class: If no default trigger is given, make
>>>> hw_control trigger the default trigger") causes ledtrig-netdev to get
>>>> set as default trigger on various network LEDs.
>>>>
>>>> This causes users to hit a pre-existing AB-BA deadlock issue in
>>>> ledtrig-netdev between the LED-trigger locks and the rtnl mutex,
>>>> resulting in hung tasks in kernels >= 6.9.
>>>>
>>>> Solving the deadlock is non trivial, so for now revert the change to
>>>> set the hw_control trigger as default trigger, so that ledtrig-netdev
>>>> no longer gets activated automatically for various network LEDs.
>>>>
>>>> The netdev trigger is not needed because the network LEDs are usually under
>>>> hw-control and the netdev trigger tries to leave things that way so setting
>>>> it as the active trigger for the LED class device is a no-op.
>>>>
>>>> Fixes: 66601a29bb23 ("leds: class: If no default trigger is given, make hw_control trigger the default trigger")
>>>> Reported-by: Genes Lists <lists@sapience.com>
>>>> Closes: https://lore.kernel.org/all/9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com/
>>>> Reported-by: "Johannes Wüller" <johanneswueller@gmail.com>
>>>> Closes: https://lore.kernel.org/lkml/e441605c-eaf2-4c2d-872b-d8e541f4cf60@gmail.com/
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> I'm not sure i agree with the Closes: All this does is make it less
>>> likely to deadlock. The deadlock is still there.
>>
>> I agree that the deadlock which is the root-cause is still there. But
>> with this revert ledtrig-netdev will no longer get activated by default.
>>
>> So now the only way to actually get the code-paths which may deadlock
>> to run is by the user or some script explicitly activating the netdev
>> trigger by writing "netdev" to the trigger sysfs file for a LED classdev.
>> So most users will now no longer hit this, including the reporters of
>> these bugs.
>>
>> The auto-activating of the netdev trigger is what is causing these
>> reports when users are running kernels >= 6.9 . 
>> So now the only way to actually get the code-paths which may deadlock
>> to run is by the user or some script explicitly activating the netdev
>> trigger by writing "netdev" to the trigger sysfs file for a LED classdev.
>> So most users will now no longer hit this, including the reporters of
>> these bugs.
>>
>> The auto-activating of the netdev trigger is what is causing these
>> reports when users are running kernels >= 6.9 .
>>
>>> But:
>>>
>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 

