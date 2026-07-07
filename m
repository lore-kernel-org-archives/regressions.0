Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ED83932C9
	for <regressions@lists.linux.dev>; Tue,  7 Jul 2026 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416266; cv=none; b=f/rkkIqHnoRR/Yq+1PsHIyn52Gv27MKpKOkUI+Et1jJCxITsvNCtvdC7t5JFWbBWL4MZ6sUMkYSMzIO+cNcQA+VvSUnlGYwffuZhgY153wySWVP7xLBxIyMJZUnMCdLZO+rqOfH5d5qAiOMAb6BDWDeX67eZ+DQS2Po+4RwqbdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416266; c=relaxed/simple;
	bh=ZVtJ4KbMUVJNK2/wadQxyFFqB6KL45hueHArSxTZRWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=coWcKqjIgUAlfx7Ssl4XPfJSNkVxCpzIc5HY0XS0AQuVzt6mXV0O/dzeghwy4j1TbmmvHjdBIDUbDUVNrER1KlUXJWdIL31jzA5HbBfjfqFs9lUYAC1VIEnrcvgyK2G13CLj9vSpfkUhdqqyszo1IRKpTDVF0EKplhcz2TctwTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qLFOGbia; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLFOGbia"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cace91f112so33736555ad.0
        for <regressions@lists.linux.dev>; Tue, 07 Jul 2026 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783416264; x=1784021064; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZMpYi0CMP8lLmjFdusnU2dVbBcxO0l5zFZNeINryrw=;
        b=qLFOGbiaX4786QLGeVQTD50kxVK7QtuUtpsNbaUB7DI08kJNQLdUHK8Qlli2qwgUeL
         lnFDUmluXKxsVHIpYViqkaqrA6bsQfnvaGXxHU1W3jvk82as9jtnePGaXVMjyQ01faS9
         ZBGdUUgThaKDgg1Ls0F5hP7TYbOJRRZ/3ebHIyU7stnyzl+yBSEtJo4jhTh69E3XR5a0
         J6xOZoj6DpFzm5SivlBR/PhKq1z4rz9uMkOReDBM+tRplVQdZ0bIF9UkhU5MiNPjaTyr
         OTUmiVTlqDDRnVgriCzeVB7wYUUILsLgb43N4pWTgH1prZS4aALaAnCfIuapfjYk8UJ7
         hmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416264; x=1784021064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZMpYi0CMP8lLmjFdusnU2dVbBcxO0l5zFZNeINryrw=;
        b=UXDnUQvnj8gxRBCPUF80BqAtMXjSffIx4kXWH+nxZ/q1rLzjGZV4s0dAYV8NVfO31u
         Vmst89MP5TKrf4UA2nl8lENbGM1MDBrr2Q6yQZqGfG+MKSz2XyqPLobajrF9G/8E8Mi4
         ebP3EsdjSpQHxrAsFrdBkQAMWWMpmJ7KV7YFsn4yKL34WnfcXQT6EtrHOyyk8PWPdB+Q
         ZTmAhzkM+HHoWQDWwRuRQLbYx1K39aLU0TUL5AuNiHg/CQg371H0JZgUCFF5GJZKY0Rr
         xanbONFKyuhBFCuKG0L4oWC8HrVYgiluiiTCQfynUntNBcSrYcr3q6VbIgDZ5rETDq+L
         CxGA==
X-Forwarded-Encrypted: i=1; AHgh+RpprEnDM2DQ9EDPwuS2RWBhnggmryblu1iFvcKpdwMfMENAaCkWMSxpkd1RgAjpwQT2pU4tW43Ok3j9zw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2xwA1nmWLPJZChLkW4FQScrr1zPOVcsNWmGSlOOZDEaHt++SX
	kI24Yd26u9rShYMc/UjQ+0lvDDZ/OmpOXpuyvoF38SWmrTRDO+j+R+io
X-Gm-Gg: AfdE7cmyYpgG7UgAGf05m6nV8qvO0xzGVxUn1pU7bLtrOAyF7L1JEJOOeBUJDtNkedZ
	EBj9s63MJda78iuARZepY8W9jbScdWavrRGlftEh6EaC8iK/zwBVdBQ/nF5hcBerA/mLWZvRRy6
	H17ioB4UeSq/9Im7P1EnSpzqeqIiPnSt5Aly5Fhh8SMVsSbWpEua8A9JGLyhqkgDkSGrDzweKa2
	A12vioPYXOZuk9q4gq9g475gTbKrtbsUsOB3JfDBzkvR8RF5CIZhC589M7ISfeC6G6X0UlVHqlq
	6dIMVtcLdrXsAfDNsyuh5zQwDD7M2uOmVaJXlJVThUz6gnZNMwbHOmsvHZ+55yXeLnmcypKcBTr
	doCgN4OKfYbDlMfanCjU5ystlpObUG1ujt9ms7sxrQ5mndvaULcrSZyFljp6n+RKaEQg+OJrjcG
	JqR7svo7PIYbfqI/lhDTem6A==
X-Received: by 2002:a17:902:d4c1:b0:2c6:9f6a:9f6f with SMTP id d9443c01a7336-2ccbed27822mr42950775ad.28.1783416264276;
        Tue, 07 Jul 2026 02:24:24 -0700 (PDT)
Received: from [192.168.89.2] ([175.235.236.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9a3sm8473225ad.13.2026.07.07.02.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 02:24:23 -0700 (PDT)
Message-ID: <6c25fe1e-6a57-42d2-8be1-efd41892ae72@gmail.com>
Date: Tue, 7 Jul 2026 18:24:21 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 221721] New: prom21-xhci does not allow to use USB keyboard
 in plymouth
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: bugzilla-daemon@kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 linux-usb@vger.kernel.org, marx.tomasz@gmail.com
References: <bug-221721-208809@https.bugzilla.kernel.org/>
 <328d3158-8086-4de7-a96e-7c2a514e3018@leemhuis.info>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <328d3158-8086-4de7-a96e-7c2a514e3018@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

One of the very first thing discussed during the review process of
prom21-xhci commits was about correct loading of the module during
initramfs stage.

It was mainly about writing correct dependencies in Kconfig for USB host
controller build.



config USB_XHCI_PCI_PROM21
	tristate
	depends on USB_XHCI_PCI
	default USB_XHCI_PCI if SENSORS_PROM21_XHCI != n
	select AUXILIARY_BUS



Maybe it was not enough? Can you perhaps check whether both xhci_pci and
xhci_pci_prom21 are loaded at the plymouth stage?

I also do use OPAL LUKS with dracut, but my setup uses TPM2 to auto
unlock it. I will check the manual keyboard input during dracut
initramfs LUKS unlock stage.


Sincerely,
Jihong Min


On 7/7/26 17:03, Thorsten Leemhuis wrote:
> [Switching to email, hope this will work]
> 
> Jihong Min, it seems a recent change of yours is causing trouble. See
> below for details.
> 
> Side note, but not my area of expertise, so feel free to ignore this, as
> I might be sending people in the wrong direction and it's just a hunch
> anyway: wonder if this is another of those situations where the driver
> needs to be in the initramfs. Tomasz, did you have SENSORS_PROM21_XHCI=m
> when things were broken? And if yes: have you tried if adding it to the
> initramfs or setting SENSORS_PROM21_XHCI=y helps?
> 
> Ciao, Thorsten
> 
> On 7/4/26 17:41, bugzilla-daemon@kernel.org wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=221721
>>
>>             Bug ID: 221721
>>            Summary: prom21-xhci does not allow to use USB keyboard in
>>                     plymouth
>>            Product: Drivers
>>            Version: 2.5
>>           Hardware: AMD
>>                 OS: Linux
>>             Status: NEW
>>           Severity: low
>>           Priority: P3
>>          Component: USB
>>           Assignee: drivers_usb@kernel-bugs.kernel.org
>>           Reporter: marx.tomasz@gmail.com
>>         Regression: No
>>
>> Created attachment 310416
>>   --> https://bugzilla.kernel.org/attachment.cgi?id=310416&action=edit
>> output of "sudo lsusb -v"
>>
>> Hi,
>>
>> After update to 7.2-rc1 I was unable to type in LUKS password in plymouth. I
>> tried both of my USB keyboards, but both of them just briefly lit up the LEDs
>> and then seemed to turn off. Bisection pointed to
>>
>> commit 364f4a55c661641c02c86a849f0608d8fc3c0006
>> Merge: e4b4bfaa5090 1c2b66a7d725
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Mon Jun 22 12:09:47 2026 -0700
>>
>>     Merge tag 'usb-7.2-rc1' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
>>
>> and then
>>
>> commit 9e896b4a48c4e815956d28961448041c80ad5a19 (HEAD)
>> Author: Jihong Min <hurryman2212@gmail.com>
>> Date:   Tue May 19 09:07:31 2026 +0900
>>
>>     usb: xhci-pci: add AMD Promontory 21 PCI glue
>>
>> After setting SENSORS_PROM21_XHCI=n and compiling kernel again, I'm able to use
>> my PC normally.
>>
>> CPU: AMD Ryzen 9 9900X
>> Motherboard: X870I AORUS PRO ICE
>> Output of "lsusb -v" provided in attachment.
>>
> 

