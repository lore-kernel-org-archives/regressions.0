Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E257139DBF4
	for <regressions@lists.linux.dev>; Tue,  7 Jul 2026 22:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783462802; cv=none; b=aYm3wHUPWlGL941Tk63EIe9HDxZb/t/ZB7QecyoYSJ2u00srci2WzJpnHwKK3e024MJitvUQ1N9AmI6ZXSDu1GH3EhbbmnXI/2H3UjxNqNhMowWIGLstGYdbI+QQYIh/MHYk7LpVUIv2NcGRGEOUwUXb42GZM2wdteHVrpwYfeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783462802; c=relaxed/simple;
	bh=frBgeJaIAR17/Qfijmu+ULcqVkAmYosEXyunoPucIGo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QULw5NSqe3RuXDOq3uKGobMuFchkzT1mZ/ysid2uGlwD7UXFGXAjrAzTbbUwsNFv5DQ51wxlO4fPnIO+tDCN5fYPfwKEvhEqP6ZyoKEjsvKlm7oH1/lpFZheWZg2d4NXfvVN9VPni84+4pUVSe/0BahoWOUL//Q9wpbQbWCn5Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4VAQQT5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4VAQQT5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc6ae3e7f1so505685ad.0
        for <regressions@lists.linux.dev>; Tue, 07 Jul 2026 15:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783462800; x=1784067600; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+WwbKpOYSnyAyf6gFYLcLjARJ2PtI2beb2eDL2zlr0=;
        b=g4VAQQT5E7bo+h4TxVu/LLJ0lr7RxV1gIXLEs5Ry3/jd8BRAO0vOXo2+Pgj7LI6QYn
         0nYPqy54pjG6B6gvdwwXa9dF2iYi8ofWDiIwH4cFVaUYXAtFMZiSU7CoJBC12zf0cjbx
         ISczbIxoAifbn9Wy+pqXtv/evGp9wkG3QvVkXVRByYXS0/gLQmq56fdBq0pEDvn/xSO4
         bH3pcb0fn/t6DZQGrZrg+3CApnGYfuO53DpfkT9K3ixtZg+MHnGx88guXKiQqSMnqRRf
         ni7f3rRk6cO4y1hzBRk5rIyUUhgBTtUOQJaMpkiyb2B9MoAQme76OWR3c6RD18pBZwf0
         8psA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783462800; x=1784067600;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+WwbKpOYSnyAyf6gFYLcLjARJ2PtI2beb2eDL2zlr0=;
        b=c87ylE66MXNjk9yLVhUITspaYLMjPtqMtsUBfSmE/jgpdutdVRVJNk5t5+z5y7NKe9
         pedtjaCzN/ZEzxyJNaE5ZD3HP1CS1XMnhR9N/UZMxCgN5fpM9iADLHkZQOhBBS0lXFj4
         kEo+hf/pn0vvOmbC9OkZAOYBZjZdnbGNoWFy17w3kP8RYhjp+LqU3CxIZKs0P0kkI353
         BVk9sR/eHkQIH5OIYlI7uPoYha7Nha035OlmGxQNqBq425DWJiRsxp77d0IlrLmrJ5PR
         bs6CQjxWL4091cP2Yvw8bHayGZLuiuTMOp/deFb8SgZg8AvX8EpWVu/J+n7wt1clSBPI
         wjuQ==
X-Forwarded-Encrypted: i=1; AHgh+RojHlF/MIPPaWC/3Vng21yNPdNP/DBFs3pCGcQPwmUCUd3mPGoe6wb7ZrvLXl6oPaL6rU5hMAuhinOZTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YynRyaTlShiCXnCl4FnAlWx77zWAvCfHnG+0G2Xrfyo0k8odFno
	rITTIcHCStzrdbK09jqCvneLIna7iFXC/Q0whVD4KZZi2un0wEtzKqyn
X-Gm-Gg: AfdE7clxlHsWaxGW0r9m0KFu+A+j10O9JqdotjV15Pd0g8fJF5WJO+01u6CMs7RSD6b
	gBdHiJ6BIl7MoXEhVkLsfCMt3KBw15+2+Q6R0/PJvuS0njnuefR2j1ZlN1mjutmyLIKSJNvPA7P
	7+ywbK6WFgTyS4mC+GTSHo6xr5k6LirtH1uWEf9pJIJ4ERn9qrFEMMmy8+SnfrQDgjBp8Xhucsn
	PwExNHGY3F5gAeCG1LoKJBOkkrEDNZvN9SGK1vTEIy20XfRGYBIOB+5oCNL4CNjw0nerMli5wbb
	pYVB6odqB6DU7nIKQmpQyBjTQ9msfrJZP/+zkSNyAUztPYrCllk7uMW/Wt9wrNgT3KXQODYs0qL
	6i8t1lGdQI3ui6yMCxAzJlX1LQi+KcaTY+Vm1xSue5YxW2WHSpCEMVwcJNVjc/35eU1qCOu/HNN
	ud1xJQi+J7ppx1jsqerMRU2g==
X-Received: by 2002:a17:902:cf10:b0:2ca:b300:43b7 with SMTP id d9443c01a7336-2ccbe3f1a73mr63797925ad.4.1783462800142;
        Tue, 07 Jul 2026 15:20:00 -0700 (PDT)
Received: from [192.168.89.2] ([175.235.236.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d952sm18087585ad.61.2026.07.07.15.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 15:19:59 -0700 (PDT)
Message-ID: <f7f1662d-6472-49e3-8489-fe7d8ecebe08@gmail.com>
Date: Wed, 8 Jul 2026 07:19:57 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 221721] New: prom21-xhci does not allow to use USB keyboard
 in plymouth
From: Jihong Min <hurryman2212@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: bugzilla-daemon@kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 linux-usb@vger.kernel.org, marx.tomasz@gmail.com
References: <bug-221721-208809@https.bugzilla.kernel.org/>
 <328d3158-8086-4de7-a96e-7c2a514e3018@leemhuis.info>
 <620721eb-2b0e-4279-81e2-420996195206@gmail.com>
Content-Language: en-US
In-Reply-To: <620721eb-2b0e-4279-81e2-420996195206@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

PR for Dracut-ng is now submitted:
https://github.com/dracut-ng/dracut/pull/2491


Sincerely,
Jihong Min

On 7/7/26 18:53, Jihong Min wrote:
> With a little more of thinking, I think this happens due to the
> initramfs building tool not including xhci-pci-prom21.ko when
> xhci-pci.ko is built with the Kconfig where USB_XHCI_PCI_PROM21 was enabled.
> 
> Can you check your initramfs file for whether it holds
> xhci-pci-prom21.ko correctly, or not?
> 
> For example, with dracut, you can do something like:
> cat <<'EOF' | sudo tee /etc/dracut.conf.d/10-xhci-pci-prom21.conf
> # PROM21 xHCI PCI glue is needed before root/LUKS unlock when xhci-pci
> is modular.
> force_drivers+=" xhci-pci-prom21 "
> EOF
> 
> 
> Sincerely,
> Jihong Min
> 
> 
> On 7/7/26 17:03, Thorsten Leemhuis wrote:
>> [Switching to email, hope this will work]
>>
>> Jihong Min, it seems a recent change of yours is causing trouble. See
>> below for details.
>>
>> Side note, but not my area of expertise, so feel free to ignore this, as
>> I might be sending people in the wrong direction and it's just a hunch
>> anyway: wonder if this is another of those situations where the driver
>> needs to be in the initramfs. Tomasz, did you have SENSORS_PROM21_XHCI=m
>> when things were broken? And if yes: have you tried if adding it to the
>> initramfs or setting SENSORS_PROM21_XHCI=y helps?
>>
>> Ciao, Thorsten
>>
>> On 7/4/26 17:41, bugzilla-daemon@kernel.org wrote:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=221721
>>>
>>>             Bug ID: 221721
>>>            Summary: prom21-xhci does not allow to use USB keyboard in
>>>                     plymouth
>>>            Product: Drivers
>>>            Version: 2.5
>>>           Hardware: AMD
>>>                 OS: Linux
>>>             Status: NEW
>>>           Severity: low
>>>           Priority: P3
>>>          Component: USB
>>>           Assignee: drivers_usb@kernel-bugs.kernel.org
>>>           Reporter: marx.tomasz@gmail.com
>>>         Regression: No
>>>
>>> Created attachment 310416
>>>   --> https://bugzilla.kernel.org/attachment.cgi?id=310416&action=edit
>>> output of "sudo lsusb -v"
>>>
>>> Hi,
>>>
>>> After update to 7.2-rc1 I was unable to type in LUKS password in plymouth. I
>>> tried both of my USB keyboards, but both of them just briefly lit up the LEDs
>>> and then seemed to turn off. Bisection pointed to
>>>
>>> commit 364f4a55c661641c02c86a849f0608d8fc3c0006
>>> Merge: e4b4bfaa5090 1c2b66a7d725
>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>> Date:   Mon Jun 22 12:09:47 2026 -0700
>>>
>>>     Merge tag 'usb-7.2-rc1' of
>>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
>>>
>>> and then
>>>
>>> commit 9e896b4a48c4e815956d28961448041c80ad5a19 (HEAD)
>>> Author: Jihong Min <hurryman2212@gmail.com>
>>> Date:   Tue May 19 09:07:31 2026 +0900
>>>
>>>     usb: xhci-pci: add AMD Promontory 21 PCI glue
>>>
>>> After setting SENSORS_PROM21_XHCI=n and compiling kernel again, I'm able to use
>>> my PC normally.
>>>
>>> CPU: AMD Ryzen 9 9900X
>>> Motherboard: X870I AORUS PRO ICE
>>> Output of "lsusb -v" provided in attachment.
>>>
>>
> 

