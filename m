Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0F82D24B3
	for <regressions@lists.linux.dev>; Thu,  6 Nov 2025 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762421689; cv=none; b=CuHaPH7LtgYsbRpGoByEFBIrcCVaXYtYnt9/triy3VPP/qfBd3N02ME+gun8kPWO4UbppZlsdLgSK4Vu/Y8ToVJ12nnYnGTHobofjn3kId92CD2B48DyOmsRFeJKOd5GUCYgnlS6Gvjbh5Scdrx0p1Dgsph2iNGizE/KHEDP7ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762421689; c=relaxed/simple;
	bh=iV+8wd7c5lCEb/SpfkDZEDWLASquPNXFJ78tK4R1Hls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m81Gfgx+rrNAtUdOfbabVyjf7rswltOJpU7Ndv8+Mp3Y5RuznVVunoUR5LAG/zLFptTQ4W7j0sKxaJA71exXKP8i2gi1MDLURyOT/bM+4dnQpKmfBUAK48AlAI+WvbhRjTsepkTjFE4YLcpTooGwiU33EZN7/Gh7oxqb7mFS55g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=QSd78oLL; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="QSd78oLL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=pP5ODjhCdsQzD/63SJd7frcv9El1J4wyTX4yGQ2Ji9Y=; t=1762421687;
	x=1762853687; b=QSd78oLLAe8IKVkGYa1DGL2Ou451324pXI9LYwFKXL1Qq7dbKna2vWn/9Bv89
	fHEb1Q1cBPRlz+zSqIGHGIrlxSp41tWw7//71EjzsxHOWHuvLn9B7pOK2OdO3YyHcSnJSzrx8s5DK
	8L5URhpy68wyLGb2aHTy+58Zx3Off6MXoZXR5BEVkCxJXLTSUMf4uwtonPSdSggUrcwke4Vzm+7a0
	vNF9D01xbdrTERL0fvhkCdX0II8N2YX4R+o2FD7RkUcZtHoTdFnPcrWuOyIHpaxZu+hP+OIjKCE9j
	KYTZ7e0RrlvP8hKYY7tYQceAoadSoNoujACeqbPXJG5qLLh7pw==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vGwOC-005OXI-2t;
	Thu, 06 Nov 2025 10:34:44 +0100
Message-ID: <e182047c-ed7c-4fb1-bd61-fc0536b12b2e@leemhuis.info>
Date: Thu, 6 Nov 2025 10:34:44 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 220109] New: Audio disappears on HP 15-fc000 after warm boot
 again (ALC256 code path)
To: "kailang@realtek.com" <kailang@realtek.com>, Takashi Iwai <tiwai@suse.de>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "sashal@kernel.org" <sashal@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
 Ruslan Nikolaev <nruslan_devel@yahoo.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <1064773772.509063.1747061777318.ref@mail.yahoo.com>
 <1064773772.509063.1747061777318@mail.yahoo.com>
 <87o6vxuauk.wl-tiwai@suse.de> <946767975.787038.1747111000631@mail.yahoo.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <946767975.787038.1747111000631@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1762421687;ad82828c;
X-HE-SMSGID: 1vGwOC-005OXI-2t

Hi, top-posting for once, to make this easily accessible to everyone.

@Kailang, @Takashi: The fix for the mainline/6.12.y regression this
thread is about was afaics merged for v6.17-rc3 as f4b3cef55f5f96
("ALSA: hda/realtek: Audio disappears on HP 15-fc000 after warm boot
again").

Greg's scripts despite the Fixes-tag for some reason did not backport it
to various series that contain the culprit. Is there a reason for that?
Otherwise we likely should ask Greg to pick it up.

Ciao, Thorsten

On 5/13/25 06:36, Ruslan Nikolaev wrote:
> Takashi and Kailang,
> 
> I did a few additional experiments. Here is what I found:
> 
> 1. If I connect headphones and ALWAYS keep them connected, then sound does not disappear even after a warm reboot.
> 
> 2. The moment I disconnect headphones and do a warm reboot, sound is not going to come back. At that point, connecting or disconnecting headphones, rebooting is not going to change anything (i.e., recover the sound) until I fully power off the computer.
> 
> 3. After reverting the commit, the above problems disappear for speakers, and no additional issues with headphones are observed.
> 
> 4. Whether I revert or do not revert the above-mentioned commit, the headphones are sometime flaky if I already have an application running that uses sound. I have to close that application, disconnect and connect headphones again. Otherwise, the speaker does not get disconnected.
> The headphones seem to be even more flaky when NOT reverting the above commit - unless I booted the system with the headphones connected, the speaker will never get disconnected.
> 
> Sincerely,
> Ruslan
> 
> 
> 
> 
> 
> 
> 
> 
> On Monday, May 12, 2025 at 11:07:02 AM EDT, Takashi Iwai <tiwai@suse.de> wrote: 
> 
> 
> 
> 
> 
> On Mon, 12 May 2025 16:56:17 +0200,
> 
> Ruslan Nikolaev wrote:
>>
>> Hi,
>>
>> Forwarding my regression bug report for HP 15-fc000 / ALC236 (ALC256 code path).
>>
>> #regzbot introduced: v6.12.2
>> https://bugzilla.kernel.org/show_bug.cgi?id=220109
>>
>> Sincerely,
>> Ruslan
>>
>> Forwarded Message (see logs in the bug report above):
>>
>> There was a similar bug in the past (Bug 217440), which was fixed for this laptop. (I believe the code path is for ALC256, see below.) The same issue is occurring again as of kernel v.6.12.2. The symptoms are very similar - initially audio works but after a warm reboot, the audio completely disappears until the computer is powered off (there is no audio output at all).
>>
>> The issue is caused by a different change now. By bisecting different kernel versions, I found that reverting cc3d0b5dd989d3238d456f9fd385946379a9c13d in patch_realtek.c ( see https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/sound/pci/hda/patch_realtek.c?h=v6.12.2&id=4ed7f16070a8475c088ff423b2eb11ba15eb89b6 ) restores the sound and it works fine after the reboot.
> 
> 
> It's the commit cc3d0b5dd989d3238d456f9fd385946379a9c13d
> Author: Kailang Yang <kailang@realtek.com>
> Date:  Thu Nov 14 15:21:09 2024 +0800
> 
>     ALSA: hda/realtek: Update ALC256 depop procedure
>     
>     Old procedure has a chance to meet Headphone no output.
>     
>     Fixes: 4a219ef8f370 ("ALSA: hda/realtek - Add ALC256 HP depop function")
>     Signed-off-by: Kailang Yang <kailang@realtek.com>
>     Link: https://lore.kernel.org/463c5f93715d4714967041a0a8cec28e@realtek.com
>     Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> and it modified alc256_init() sequence.
> 
> Kailang, could you check this regression?
> 
> 
> And, Ruslan, it's the case without the headphone, right?
> Is the sound still lost when you connect the headphone and apply the
> same procedure?
> 
> 
> thanks,
> 
> Takashi
> 
> 

