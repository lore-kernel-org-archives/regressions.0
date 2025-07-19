Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3826563B
	for <regressions@lists.linux.dev>; Sat, 19 Jul 2025 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752927815; cv=none; b=LCWgEVWY1QqtCICqYCOz5ZKxiKccJLXZ5Wfz10lBBOiA1lNmQCnXOT91mt2nDWUdIWJM9Guh7X1bIu3pLpXm+MAGwrZzlEiHgqzlButoWfHmHNWhY0u/y4dMW8FCLAifbzCt3jVvdM2QcKCuT3H0z3opogYfXym8F/dYXaqYEVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752927815; c=relaxed/simple;
	bh=rXHQfe407yjkkKswishihzg72FBM7pCyyGx4HxRmnpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3juZZH9SamnaeWZyH7htAw3bOk6pkQldC5KNiCH4ykRflS7zG0c0wgEXXs4+CSAK6OLrVD8HfJ9o9BfK5RzYRcEcHPJD7fRM2a89KV5XG/BA7RG8UI94pasY3Izk1mpLFc7aID29HoiTjuxRH7Js84PUWLe7mtmilpBRXYKD7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7hB0lAw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7hB0lAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3285EC4CEE3;
	Sat, 19 Jul 2025 12:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752927815;
	bh=rXHQfe407yjkkKswishihzg72FBM7pCyyGx4HxRmnpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b7hB0lAwjWTCiUvMsStmSYP8Vlyp2zHavjEb56gHh97QGGKmnSc3TtPVwSaKdX8Hh
	 MgvkfiAjLsj2ftxJnZHYmz+34StZK0U9lABaAcRHmtZ/4Q+tR34ziDh0S0kPPCLfsy
	 5RFxyIvl14cg4aFZdiNe1NcNHyFndLi8ShSZJDnF57ELHyF4DsgT/Slt2fEIO6Kv6I
	 1IvRISLrJ4PSX9M9SCCEWntAez4zabQTudrgm88KjsAMe+1D4a8dz2xlEifvMMu+IM
	 H3Yt3RfM3U+q70yU9HOjU1Jx01XBuXJk/Q9iIHddwjsqcMdoTm3Gk9h/TU2ni21/oF
	 JPK0YtKGaDNiw==
Message-ID: <79d7b8a1-b472-4f32-a724-1f2303fb2cab@kernel.org>
Date: Sat, 19 Jul 2025 07:23:32 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: DDC I2C Display Freezing for internal displays
To: Felix Richter <judge@felixrichter.tech>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jonas@3j14.de, seanpaul@chromium.org
References: <0863bc3e-7364-4572-bb72-fc85657cbad7@felixrichter.tech>
 <d9706fe0-7965-457d-830e-19f9aafee855@felixrichter.tech>
 <1c64c181-4e96-4274-975b-454f7207af92@kernel.org>
 <5f63ae37-793e-4e34-a8ab-1845121fcd7e@felixrichter.tech>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <5f63ae37-793e-4e34-a8ab-1845121fcd7e@felixrichter.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/19/25 5:10 AM, Felix Richter wrote:
> Thanks for the reply.
> 
> I am aware that i can read and `edid` via sysfs from the drm device. I 
> did not know about `drm_info` but from a quick look at it I don't think 
> it provides the information I need.
> 
> The problem is not that I need more information about the attached 
> display. The problem is that there is not enough information about the 
> what `i2c` device corresponds to which monitors ddc channel. Relying on 
> udev hierarchies is not sufficient, because in many cases the relevant 
> i2c device has no parent drm output device. So when I have no 
> information about the i2c device I need to get more information by 
> reading from it. Then I know more and can map the device to the correct 
> display. I am happy to change the approach if there is a simpler way for 
> me to get this information.

❯ ls -alh /sys/class/drm/*/ddc

> 
> Ultimately I don't think that me accessing the bus should be the issue 
> here … This issue did not happen with kernel 6.6, so it definitely 
> qualifies as a regression. In my mind it is the job of the driver to 
> handle resource allocation, so if the bus is in use by somebody else it 
> is the kernels job to handle who uses it. It is not the users job to 
> have to worry about some sort of synchronization issue. That is the 
> operating systems job.
> 

I get where you're coming from, but there are cases that are ultimately 
impossible to prevent when it comes to "long", or "frequent" sequences 
and responding to interrupts.  There are lots of examples like this in 
the kernel that if you break what a driver is doing with a device from a 
userspace interface you get to pick up the pieces.

I'll give you two examples:

1) You can access R/W PCI config data.
/sys/bus/pci/devices/*/config

You can break power management state machines, bus mastering, really 
anything a device driver can do from a userspace application.  For 
example if I had a userspace app that did something like this:

dd if=/dev/zero of=/sys/bus/pci/devices/${BDF}/config bs=1 count=4096

and it broke how can the kernel do anything about it?

2) There was a case that fwupd was doing something very similar to you 
with a "probe" but with the DP aux character device.  It was trying to 
detect devices with updates and would fight specifically with link 
training.  The outcome was non-functional devices.  The workaround 
currently employed is that fwupd will wait a few seconds (5 or 10, I 
forget) and then do the probe to avoid that fight.  This doesn't solve 
things though because there are pulse interrupts that could still come 
at any time.  The DP spec has response requirements for these.

We talked about it at the display next hackfest this year and the 
decision was this information that fwupd was needing should be pushed 
into the kernel (let fwupd probe a sysfs file that gets cached data the 
driver fetched).


> People have been experiencing similar screen freezing issues randomly on 
> this drm issue thread: https://gitlab.freedesktop.org/drm/amd/-/ 
> issues/4141#note_3016182> > This example highlights an issue that can be triggered reliably with a
> very similar effect. It may not be the same issue, but they may be related.

Yeah; I'm aware of this thread and agree it's an issue with similar 
symptoms.

> 
> 
> On 7/18/25 20:02, Mario Limonciello wrote:
>>
>> At least to me, this issue sounds like a case that multiple entities 
>> are trying to communicate with the panel at the same time.
>>
>> By setting dcdebugmask=0x10 what you're essentially doing is stopping 
>> the display hardware from trying to put the panel into PSR.  So there 
>> is "less" I2C traffic to fight with.
>>
>> *Why* are you using I2C to read the EDID like this?  Could you instead 
>> use /sys/class/drm/cardX-inputY/edid?  Or even better - can you use 
>> the information from drm_info to make decisions?
>>
>> I think the less I2C traffic done directly from userspace the better 
>> when it comes to synchronization issues..
>>
> 

