Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B28EEC3
	for <regressions@lists.linux.dev>; Mon, 29 Sep 2025 00:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759106740; cv=none; b=jt+A0FZFHhtnZf4ZShm3Lu/kJiabAK9/PUBTery1gJGdNLqoXShxh+sDoVmkUHdy9roiMAIaLHpsH59gWAcpss4u1X7FEak8o4h/4dJqAVGV8eL0hDzO1tU3FWnMm3Yd20f0KYTYxpmoytWdEjKZMzj08KB19Cgh52Y5j/TVsR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759106740; c=relaxed/simple;
	bh=r0c7P7hrpmBxhUw6eaYfyfgvDlJGtgWC04dcqv6jzdQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WDxk3F9zCoBUkiJms1sFNbFJurLtjs1xTiF1XQuUzecmqiCk1i1uZZz2hDTmXKn2e/TqonLsg28Mi2EV9yUsPdPyyhGFG76zCWC8kID3pIN0OWRAh4ivCZlu5ypEJxXHFGPc67RdttnA5POlraezipQuMB1kqvTfHi/vDziP/P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 389CA1D4195A;
	Sun, 28 Sep 2025 17:39:07 -0700 (PDT)
Message-ID: <5101f30a-4f49-4480-9453-1984f6c5a086@cosmicgizmosystems.com>
Date: Sun, 28 Sep 2025 17:39:05 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Linux Hid <linuxhid@cosmicgizmosystems.com>
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
To: Staffan Melin <staffan.melin@oscillator.se>,
 zhangheng <zhangheng@kylinos.cn>
Cc: Salvatore Bonaccorso <carnil@debian.org>, Jiri Kosina <jkosina@suse.com>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, 1114557@bugs.debian.org
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
 <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
 <aMUxHZF-7p7--1qS@eldamar.lan> <aMUxg6FLqDetwiGu@eldamar.lan>
 <f08669ec112d6ab2f62e35c0c96d1f06@oscillator.se>
 <94520aac-2a68-40d2-b188-80f9e361d6de@kylinos.cn>
 <735c20da-c052-4528-ad91-185a835ca40c@cosmicgizmosystems.com>
 <54b4b55c-ef29-40ae-a576-0c0b35ea9625@kylinos.cn>
 <3c299b65351c489fea95ec8b93518b6b@oscillator.se>
 <01ce8d55-6054-4efa-bed5-ce4c6c6bc0e6@kylinos.cn>
 <11f1363dcdec98f4275e4df3145e4f24@oscillator.se>
Content-Language: en-US
In-Reply-To: <11f1363dcdec98f4275e4df3145e4f24@oscillator.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All,

It's good a working solution has been found. I'll comment separately on 
the patch submission.

I did some digging to find out why there were multiple devices in the 
wild with the same VID:PID.

It seems that Jieli does have a valid USB VID.

Zhuhai Jieli Technology Co., LTD owns VID 13908 (0x3654)

However, in one of their public SDKs they populate the default device 
descriptor with:

    'J', 'L',     // idVendor: 0x4a4c - JL    (actually 0x4c4a)
    0x55, 0x41,     // idProduct: chip id     ('U', 'A' 0x4155)

So anyone developing a device using that chip's SDK who doesn't change 
the default VID:PID will create a device with 4c4a:4155 VID:PID.

In other SDKs I see a different PID but the same 0x4c4a VID

    '5', '4',     // idProduct: chip id       (0x3435)

So there are probably multiple devices in the wild with 4c4a:3435 
VID:PIDs as well.

Here's a link to the 4c4a:4155 SDK if you'd like to take a look.

https://github.com/Jieli-Tech/AW30N/blob/main/sdk/apps/app/bsp/common/usb/device/descriptor.c#L31

Regards,
Terry

On 9/22/2025 11:33 AM, Staffan Melin wrote:
> Thank you,
> 
> I can confirm that this patch fixes the touchscreen issue on my GPD DUO.
> 
> Tested-by: staffan.melin@oscillator.se
> 
> Thank you for your work!
> 
> Staffan
> 
> On 2025-09-22 11:21, zhangheng wrote:
>> Please help test this patch, I will push it to the kernel community. 
>> Currently, the microphone device is functioning normally
