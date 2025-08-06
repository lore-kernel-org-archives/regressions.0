Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBDF1BD4F7
	for <regressions@lists.linux.dev>; Wed,  6 Aug 2025 16:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754496749; cv=none; b=e6HF9c8pUYW1Orxex0zS8eP6PbEGdpGoOTYP5vQshGhBgT3lRHSMACdocOPrIREkMVucSkmSxJXPZLPDzzKzuT6rdTv0Oi9vVvFG2ekYRIK+ffpOhI66tt9UEOOcmppmz6ZjX19SHoL0ypy648lO0S2VkbfZvtnwCjV4pUrO2Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754496749; c=relaxed/simple;
	bh=d7yfcABiCoZj20sM9WivACftXetkTEXymi75I0Ar06o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qxb1DP2PvojcV+g2wfvwJ3doD88J7SspQUhAPuCZYWJWGqRvU3NosFGVJ44+iU0ZCv3Z+a56S2ncnU9d0x/yF93itLPuKEB3VLd5n1lh9uR3SYfOei0t3xg/37S8m7IK6gx+FpLVtN4ygSwcO1xhZJGbe5OvJuLDG/b1F9+R8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3366D6028825F;
	Wed, 06 Aug 2025 18:12:21 +0200 (CEST)
Message-ID: <d282d29d-c580-44d1-bef2-f425a744ef50@molgen.mpg.de>
Date: Wed, 6 Aug 2025 18:12:20 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Quiet crackling noise at boot and after stopping music
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, regressions@lists.linux.dev
References: <10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de>
 <871pposvy9.wl-tiwai@suse.de>
 <d542d223-fc6e-4be7-b581-8a390ce2f6be@molgen.mpg.de>
 <87sei4rg67.wl-tiwai@suse.de>
 <b70db707-457d-4c0c-85be-19f4340dcc7b@molgen.mpg.de>
 <87h5ykqzod.wl-tiwai@suse.de>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <87h5ykqzod.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Takashi,


Thank you for your reply.

Am 06.08.25 um 16:42 schrieb Takashi Iwai:
> On Wed, 06 Aug 2025 15:57:51 +0200, Paul Menzel wrote:

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
>>>>       Codec: Realtek ALC3246
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
>>      $ grep -e Codec -e "Vendor Id" /proc/asound/card*/codec#*
>>      /proc/asound/card0/codec#0:Codec: Realtek ALC3246
>>      /proc/asound/card0/codec#0:Vendor Id: 0x10ec0256
>>      /proc/asound/card0/codec#2:Codec: Intel Kabylake HDMI
>>      /proc/asound/card0/codec#2:Vendor Id: 0x8086280b
>>
>> So mention `/proc/asound/card*/codec#*`?
> 
> Honestly speaking, I don't want that; it won't scale, and new codecs
> may appear at any moment.  Then we'd have to manage multiple places
> for adding or removing ids.

Sorry, I didn’t mean to add the id’s to the description, but something like:

You can check the vendor id in `/proc/asound/card*/codec#*`

> Maybe an alternative option would be to mark prompt of each Realtek
> codec driver with EXPERT, so that all Realtek drivers will be enabled
> (when CONFIG_SND_HDA_CODEC_REALTEK is set) unless you say you're an
> expert :)

At least I wouldn’t have bothered you. ;-) My gut prefers, improving the 
documentation instead of hiding it, but you are the maintainer.

     $ ls -lh 
/lib/modules/6.16.0-11852-g479058002c32/kernel/sound/hda/codecs/realtek/
insgesamt 464K
     -rw-r--r-- 1 root root 300K  6. Aug 10:22 snd-hda-codec-alc269.ko
     -rw-r--r-- 1 root root 164K  6. Aug 10:22 snd-hda-codec-realtek-lib.ko

The size is small compared to other drivers, but not nothing.


Kind regards,

Paul


PS: Despite just building in `CONFIG_SND_HDA_CODEC_ALC269=m`, 
6.16.0-11852-g479058002c32 is 172 kB bigger:

     $ du -s /lib/modules/6.16.0/kernel/sound/
     10992	/lib/modules/6.16.0/kernel/sound/
     $ du -s /lib/modules/6.16.0-11852-g479058002c32/kernel/sound/
     11164	/lib/modules/6.16.0-11852-g479058002c32/kernel/sound/


> -- 8< --
> --- a/sound/hda/codecs/realtek/Kconfig
> +++ b/sound/hda/codecs/realtek/Kconfig
> @@ -12,7 +12,7 @@ config SND_HDA_CODEC_REALTEK_LIB
>   	select SND_HDA_SCODEC_COMPONENT
>   
>   config SND_HDA_CODEC_ALC260
> -	tristate "Build Realtek ALC260 HD-audio codec support"
> +	tristate "Build Realtek ALC260 HD-audio codec support" if EXPERT
>   	depends on INPUT
>   	select SND_HDA_CODEC_REALTEK_LIB
>   	default y
> @@ -20,7 +20,7 @@ config SND_HDA_CODEC_ALC260
>   	  Say Y or M here to include Realtek ALC260 HD-audio codec support
>   
>   config SND_HDA_CODEC_ALC262
> -	tristate "Build Realtek ALC262 HD-audio codec support"
> +	tristate "Build Realtek ALC262 HD-audio codec support" if EXPERT
>   	depends on INPUT
>   	select SND_HDA_CODEC_REALTEK_LIB
>   	default y
> @@ -28,7 +28,7 @@ config SND_HDA_CODEC_ALC262
>   	  Say Y or M here to include Realtek ALC262 HD-audio codec support
>   
>   config SND_HDA_CODEC_ALC268
> -	tristate "Build Realtek ALC268 HD-audio codec support"
> +	tristate "Build Realtek ALC268 HD-audio codec support" if EXPERT
>   	depends on INPUT
>   	select SND_HDA_CODEC_REALTEK_LIB
>   	default y
> @@ -37,7 +37,7 @@ config SND_HDA_CODEC_ALC268
>   	  codec support
>   
>   config SND_HDA_CODEC_ALC269
> -	tristate "Build Realtek ALC269 HD-audio codecs support"
> +	tristate "Build Realtek ALC269 HD-audio codecs support" if EXPERT
>   	depends on INPUT
>   	select SND_HDA_CODEC_REALTEK_LIB
>   	default y
> @@ -46,7 +46,7 @@ config SND_HDA_CODEC_ALC269
>   	  codec support
>   
>   config SND_HDA_CODEC_ALC662
> -	tristate "Build Realtek ALC662 HD-audio codecs support"
> +	tristate "Build Realtek ALC662 HD-audio codecs support" if EXPERT
>   	depends on INPUT
>   	select SND_HDA_CODEC_REALTEK_LIB
>   	default y
> @@ -55,7 +55,7 @@ config SND_HDA_CODEC_ALC662
>   	  codec support
>   
>   config SND_HDA_CODEC_ALC680
> -	tristate "Build Realtek ALC680 HD-audio codecs support"
> +	tristate "Build Realtek ALC680 HD-audio codecs support" if EXPERT
>   	depends on INPUT
>   	select SND_HDA_CODEC_REALTEK_LIB
>   	default y
> @@ -63,7 +63,7 @@ config SND_HDA_CODEC_ALC680
>   	  Say Y or M here to include Realtek ALC680 HD-audio codec support
>   
>   config SND_HDA_CODEC_ALC861
> -	tristate "Build Realtek ALC861 HD-audio codecs support"
> +	tristate "Build Realtek ALC861 HD-audio codecs support" if EXPERT
>   	depends on INPUT
>   	select SND_HDA_CODEC_REALTEK_LIB
>   	default y
> @@ -71,7 +71,7 @@ config SND_HDA_CODEC_ALC861
>   	  Say Y or M here to include Realtek ALC861 HD-audio codec support
>   
>   config SND_HDA_CODEC_ALC861VD
> -	tristate "Build Realtek ALC861-VD HD-audio codecs support"
> +	tristate "Build Realtek ALC861-VD HD-audio codecs support" if EXPERT
>   	depends on INPUT
>   	select SND_HDA_CODEC_REALTEK_LIB
>   	default y
> @@ -79,7 +79,7 @@ config SND_HDA_CODEC_ALC861VD
>   	  Say Y or M here to include Realtek ALC861-VD HD-audio codec support
>   
>   config SND_HDA_CODEC_ALC880
> -	tristate "Build Realtek ALC880 HD-audio codecs support"
> +	tristate "Build Realtek ALC880 HD-audio codecs support" if EXPERT
>   	depends on INPUT
>   	select SND_HDA_CODEC_REALTEK_LIB
>   	default y
> @@ -87,7 +87,7 @@ config SND_HDA_CODEC_ALC880
>   	  Say Y or M here to include Realtek ALC880 HD-audio codec support
>   
>   config SND_HDA_CODEC_ALC882
> -	tristate "Build Realtek ALC882 HD-audio codecs support"
> +	tristate "Build Realtek ALC882 HD-audio codecs support" if EXPERT
>   	depends on INPUT
>   	select SND_HDA_CODEC_REALTEK_LIB
>   	default y

