Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936891;
	b=Z4orK8VjdQF7IFh35ULN6LvdMtsPJhjZdy7Qm2EKlEMkJ0sdVPK+tLKWi7JxIzE3+tHM
	 wsaFZyuwCRq2lFVlX2SdJ8x/uiPzOsA4J67REoiKM1sk0t1UBHcN/9IvrSD8nwExFb8Kp
	 5xd+QK3/R8i+9KyJpG+JLKl0Y4+Ul09Kzypa6l4zzsUP6AagXQ93W4otwSk3x72ipomK3
	 ExdKL7eu963gjDMjO3Vt7tszVACUcxH0gQ5PXQd/zJxTmxoNd/PtQuc3VhNVDF/KCe6zY
	 6hQZl/2LPm0jZZFE0KcGwrNeS4rDulcoKCv3+g8vi5fTPVXXS5g1mgdTRUT4RUp2eaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936891;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=z1FPipuxEN/IMmAcGfeU/bJsVw7FOZMtmJ5wudP/2vM=;
	b=oEpgwByK1IDynwEbv+ZyHE0ihXy+xjTUw8o15MugLFpOsXzSSfYlh2zrR9TGTtYBK+xR
	 tzAB6bzu4kbHLddADbgUMAwpB3ZzQqTKpEvvi7M9q9V6I8r0Ud8D0kEmDO6op/HXg7HCl
	 uhtdIZCmLVFkHgEqVMunqW4kFmZi7Rpuh4ktoEiUu2VUBoeaIqDmAS73g+mx0Vtqix7E5
	 bf3IHIo2DFOG0kpyFsIxUbcqAPawHSUisoiBAiBevfAyMsRWZ7L/7SnYlnLYQychhHNRU
	 hnu5zilukPZvK5xaqmlhOD9v73H9+ihhcBmYDHIxDg5XNmo3VR78kogs7BeCP5tGFwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="a08/jOUZ";
	arc=none smtp.remote-ip=95.215.58.23
Received: from mta1.migadu.com (out-23.mta1.migadu.com [95.215.58.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A6A606A32C
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 17:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A6A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a08/jOUZ
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=IyUzC+agenXWB8/YFM9pw/+XF1yDRWwpCsBqxMwyY9Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794936887; v=1; x=1795541687;
 b=a08/jOUZ0McpXmqSUZWobnJYB9rsmETLwEOBVQewI5itCkyfMQd75SA+ttZu4oFbu1cBwRdr
 oSQPNlEXCN84SNTl3IaTPevLGLgOJU8N+maOrEMaXFIWhX+WEr5AEQq+AKWWhUTVL67+gJOi2aj
 SByOc6Pxz+GMJYUIFZx3dPNk=
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 1c005ca180b9b7d3;
	Tue, 17 Nov 2026 17:34:47 +0000
X-Mizu-Trace-ID: 1c005ca180b9b7d3
X-Migadu-Flow: FLOW_OUT
Message-ID: <c0da379f-e10a-464d-b01a-d65e0e07e5e6@linux.dev>
Date: Tue, 17 Nov 2026 18:34:24 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
To: johannes.goede@oss.qualcomm.com, Ted Vera <tedvera@gmail.com>,
 linux-sound@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
Cc: regressions@lists.linux.dev, oder_chiou@realtek.com, lgirdwood@gmail.com,
 broonie@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
 <d5ece1f3-b70b-4c70-aa52-cd0d00253ea5@oss.qualcomm.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <d5ece1f3-b70b-4c70-aa52-cd0d00253ea5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/17/26 11:54, johannes.goede@oss.qualcomm.com wrote:
> Hi,
> 
> Note adding Yauhen the author of the troublesome commit to the To: list
> (why was this not done in the first place ?).
> 
> 
> On 16-Nov-26 22:24, Ted Vera wrote:
>> Summary:
>> On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
>> kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
>> with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
>> appears in devices_deferred, no RT5677 ALSA card is registered, and
>> only HDMI audio is available.
>>
>> The driver’s ACPI GPIO mapping added by commit 0cc00de3dd5b maps GPIO
>> resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
>> device. Samus’s DSDT uses those resources for codec GPIOs (jack detect
>> and mic-present), not Yoga Book-style external reset and power GPIOs.
>> The driver requests the mapped GPIOs before registering the codec’s
>> GPIO chip, which appears to cause the deferred-probe loop.
>>
>> Test and result:
>> I built a temporary module against the matching Fedora kernel source
>> that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
>> that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
>> card appeared, and laptop-speaker audio worked. Secure Boot remained
>> enabled. This strongly supports the ACPI GPIO mapping as the cause.
>>
>> Suggested fix: Restrict the mapping to devices whose ACPI GPIO
>> resource layout matches the Yoga Book, rather than applying it to
>> every RT5677 ACPI device.
> 
> Only adding the GPIO mappings (devm_acpi_dev_add_driver_gpios()) on
> a DMI match of the yogabook sounds good to me.
> 
> DMI strings can be taken from:
> 
> drivers/platform/x86/x86-android-tablets/dmi.c
> 
> Note there are both a X90F/L models which ship with Android and
> use a different BIOS, as well as X91F/L models which ship with
> Windows (same hw, different BIOS).
> 
> Yauhen, I guess the ACPI mappings where for the Windows X91 model,
> since on Android I expect the GPIO's to be hardcoded in the driver?
> 
> So the devm_acpi_dev_add_driver_gpios() should be only done
> if there is a DMI match for the X91F/L models, re-using
> the DMI match strings from:
> 
> drivers/platform/x86/x86-android-tablets/dmi.c
But the open is whether those GPIO mappings belong in the codec driver?
Back in 2017 (!) Andy moved the Samus mappings to the machine driver
bdw-rt5677, why not add those YogaBook mappings to the cht_rt5677
machine driver?

Looks like the addition of those mappings for the YogaBook didn't follow
the Samus precedent, now we have two different ways of doing the same
thing even though the codec is the same...
