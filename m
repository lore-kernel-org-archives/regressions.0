Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D577A10EF
	for <regressions@lists.linux.dev>; Mon, 19 Dec 2022 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671444017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2L77LTJlh+TWM02KCjT0QXgg2/YWKeH8U+AND45/ryw=;
	b=SJlQX8+QsO/LnCiTLLsx6wUjk8SRK/trUsPZxk3p4d+NU1rAQe5FG6SRkiUaQTphLMKMWu
	RbD4jVwA9468OrJS+J923jkUANFwev2u2VF779Dv6revTEFfmdrawNwyEgpjN+4YecJKFu
	OwmUeAa2ZTRmlhNigzcbkusDUzIRI9U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-184-RYC9cKIkMHave1POJ3FLPw-1; Mon, 19 Dec 2022 05:00:14 -0500
X-MC-Unique: RYC9cKIkMHave1POJ3FLPw-1
Received: by mail-ed1-f70.google.com with SMTP id w20-20020a056402269400b004700a51c202so6199369edd.13
        for <regressions@lists.linux.dev>; Mon, 19 Dec 2022 02:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2L77LTJlh+TWM02KCjT0QXgg2/YWKeH8U+AND45/ryw=;
        b=G/UlECYRxX3pbuJ3SwMgwidQCZoxO8o2Om6IJHyL1tFrJNQOFWyL0p1CBxCAh8e5bl
         TC/aUltNsIHKOLJV3i51TAm7EIaT0pNA9VLWE3aiBlvrYia6qclfLD6pkaRR7s0qlrJE
         eP13qijoQDqhWKvPuOzPh68Kg+Z+tUSElJAiQ6urhZJyHgSdgjitHMTK0O150jvAazUt
         HCWOWezgRHBynAhqqFPuVV7+F00t4hY4j4hVikpasKf5Hyoeu0AgXjUtDaTrbmlaubkN
         VgSQ5D9pVwrBHdc/OewfOf0F2hkeztXlCbQKLAFHONI6NPZv9hc1UfzYYqhfr0K2TgJo
         1WgQ==
X-Gm-Message-State: AFqh2koDBp8oiHyD+cDM20vBZ5dIN0RuCWPVx54h+DmBxyKz7LVv36kr
	VjkMQhyQ80m1gTYs4yrm2wp9FXUP++gPTeg667pBD7xi9fQYwHcaepI9zj8/d90/Noyl5Jt82Wp
	Go4JuKqu9FoK34kOEksgrTy8=
X-Received: by 2002:aa7:cc89:0:b0:468:3d69:ac81 with SMTP id p9-20020aa7cc89000000b004683d69ac81mr15809201edt.29.1671444013035;
        Mon, 19 Dec 2022 02:00:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtoTXdXcGAP5qPieS3+Mkh48xVqSW7mBaIUsc6jBbyxolMG0ylpPbaR5izWlBEeOOcmfbMl7Q==
X-Received: by 2002:aa7:cc89:0:b0:468:3d69:ac81 with SMTP id p9-20020aa7cc89000000b004683d69ac81mr15809191edt.29.1671444012868;
        Mon, 19 Dec 2022 02:00:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g7-20020aa7d1c7000000b0046aba24985esm4146635edp.91.2022.12.19.02.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 02:00:12 -0800 (PST)
Message-ID: <572159b3-a1a4-8735-d435-ea574c07851f@redhat.com>
Date: Mon, 19 Dec 2022 11:00:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: =?UTF-8?Q?Re=3a_=5bregression=5d_Bug=c2=a0216818_-_The_microphone_m?=
 =?UTF-8?Q?ute_led_not_working_after_linux_6?=
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: sonic82003@gmail.com, plum <plumerlis@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
References: <bf52f4c5-5cca-26d7-7fb2-ac8ecb5b24c5@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bf52f4c5-5cca-26d7-7fb2-ac8ecb5b24c5@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/19/22 10:17, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it by
> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216818 :
> 
>>  sonic82003@gmail.com 2022-12-18 08:52:32 UTC
>>
>> The mic mute led of my ThinkPad X1 Carbon Gen 9 doesn't work anymore after updating linux to version 6.
>> I can still turn it on by  running 
>>
>> echo 1 > /sys/class/leds/platform::micmute/brightness
>>
>> With linux-lts it still works fine.
> 
> See the ticket for more details.
> 
> Note, I found a similar report that (despite my attempts to prevent
> things like this from happening) fell through the cracks here:
> https://bugzilla.kernel.org/show_bug.cgi?id=216355
> 
>>  plum 2022-08-13 02:11:01 UTC
>>
>> I upgrade to kernel 5.19.1 but found my thinkpad x1 carbon 2021's mute led stop working.
>>
>> Function is okay but LED won't light up.
>>
>> Back to kernel 5.18 and it's normal and working again.
>>
>> Fedora 36 64 bit 
>> Gnome-shell 42
> 
> From a quick research it looks to me like this is an issue for the
> sounds maintainers, as the LED itself apparently works. If that is
> something for the platform people instead please speak up.

Thanks for bringing this up, we recently hit this in Fedora too
and we have a fix/workaround there. Let me copy and paste what
I just added to bko216355 :

This is caused by a behavior change of the kernel code controlling the LED to only turn on the LED when all inputs, including e.g. the jack mic input are turned off in the alsa-mixer settings.

But most userspace code only turns the mic which it is actually using on/off when you hit the mic-mute hotkey.

Also see: https://bugzilla.redhat.com/show_bug.cgi?id=2134824

Which is the same bug.

There is a set of fixes available in the form of an alsa-ucm update which tells the kernel to ignore the state of the jack mic input restoring the old behavior:

https://git.alsa-project.org/?p=alsa-ucm-conf.git;a=commitdiff;h=79a8ec44d3dcf097f4a4492c506cbcf338324175
https://git.alsa-project.org/?p=alsa-ucm-conf.git;a=commitdiff;h=9ce9ddb4a84fb467602b716575ea1d8f2bab0c39

Regards,

Hans


