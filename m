Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559B41D5CCD
	for <regressions@lists.linux.dev>; Fri, 21 Feb 2025 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740171733; cv=none; b=Rhr09B4x50gNjyH+qksIg7mfOHRIJFUZhiwhisnw7wuwAkOk224620z6sZs3CvxmbXmGABLTb9AfBLcyBgAPsyU7Ev1wxK5KFG2H6NwYFxOJeIMYbGZsVJpEMJhVcCpPVaWJbQlbUyUl3ewQGfwnLemyEZy36TQDkaaTuNPUc7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740171733; c=relaxed/simple;
	bh=60QCP9a1fc0i2qunXLPEKvoXFDdpZeQTtyvz1y+2kIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txp+G4x6maAjxRTwGdslE17JHIMdHQvz5alGNR14gMbUM3lz+N6SjqAZ8xFRVOJRzs5N7W4hbDL2z5H38FIoq9sB+OVG/dCF57UwrLfuOzlcpADbJSNHs8MMQ+HmcI+zAse7Inn6yzCofoara5dqiFzby8qPuNm/v2uF2R9U5vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af2a2.dynamic.kabel-deutschland.de [95.90.242.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 839C261E64783;
	Fri, 21 Feb 2025 22:02:04 +0100 (CET)
Message-ID: <36cace3b-7419-409d-95a9-e7c45d335bef@molgen.mpg.de>
Date: Fri, 21 Feb 2025 22:02:03 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux logs new warning `gpio gpiochip0:
 gpiochip_add_data_with_key: get_direction failed: -22`
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
 regressions@lists.linux.dev
References: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
 <CAMRc=McJpGMgaUDM2fHZUD7YMi2PBMcWhDWN8dU0MAr911BvXw@mail.gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CAMRc=McJpGMgaUDM2fHZUD7YMi2PBMcWhDWN8dU0MAr911BvXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Bartosz,


Thank you for your quick reply.

Am 21.02.25 um 21:53 schrieb Bartosz Golaszewski:
> On Fri, Feb 21, 2025 at 9:40 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:

>> On the Intel Kaby Lake Dell XPS 13 9360, Linux 6.14-rc3+ with your
>> commit 9d846b1aebbe (gpiolib: check the return value of
>> gpio_chip::get_direction()) prints 52 new warnings:
>>
>>       $ dmesg
>>       […]
>>       [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>>       […]
>>       [    5.148927] pci 0000:00:1d.0: PCI bridge to [bus 3c]
>>       [    5.150955] gpio gpiochip0: gpiochip_add_data_with_key: get_direction failed: -22
>>       [50 times the same]
>>       [    5.151639] gpio gpiochip0: gpiochip_add_data_with_key: get_direction failed: -22
>>       [    5.151768] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
>>       […]
>>       $ lspci -nn -k -s 1d.0
>>       00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI Express Root Port #9 [8086:9d18] (rev f1)
>>          Subsystem: Dell Device [1028:075b]
>>          Kernel driver in use: pcieport
>>
>> Judging from the commit messages, this is expected. But what should a
>> user seeing this do now?
>>
>> Also, it probably should not be applied to the stable series, as people
>> might monitor warnings and new warnings in stable series might be
>> unexpected.


>> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9d846b1aebbe488f245f1aa463802ff9c34cc078

> What GPIO driver is it using? It's likely that it's not using the
> provider API correctly and this change uncovered it, I'd like to take
> a look at it and fix it.

How do I find out? The commands below do not return anything.

     $ lsmod | grep gpio
     $ lspci -nn | grep -i gpio
     $ sudo dmesg | grep gpio
     [    5.150955] gpio gpiochip0: gpiochip_add_data_with_key: 
get_direction failed: -22
     [Just these lines match.]


Kind regards,

Paul
