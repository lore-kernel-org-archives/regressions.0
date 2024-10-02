Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA184A36
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 22:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727908629; cv=none; b=qgMUIkv+AUCoqNfbJynexgrD8wrUM0JtlfBT00S6G7svYUHViIJFCzSDZJMP7xg3n1I612y+EyTmHIrwEHUElpojd3mnMctaCIq2VvxXBpeN0PujHBPZooB4au/AbRFYHwX0OPMzfHNHd7BIRLv1XkhL93Jc7mKN2lIbnwOs06I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727908629; c=relaxed/simple;
	bh=YG/WzHKAh+OGPuvTSKg0BMXn+1+sA+cJiGs3wG406yY=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:References:Subject:
	 In-Reply-To:Content-Type; b=qF3KuL1VGNo8eA08Fij+zdl7EMLLF1ZYX4NJgltZOo5v6dVjKOPUnT8JKgphsFMWCIKIfEMcDAAFcnyqKZv9MWu7LNwqDrMpFZKuYG5NZWXYc2s678Y5wqFKtLuo8LyioVHhb94Nf+9eMvggTnxj4CqLAzzyObWcBfKMHc9UcO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFLQV1ID; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFLQV1ID"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53988c54ec8so297332e87.0
        for <regressions@lists.linux.dev>; Wed, 02 Oct 2024 15:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727908626; x=1728513426; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:subject:content-language
         :references:cc:to:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePHA9DQSUv2xWAl3S70jyFHw9nZzSBBRS5FM3MDw++M=;
        b=KFLQV1IDIIPVYdUC/yhppGOYqRDXqb/AdY8AWG7DFSJXqXj3Xh5G2HYDapt25Qbrii
         uxEpiC3yLXwHPUsJTLUhTWzmaMyzWdU7En3drKlZr99cAuaP0UTRV5MugD9gFeMAGU7U
         77Rv9LBOSASVr8PmdG2jyrdMFFDTKHbng34XJuUgp23dQPfn20Mt45/vVOKKpvI9cJkE
         WOt/wIlkfW7g8l7Uqq+ULwDTnPS8V7N2fm1HTsUXiXAjV5MyGWKHGZwwHJJ11Q5dSyxu
         5JamjhbOflZ5Hoj3QfpnhRU0rN85HPYxOgHeW8g6nfl7yRSS1F5Chuj8r8FJ82hGVLxP
         FovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727908626; x=1728513426;
        h=content-transfer-encoding:in-reply-to:subject:content-language
         :references:cc:to:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePHA9DQSUv2xWAl3S70jyFHw9nZzSBBRS5FM3MDw++M=;
        b=ARCylzW39EcfQi7cpSxXmr/KUm0vjctMB0sw8znP37g93fOMzQCuSHfxEDWdn3G/x9
         9Oq4zOdfxO9x1154ueZBrNgYJKv+L9NLbNBEj21CTVX/YCAh/SMA4Zcr+vaZm6ARCHsf
         k0NQrOompDdxH+9my2qxkzIrnnn16QLxpbgDLjIZT+aRu1p5lIQXa4lIcgUAP8VID4kl
         v1NR+U8q52J73c4TKHZYVM1Q9LFiM4yWXd3xmCkSHu9G+hn+e5Fprl+VaZ1pKkFcyC8w
         EJOdJWVlHl945O97+DyrC/nLx3komdrGBf46wkTv92MkdbbGnTd5X7ooev6CNMeqkqvY
         B0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUjpkQ60nY6nzmDPxj+kHZ+fEmfzvy2YyV/OPkcT3eCzhFym7Lp2l09QirLdsFOuzxGmB28MacOmGTmlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbkw3abe3Rs9kh8M2j2vNq/q53IsffDW+xzX4QGPeyFeZPmezq
	HMLzcBaULvg6FA5jHI4MoYRLCpM89JtItXV7r8xP02NbuS1IPTz5
X-Google-Smtp-Source: AGHT+IG30+krPqTeRIPJo2EP9YM4g29RWB25SsJKbD6FuU2IoZH7FY54xsfrSn8DWnblxC7D9juxSQ==
X-Received: by 2002:a05:6512:ad2:b0:536:a4e1:5fa2 with SMTP id 2adb3069b0e04-539a067bbe5mr2466025e87.26.1727908625605;
        Wed, 02 Oct 2024 15:37:05 -0700 (PDT)
Received: from [10.130.138.83] ([178.255.149.133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a8256807sm5574e87.71.2024.10.02.15.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 15:37:05 -0700 (PDT)
Message-ID: <adbc3511-7c52-4262-b8aa-121ee0b51ea3@gmail.com>
Date: Wed, 2 Oct 2024 18:36:55 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jerry Luo <jerryluo225@gmail.com>
To: Takashi Iwai <tiwai@suse.de>, Christoffer Sandberg <cs@tuxedo.de>
Cc: christian@heusel.eu, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, perex@perex.cz, regressions@lists.linux.dev,
 wse@tuxedocomputers.com
References: <87jzfbh5tu.wl-tiwai@suse.de>
 <ea6e5168-238f-41f5-9600-36b75ed990a1@gmail.com>
 <87jzetk2l0.wl-tiwai@suse.de> <b38b5947482a5ca4b55e0ddb908c2f34@tuxedo.de>
 <87seteli51.wl-tiwai@suse.de>
 <d348ca06-38ca-474f-8673-dff2248331e5@gmail.com>
Content-Language: en-US
Subject: Re: [REGRESSION][BISECTED] Audio volume issues since 4178d78cd7a8
In-Reply-To: <d348ca06-38ca-474f-8673-dff2248331e5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/2/24 5:28 PM, Jerry Luo wrote:
> On 10/2/24 10:00 AM, Takashi Iwai wrote:
>> On Wed, 02 Oct 2024 10:21:22 +0200,
>> Christoffer Sandberg wrote:
>>>
>>>
>>> On 30.9.2024 09:44, Takashi Iwai wrote:
>>>> On Mon, 23 Sep 2024 21:37:42 +0200,
>>>> Jerry Luo wrote:
>>>>>
>>>>> Hi Takashi,
>>>>>
>>>>> On Mon, 16 Sep 2024 19:22:05 +0200,
>>>>>
>>>>> Takashi Iwai wrote:
>>>>>
>>>>>      Could you give alsa-info.sh output from both working and
>>>>> non-working
>>>>>      cases?  Run the script with --no-upload option and attach the
>>>>> outputs.
>>>>>
>>>>>      thanks,
>>>>>
>>>>>      Takashi
>>>>>
>>>>> Issue now reappear, output from alsa-info.sh are attached. If they
>>>>> are still
>>>>> needed.
>>>> Thanks.  The obvious difference seems to be the assignment of two DACs
>>>> 0x10 and 0x11 for headphone and speaker outputs.
>>>>
>>>> Christoffer, how are those on your machines?
>>> I attached alsa-info from the Sirius Gen2 device.
>>>
>>> Comparing the working/nonworking of Jerry, yeah, the assignment of
>>> 0x10 and 0x11 looks switched around. I don't see what difference this
>>> would make. Also, node 0x22 has "bass speaker" controls in the
>>> non-working version.
>>>
>>> Comparing the Sirius Gen2 alsa-info with Jerrys, to me it looks like
>>> the non-working version corresponds to our working version.
>>>
>>> I would expect the non-working version to happen all the time though
>>> with regards to the "bass speaker" controls. Why would this only
>>> happen sometimes?
>> Thanks!  The assignment of DACs depend on the pins and topology, so it
>> can be a bit sensitive.
>>
>> Now looking more closely at both outputs, I wonder how the commit
>> breaks pang14.  Maybe it has a PCI SSID 2782:12c5 (or 12c3) while the
>> codec SSID is 2782:12b3?  If so, the patch below should fix.
>>
>> Could you guys try it and verify whether it fixes for Pangolin and
>> doesn't break Sirius?
>>
>>
>> Takashi
>>
> It does seems to fix the issue on Pangolin. It might worth mention 
> that the headphone output will have the same issue when the speaker is 
> not working. Now they are all good. Thanks!
>
>
> Jerry
>
Okay, after some testing I can only conclude that the headphone is not 
consistent in term of the issue. Now it works fine regardless of the patch.
