Received: from mail-ej2-f17.google.com (mail-ej2-f17.google.com [74.125.228.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022693D3492
	for <regressions@lists.linux.dev>; Tue, 29 Sep 2026 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691870; cv=none; b=igZUBvBdcxMN1kU06yKv0kOcScBc7dqvU0PkzCibTpBwqYvRRfoVh5ruVU1BbRwFvNwpy4vZq9lMpe8svW03EkwZ1Df2NE/QIsxfnrr9lv3q/bng9UKcuKbXsmnOUMP9VHtLtoht42D6bfRVWszncsG8cG9o4K1Y5QJHrJmbWiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691870; c=relaxed/simple;
	bh=uHpZL76WzFAlN9omYfUfgHBK04zz9UiXwnngsyjxnx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLXkV/4/nAA6pgx3kZhayvEI+legQlK/EauyhNjqY864wO0rHz6JhVQLGfFe7dURibjJks2WWOuQO4t9/yX/tLpxC42iOJLUeyVB6aw7BCg+JO2KReyY+jwX0dJX4b8Eybhcs0KxAGSLTiRh2UQ+eILN+ATdkF03abX1lbcwnJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LB/5U8Wb; arc=none smtp.client-ip=74.125.228.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LB/5U8Wb"
Received: by mail-ej2-f17.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so641530266b.2
        for <regressions@lists.linux.dev>; Tue, 29 Sep 2026 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691865; x=1791296665; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJazDxMkWono34PQyfbuzm+nlBT/z7JfOyFwMEhNk2s=;
        b=LB/5U8WbUzov+hF4R0WJR4HhDC5NouDc0nQzeetj9+vS7q3qV5JQ/6CHafWhQyzipb
         FeWo+kZN+TlbIIVwdZmsRadtA8R0MAcEKTcJLdHiy0qLI/+6bnBvrSQLGtPuap2trFNr
         /HGqs8CKOBwCl5DJzG56+4Q3o8sRPvsQznkPJE8sIQ99KoATZw0NMJ+8zyTjL6Do1lWH
         ufoP0rAh7lDIQH9Olk4JTjPYXcT1cHkufYeDkwldqsrX8SA4juMbtM/idRIaqu+YgZZu
         cJJ03YtT0AbZXNLfu5VE0tqqqhM3QJsKp5dcsRSbXmJ0ZGAl5iA86j28DLgO71Qxsbl3
         wxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691865; x=1791296665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJazDxMkWono34PQyfbuzm+nlBT/z7JfOyFwMEhNk2s=;
        b=o+XO3AFOP8nPQjfaT2dl3jG6AkR6yiwuZwNH1VDClZQVm8friuyBxd5wrG3X9fCSOa
         ivse3/2gxP8Co7/uo9XfpBjKR5CX7N9ImB4w6W1G+hFgB7x8d1jvgYwOVEdlYRxwVg53
         312DOaxhfdBn/hD9KJ9hAHm1QJRrESpzG0Rth+xBxeQB1UeuR4PFfoAvzrDKQacNgQZB
         yWqCNEeWZDMENNbIQnU1qUj8KQ78IkNiprJLUwN8VfGfcSwv9y65hdtvCaA82uMakiNF
         SRH6hXCoeq06erIdlJUCODMx9I/Iv1jS4yXDnQp3Px6D6oEpzStlcVyJ9I8Ba1RIVrVJ
         6+PA==
X-Forwarded-Encrypted: i=1; AKwUvBwNmPcPysj24AbGvP/w2KP9gZqQjQauvz+6+X0O/8EJkA0LYKOJvTw6HxQsvhkMJrQBO+Il8pH6BhsC6A==@lists.linux.dev
X-Gm-Message-State: AFuF++k6/wOUzFyQh/ifNDjlo5bdCefdOZaCETz5bP3yBk1JhN7l/Jiw
	FUNWykanYS7zoADQWlvLMzWR8L8sYawAyp44LRHL1dRtzmTEAbXizVP9
X-Gm-Gg: AYBFou2eZsiIpAGC/EHT4ynuaqQTDnNgDeGPU8jgHreFvGkKUGIoqAsUWqZIAMfJwo9
	C95IOlcdiPm0xdJRFFRelrkle8Vf6IZsRExiP7LPM/mA6/AVt30o7nZC1rEiz3e5AZ2W+8N+7Py
	J/0LukjhJVGYgrGTzfWAD0EeGEa6SW+xVclTSUehxA8u7FwYnTLTkKQbXEdnmrFqhqXrlQVWVis
	9cIpImrkXknHCGPovmrPu2oBpKfwovkCL5fbJTQpc1Lu7ghXKyc57h34xC17Vsd62VAgy9cp6uS
	sUKTHBM38ielcXLz3bgiDb8dmNH7mRgDEQ93hMBr1iUYqIfK3+LZrF5CumVRE1qGS+n7Ac/44Tj
	2Zuqyn0sAP4VV3G5tjwkwLjovPRQ28GJEfCrNg37jQuiVpkqeKJfyOyLEuyRi21LqTMsudqXaym
	l9SaeHfTGZQC4bMkcvptjhchIZHpiPgloqHsvbUVCdUxwz1T7SIq+qhhxY6FcMyKhrcaAQb1Wfk
	mGby4e1WZlN0HcEcPbzGXnH/oToF9rb3BuuuO51DzOgyTfxhSAskFqrmjcXNOrG/pyDNxzVE8eU
	+o5Hu9FS+cKgfDmXzzkmOJ6y9ourheNxFsOdOajIwpADlesyu7Jo
X-Received: by 2002:a17:907:e149:b0:c2a:fcb7:62f2 with SMTP id a640c23a62f3a-c2afcb76e12mr569341466b.19.1790691865370;
        Tue, 29 Sep 2026 07:24:25 -0700 (PDT)
Received: from [192.168.0.46] ([63.135.75.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bcacfsm453243466b.74.2026.09.29.07.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:24:25 -0700 (PDT)
Message-ID: <0e1a1284-7069-4c46-9f35-57c10c129883@gmail.com>
Date: Tue, 29 Sep 2026 15:24:24 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Audient EVO4 hardware volume control now requires
 quirk
To: Takashi Iwai <tiwai@suse.de>, Faaris Ansari <faarisansari@googlemail.com>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-sound@vger.kernel.org,
 =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
References: <CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com>
 <2026-09-27-daily-reply-0001-re-audient-evo4-mixer-put-errors@kernel.org>
 <CANBVYRAr_ShKGmrt2NoqsDsDEbTXa5DWJbq2oP6wKLWJQpLRWw@mail.gmail.com>
 <2026-09-28-daily-reply-0001-re-audient-evo4-upstream-decision@kernel.org>
 <ee6e9e8f-e174-4872-baee-114d848e8137@gmail.com>
 <2026-09-28-2-daily-reply-0001-re-audient-evo4-channel-3-set-cur@kernel.org>
 <87tsn838gk.wl-tiwai@suse.de> <87mrt01bdg.wl-tiwai@suse.de>
 <87ecec19pa.wl-tiwai@suse.de>
Content-Language: en-US
From: Faaris Ansari <faaris.ansari@gmail.com>
In-Reply-To: <87ecec19pa.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Takashi and Sasha,


> Faaris, please let us know if this (or previous) one actually works
> for you.  Once after confirmation, I'll submit the proper patch for
> upstream.

I tested your latest patch where you removed the quirk for the iD14 
alone, and instead set it for all Audient devices.

I can confirm that this has indeed fixed the problem, and I can now 
correctly control my hardware volume without problems, thank you!


> ... or if you have a chance to test Christian's patch set and verify
> whether the problem is fixed there, we can avoid other changes:
>    https://lore.kernel.org/20260919151840.24371-1-arc@gmx.li
I tested Christian's patch alone, without any other changes. The problem 
still occurred with those patches.

This was also noted by Christian:

> As a matter of fact, I made a similar
> observation to yours when testing the patch set on the 'sound' kernel tree
> and the (very sporadic) issue did not disappear after applying the
> patches.
And further discussion below:

https://lore.kernel.org/all/CANBVYRAr8iFGFDgdTcDXuQyXt5M4TddZetsG9o1wbFao03R0yw@mail.gmail.com/


However, using both patches together (as well as a small patch for 
alsa-ucm-conf) has made my interface work very well - I'm very happy 
with these changes :)


Thank you for your work, Sasha, Takashi, and Christian,

Faaris


On 29/09/2026 14:14, Takashi Iwai wrote:
> On Tue, 29 Sep 2026 14:38:03 +0200,
> Takashi Iwai wrote:
>> On Tue, 29 Sep 2026 07:58:03 +0200,
>> Takashi Iwai wrote:
>>> On Tue, 29 Sep 2026 00:39:05 +0200,
>>> Sasha Levin wrote:
>>>>> [   80.940668] usb 3-1: cannot set ctl value: req = 0x1, wValue = 0x203,
>>>>> wIndex = 0xa00, type = 4, data = 0x0/0x81
>>>> [...]
>>>>> numid=4,iface=MIXER,name='EVO4  Playback Volume'
>>>>>     ; type=INTEGER,access=rw---R--,values=4,min=0,max=254,step=0
>>>>>     : values=182,182,0,0
>>>> Thanks, that narrows it down.
>>>>
>>>> Every failure is SET_CUR of the Volume control on feature unit 10, channel 3
>>>> (wValue 0x0203, wIndex 0x0a00). That unit is 'EVO4  Playback Volume' and
>>>> advertises read/write volume on all four channels. mixer_ctl_feature_put()
>>>> writes channels 1 and 2, then returns the channel 3 error, so the hardware
>>>> volume changes while userspace is told the write failed and adds software
>>>> attenuation on top. Faaris sees the same on 7.3-rc5, so this is a mainline
>>>> regression from 87a6f2fa6e6c ("ALSA: usb-audio: Propagate write errors in
>>>> generic mixer put callbacks").
>>> Right.  So a simple fix would be to just to set the IGNORE_CTL_ERROR
>>> quirk flag like below.  One of iD14 models has already this flag, so
>>> it might be safer to set to all Audient devices.
>> ... and below is such a version to cover all Audient devices:
>>
>> Faaris, please let us know if this (or previous) one actually works
>> for you.  Once after confirmation, I'll submit the proper patch for
>> upstream.
> ... or if you have a chance to test Christian's patch set and verify
> whether the problem is fixed there, we can avoid other changes:
>    https://lore.kernel.org/20260919151840.24371-1-arc@gmx.li
>
>
> Takashi
