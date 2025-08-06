Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C491A76DA;
	Wed,  6 Aug 2025 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754499663; cv=none; b=GL1sTgrJegGlajmHuadRkkmxiVplfK6qz1mcdfhzrxQDEPUCBu8iRoVe+GOqfpe1xMFSk/2bAa+ck2XbsPEVA+GzLSwfV1UNJmFOy+NC+aYdLn+9ipPA4fE+cAHkJy/WycIWkTiyN2WlcovYFA1b/ETFQEEcZwxmoamOzZR5LQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754499663; c=relaxed/simple;
	bh=HzsVSOE6oiKHPROzGezzPj3yOjMcCrH7mb/aKNbdAPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V68PqZl1Nya4ueDGxst96iG0Ne7+Qep5zHTz3Ub7FZbXmSUZ/NgOc0KuAVp7EZGrtiaIHIESR5ayN/J4qGTP7qoMxhIBIOrJgIKbEUoKd37uElXyvh6IkGMSYrQO9bk3YpYGse1BeC18poUx2M8EgZR5yH3U9DcbnVXVZGBv1Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zut0Ssvu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zut0Ssvu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17E1C4CEE7;
	Wed,  6 Aug 2025 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754499663;
	bh=HzsVSOE6oiKHPROzGezzPj3yOjMcCrH7mb/aKNbdAPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zut0Ssvu3M24JbziXFYoLqGoO5FcLJ5fgz4w/4KIUITZJ6+YX+xFRKf46lrCKeUdH
	 ROpTqAfDZLV+vrbdZ9h6AHlPYzEP1GLnSrRdjeg58xFkWpjMILcgaCNKuGxQ8ASEgp
	 joqhqejXOnIvFsdtrP0kn+n4reBhj94uZP8uf3PdRYwKXDRR+x2Eoq06AV0Vqdw8Zn
	 /w7a93292lZbyD8pq9zHi7rzGy0BkGYwu3KkbavGtoDLiVoBqbOWMvdGS7SEXRR5IR
	 S8x37Rq5oVGhPdzZwcvjgB0gj7d0Se6zTd2cpJFn61bj/Aq8AV+fpDbdSds3JT1GEQ
	 xli0MqaT8wJWA==
Message-ID: <8e204b89-9bdb-47de-901c-61fdc0ea1050@kernel.org>
Date: Wed, 6 Aug 2025 19:00:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Quiet crackling noise at boot and after stopping music
To: Takashi Iwai <tiwai@suse.de>, Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, regressions@lists.linux.dev
References: <10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de>
 <871pposvy9.wl-tiwai@suse.de>
 <d542d223-fc6e-4be7-b581-8a390ce2f6be@molgen.mpg.de>
 <87sei4rg67.wl-tiwai@suse.de>
 <b70db707-457d-4c0c-85be-19f4340dcc7b@molgen.mpg.de>
 <87h5ykqzod.wl-tiwai@suse.de>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <87h5ykqzod.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

On 6-Aug-25 4:42 PM, Takashi Iwai wrote:
> On Wed, 06 Aug 2025 15:57:51 +0200,
> Paul Menzel wrote:
>>
>> Dear Takashi,
>>
>>
>> Thank you for your reply.
>>
>> Am 06.08.25 um 10:46 schrieb Takashi Iwai:
>>> On Wed, 06 Aug 2025 10:34:57 +0200, Paul Menzel wrote:
>>
>>>> Am 06.08.25 um 10:20 schrieb Takashi Iwai:
>>>>> On Wed, 06 Aug 2025 10:15:08 +0200, Paul Menzel wrote:
>>>>
>>>>>> I believe the Realtek refactoring caused a regression on my Intel Kaby
>>>>>> Lake laptop Dell XPS 13 9360. There is quiet crackling noise during
>>>>>> boot, when GDM is started, and also after playing music is
>>>>>> stopped. It’s reproducible with 6.16.0-04055-g14bed9bc81ba, that
>>>>>> contains the sound subsystem pull request.
>>>>>>
>>>>>> 177bf8620cf4 Merge tag 'sound-6.17-rc1' of
>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
>>>>>>
>>>>>> I uploaded the run of alsa-info [1]. I try to verify with plain 6.16 later.
>>>>>
>>>>> It's likely because of the missing CONFIG_SND_HDA_CODEC_* selections.
>>>>> Please set CONFIG_SND_HDA_CODEC_ALC269=m and
>>>>
>>>> Indeed, I didn’t select this.
>>>>
>>>>> CONFIG_SND_HDA_CODEC_HDMI_INTEL=m if not done yet.
>>>>
>>>> I had selected this.
>>>>
>>>>> Those were already set to default=y in the later PR for avoiding such
>>>>> a pitfall.
>>>>
>>>> I remember I tried to check which to select, and I ran `alsa-info` to
>>>> find the codecs, but only found:
>>>>
>>>>      Codec: Realtek ALC3246
>>>>
>>>> As this didn’t match to any of the offerings, I didn’t select
>>>> it. May I suggest to extend the Kconfig help texts with notes how to
>>>> determine the correct module?
>>>
>>> There are quite lots of different codec names, so we can't put all
>>> them, unfortunately...
>>
>> Understood. Then maybe just the command how to find the id, that
>> people can use to grep the correct module for? From the script
>> `alsa-info.sh`, maybe, I found:
>>
>>     $ grep -e Codec -e "Vendor Id" /proc/asound/card*/codec#*
>>     /proc/asound/card0/codec#0:Codec: Realtek ALC3246
>>     /proc/asound/card0/codec#0:Vendor Id: 0x10ec0256
>>     /proc/asound/card0/codec#2:Codec: Intel Kabylake HDMI
>>     /proc/asound/card0/codec#2:Vendor Id: 0x8086280b
>>
>> So mention `/proc/asound/card*/codec#*`?
> 
> Honestly speaking, I don't want that; it won't scale, and new codecs
> may appear at any moment.  Then we'd have to manage multiple places
> for adding or removing ids.
> 
> Maybe an alternative option would be to mark prompt of each Realtek
> codec driver with EXPERT, so that all Realtek drivers will be enabled
> (when CONFIG_SND_HDA_CODEC_REALTEK is set) unless you say you're an
> expert :)

FWIW that sounds like a good idea to me.

Regards,

Hans


