Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1B55388
	for <regressions@lists.linux.dev>; Sun,  6 Aug 2023 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691335160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhfpOREeEhVXZ8cxJasLZg5Zec9o2IwuXj0XyZAWd8M=;
	b=DNMp0kbv2Pr4HccbsxOuUCccXXVVYfTAzEGn/RGXEjiQ6Tp4HVlA8lTbE2bVVL/XO+JYaI
	UHT/pvtI0Jh7XP8Lb5ezKaGaO5QTcPUPlIlR13XKiCGjlOnwaZf6/eVc8gDXAvqioeORYk
	P27YNaq95asIG1ivyZo9XYy6JFnjkuY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-Q7VMMcR4NXOEH-HBuj_6DA-1; Sun, 06 Aug 2023 11:19:19 -0400
X-MC-Unique: Q7VMMcR4NXOEH-HBuj_6DA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993831c639aso246161866b.2
        for <regressions@lists.linux.dev>; Sun, 06 Aug 2023 08:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691335158; x=1691939958;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AhfpOREeEhVXZ8cxJasLZg5Zec9o2IwuXj0XyZAWd8M=;
        b=PDcwhXBNYkXWoi/aCV7jfgD/5IvNwFoUixXA2wtrGCRIX8wXISjZd64Qs7Cz/vsT2Y
         TjNvNeEL4S3XuAb/5X60Px9zU8aWM2QlKOiB1yaB6mTHZcKJQBrn2jOtRY13cSh5q9W3
         ijHlqa2rVke1FX7pBDhX/UnBQvTNMiJ55I10hBNZA3AiwhOFYwOblmXe089/sHzd3Z1E
         9RNUhWLQqRad/I60iVvVjZqEzCRfqXY1m8CZOUdnPUABYEIZjvtZbMFYxjTyCiMu+CBH
         xfD28p2vKijlJ7cgeO5EFJpI0cQFvdAoss4RmHXorKHF1/r6YBn55R9Ge7pX3oZHw5rp
         1Plg==
X-Gm-Message-State: AOJu0Yz35CBR5j2NwxrCtgwkntamTMjTt/W8+guK4uva7w4qI+bVWhmy
	D1mDvy0zCzEocdGR7jzZ00+8PkxAzJjMdThLILQLzGK1xqgqp5oTEIowtgZa4VFVerPCB91AQ59
	aruuLIZI9NlZuOGN3mDCMfEE=
X-Received: by 2002:a17:907:2cd4:b0:970:c9f:2db6 with SMTP id hg20-20020a1709072cd400b009700c9f2db6mr5334967ejc.63.1691335158315;
        Sun, 06 Aug 2023 08:19:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHilB2YSqkhczP2772KNrt8XqRol0iVm73acAAU4kmFWAZNv16hlcyPfHrwapBfuOIbfu/Tsg==
X-Received: by 2002:a17:907:2cd4:b0:970:c9f:2db6 with SMTP id hg20-20020a1709072cd400b009700c9f2db6mr5334956ejc.63.1691335157934;
        Sun, 06 Aug 2023 08:19:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gl23-20020a170906e0d700b009894b476310sm3993690ejb.163.2023.08.06.08.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Aug 2023 08:19:17 -0700 (PDT)
Message-ID: <37523499-5226-dcca-3b7c-87b92815bd12@redhat.com>
Date: Sun, 6 Aug 2023 17:19:16 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Fwd: 6.5 - 6.4.7 Regression : ASUS UM5302TA Keyboard don't work
From: Hans de Goede <hdegoede@redhat.com>
To: August Wikerfors <git@augustwikerfors.se>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Linux Input Devices <linux-input@vger.kernel.org>,
 ACPI Asus <acpi4asus-user@lists.sourceforge.net>,
 Linux x86 Platform Drivers <platform-driver-x86@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Guilhem Lettron <guilhem@lettron.fr>
References: <bdc6cb4d-a853-72b2-b132-989b64740ad9@gmail.com>
 <8ee87fe1-684f-ad59-21c7-4401a4e70bee@leemhuis.info>
 <b7df9a02-3b81-4f8c-aeba-222c298180d4@augustwikerfors.se>
 <cc9e37b4-b5cb-fd4d-84b8-5b824afe710a@redhat.com>
In-Reply-To: <cc9e37b4-b5cb-fd4d-84b8-5b824afe710a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/5/23 15:09, Hans de Goede wrote:
> Hi,
> 
> On 8/4/23 17:26, August Wikerfors wrote:
>> On 2023-07-30 06:49, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> Lo!
>>>
>>> On 30.07.23 04:41, Bagas Sanjaya wrote:
>>>>
>>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>>>
>>>>> On a kernel 6.4.5 and less, the keyboard is working fine.
>>>>>
>>>>> Beginning with 6.5 rc1 and 6.4.7 any key don't respond.
>>>
>>> That is a AMD Ryzen Laptop. And if that really started from
>>> v6.4.6..v6.4.7 then I guess there is a decent chance that this is caused
>>> by ```ACPI: resource: Remove "Zen" specific match and quirks``` from
>>> Mario. Hence adding him to the list of recipients.
>>
>> Confirmed now, see https://bugzilla.kernel.org/show_bug.cgi?id=217726#c9
>>
>> #regzbot introduced: a9c4a912b7dc7ff922d4b9261160c001558f9755
> 
> We just have received 2 bug reports for Fedora which I believe are also
> this issue (not confirmed yet):
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2229165
> https://bugzilla.redhat.com/show_bug.cgi?id=2229317
> 
> I'm going to create a Fedora 6.4.y test-kernel with a9c4a912b7dc7ff
> reverted.
> 
> IMHO we really should revert a9c4a912b7dc7ff upstream,
> at least for the 6.4.y series where it seems to be doing
> more harm then good.
> 
> And propably also for 6.5-rc# for now until we figure out
> a better solution.

Testing has shown that reverting also fixes the 2 Fedora bugs.

I have submitted a revert of a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks") upstream now, because I believe that that is the best way to fix the regressions caused by this (until we figure out a better way to deal with the kbd interrupt trigger-type issues):

https://lore.kernel.org/linux-acpi/20230806151453.10690-1-hdegoede@redhat.com/

Regards,

Hans

