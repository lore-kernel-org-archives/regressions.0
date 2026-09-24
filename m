Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482DF412C0D
	for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282950; cv=none; b=gdrHgq5a3FsJ2G4Iqu58m8usoRix1CSrDlQfovNy4XFZXvnhWeQq/iO5YzXG5fITAs81rKZR01jzq+aIU2UNMqb7QUz40P0nZ66f7YvdN9hfUyoojiXvhZmwCTBIUnfaZaSsY+95/rU4KzsLuImJH4APcz+GY8pOwdF2U2ctMjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282950; c=relaxed/simple;
	bh=6J4sjcwDnE7srXP9gcp/dsM5+BA1Z6oD5HGw7MMQOJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZtljWOHwCKjRCqziXpvWKpt6DvJq4dSuynBEjdZGCniW+dk7OfBOIFYGzdmFFKgOYBwKboKLOxNYroG9jT8ETmU9uZst34ssWHNA5MHXD4fnWxqxzbtRLWRhtN44NMWDl7RaJuFVGQ1cGnDVkyhwYEMK8DMXIMBZ44tdxmb7xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8fdS0Pb; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8fdS0Pb"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so126648f8f.3
        for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 13:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790282946; x=1790887746; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vd+LufZ6D35YzF/7JTG7cG6anNrrQziwRIRL9W+S1R0=;
        b=Y8fdS0Pb1k/Ypc/GRVldUlVpsyhlpGuQiFiBm3KLF+2TXytz9uv0ObgmFKNUKJuTY/
         OEBV8/+6WJxA9sUxQdov9X8qndMso1huepZ/VhD6R7R3qfa0/3JIqLMHL8C7Wne31ka3
         18K7dMz/CnyEzKNMkhhhojrBkXe4/od1rgZLWCG81YseV05yLmFF7zsNyxIhpSW0QOmL
         vOhelKlqvQB9n8ThScXvpN9T3ztyKxKsJAjRmTYiXTRRHEF4s5l54BFqqNl5kN+1Gt//
         2nBzq6Zfl4dvBKLacAjR+x5wgBNMSbS+yclIJBOECpSXobU0gHnkuYyfHOD9fc2zrDoP
         TMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282946; x=1790887746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vd+LufZ6D35YzF/7JTG7cG6anNrrQziwRIRL9W+S1R0=;
        b=a48nZQ/KO+Noz7Oy0u8XX+NsIo2XJEK4PdfY5hZRjSp8zE0PFXyrRl9nQ+DX54e5Ih
         /qjvYMVnfy60RKbfRCs4sItGxhvD5WbGc3h/364hTgSSwyvV2uN54hvImz0a4BxubDJC
         df5Ryi1hS7+cH+BPUJugKgszT0BtQA2uwJSUxBUdbj9sNkNm2nr8f9CDFRDO1IepTez1
         SqFki6HaoKB+jSPeH+1N1F9HrFwV/+B5H9VT5SqqXcin/xFU9V0xWwKBzEjwBC+jkJ7u
         RlQ+wxp1Wr7CljdB9W0RRkBB4l5cyIiSqS0HcXHOoFV4JzTRrPYUWhxdA+gFEEiJpnen
         KpgQ==
X-Gm-Message-State: AFuF++lCiuQ9B+l/0LzX9qPiaiMWBk4t4sGUgTXMzwz1NkwqWTDWTZv4
	fSPO17A2IowiR+PkDQRUyo42MzCDL5YcjQYnjjO9fgKQRl2Og4X3CuqW
X-Gm-Gg: AYBFou0cDALB7/emmLBYL1+UHaTYVvaF9c8ImLrD2RvMQ9bVu9y7NvwyK/KGg//Jb3Z
	2J4ALWpADeHgZzj8YE3z0qNQyVVZdqlzkqbi2SqnymLr96FQQ1pzJe5AaziiP7U2JE5lqCRm16C
	ETXGulwlGNMa8sW9tJCrV9ZiLqzWXRTgTn8XEoQa1p0YA9/9ds1SPZIZI2zZW+j0Ru5B2jub4PW
	hNRnivJyw7oMQkaiYXOn8mWGdIMsQkcpHkYymHWo/vRSDBuzlUolrVRaGs3JKrz6QS1StX2/6lA
	2D3MJwupHiJok20NVJ0cVbT8D6WsUUgy6nKR3AaQCIn/ik9ElA0eLHJeqDiQzHSd4hwhFJes4WO
	CgUPDp3k85ff4/vq+c2bcBeG34YfxBDUomF4PotNdwqTJ9CpdOJ5d8dx3CwzHM00p6G55khQzWC
	ApiNcftBHBruzARTX7Fk1OAv4/NWCvyFgx18VCL86BtJJxivQGYCucr1octTvTsK5TZCmcBt8oX
	MCg
X-Received: by 2002:a05:600c:4688:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49fe66c61fcmr67953755e9.13.1790282946373;
        Thu, 24 Sep 2026 13:49:06 -0700 (PDT)
Received: from [192.168.0.46] ([63.135.75.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee6cc7afsm6246445e9.2.2026.09.24.13.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 13:49:06 -0700 (PDT)
Message-ID: <2ccbf3cd-e6cd-4f46-97cb-a288a2d16905@gmail.com>
Date: Thu, 24 Sep 2026 21:49:05 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ALSA: usb-audio: Logitech PRO X Wireless 046d:0aba
 playback volume rejected as sticky
To: Rong Zhang <i@rong.moe>, "Alexander N." <adventureFAN@gmx.de>,
 linux-sound@vger.kernel.org
Cc: regressions@lists.linux.dev, tiwai@suse.de, perex@perex.cz
References: <6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de>
 <c61e9568284fd0cd1580eb2b568700074c73e123.camel@rong.moe>
Content-Language: en-US
From: Faaris Ansari <faaris.ansari@gmail.com>
In-Reply-To: <c61e9568284fd0cd1580eb2b568700074c73e123.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi there,

It seems I'm experiencing this same bug with my Audient EVO4 interface.

The volume when controlling it via the hardware knob is as normal, but 
trying to modify the hardware volume through software like pwvucontrol 
or wpctl causes the volume to decrease drastically.

I originally reported that here as I thought it was a wireplumber issue, 
it appears instead to be a kernel regression between 7.1.13 and 7.2.4 
somewhere.

https://gitlab.freedesktop.org/pipewire/wireplumber/-/work_items/1022

On 14/08/2026 14:17, Rong Zhang wrote:
> Hi Alexander,
>
> Thanks for the report.
>
> On Fri, 2026-08-14 at 12:41 +0200, Alexander N. wrote:
>> Hello,
>>
>> I found a regression in snd-usb-audio affecting the Logitech PRO X
>> Wireless Gaming Headset (USB ID 046d:0aba).
>>
>> The device has a valid UAC1 playback volume control, but the sticky mixer
>> detection introduced by commit 86aa1ea1f15c ("ALSA: usb-audio: Do not
>> expose sticky mixers") rejects it.
>>
>> Hardware
>> ========
>>
>>     Logitech PRO X Wireless Gaming Headset
>>     USB ID: 046d:0aba
>>
>> Observed kernel
>> ===============
>>
>>     7.1.5-ogc5.1.fc44.x86_64
>>     Bazzite/Fedora 44 OGC kernel
>>
>> The OGC patch for this kernel does not modify sound/usb, and the relevant
>> mixer.c code matches upstream Linux 7.1.5.
>>
>> I have not hardware-tested current mainline 7.2-rc7, but current upstream
>> mixer.c still contains the same immediate SET_CUR -> GET_CUR sticky mixer
>> test and I could not find a device quirk for 046d:0aba.
>>
>> Symptom
>> =======
>>
>> Without a workaround, ALSA only exposes:
>>
>>     Simple mixer control 'PCM',0
>>       Capabilities: pswitch pswitch-joined
>>
>> There is no PCM Playback Volume control.
>>
>> The kernel logs:
>>
>>     usb 1-10: 2:0: sticky mixer values (-16384/0/256 => -3840), disabling
>>
>> I have also observed the same message ending in "=> 0", depending on the
>> hardware volume at probe time.
>>
>> Because the playback volume control is removed, the physical volume wheel
>> changes the headset's hardware volume independently of the PipeWire/KDE
>> system volume.
>>
>> USB Audio control behavior
>> ==========================
>>
>> The device is UAC1.
>>
>> Feature Unit 2 exposes a master playback volume control.
>>
>> Direct control requests, after temporarily unbinding AudioControl
>> interface 0 from snd-usb-audio, report:
>>
>>     GET_MIN = -16384  (-64.00 dB)
>>     GET_MAX =      0  (  0.00 dB)
>>     GET_RES =    256  (  1.00 dB)
>>
>> GET_CUR and SET_CUR both work, but the device has two quirks relevant to
>> the new sticky detection.
>>
>> 1. GET_CUR reflects normal SET_CUR changes with a delay of roughly 50 ms.
> Interesting.
>
>> Measured from 0 dB:
>>
>>     target     result   first visible GET_CUR change
>>
>>      -1 dB     OK       81.3 ms
>>      -2 dB     OK       51.9 ms
>>      -4 dB     OK       47.3 ms
>>      -8 dB     OK       47.1 ms
>>     -16 dB     OK       51.7 ms
>>     -32 dB     OK       47.2 ms
>>
>> 2. The advertised minimum value -64 dB is not functional.
>>
>> A direct SET_CUR to -64 dB returns success, but GET_CUR remains at 0 dB
>> even after 1000 ms.
>>
>> This appears to cause a false positive in check_sticky_volume_control():
>>
>> - cval->min is -16384 (-64 dB)
>> - cval->max is 0
>> - if the saved value is 0, max is skipped
>> - SET_CUR(min) returns success
>> - an immediate GET_CUR still returns the saved value
>> - the mixer is classified as sticky and is not registered
> Super interesting.
>
> Maybe some previously reported devices were broken because of the same
> reason.
>
> I think, the sticky check could be more precise in this manner:
>
>     res = (cval->max - cval->min) / 16; /* Check approximately 16 values. */
>     if (res < cval->res)
>     	res = cval->res;
>     else
>     	res = roundup(res, cval->res);
>     
>     for (i = cval->min; i+= res; i < cval->max) {
>     	if (i == saved)
>     		continue;
>     	SET_CUR(i);
>     	check = GET_CUR(i);
>     	if (check != saved)
>     		break;	/* Fast path. */
>     	/*
>     	 * Wait for asynchronous mixers. This sleeps for no more than 160ms
>     	 * in total, which should provide some time for the mixer to change
>     	 * its value.
>     	 * Note that there is no need to wait between SET_CUR and GET_CUR,
>     	 * as we don't care whether the GET_CUR value matches the SET_CUR one.
>     	 * What we expect is just a GET_CUR value differing from the saved one.
>     	 * It this manner, most devices should go through the fast path without
>     	 * extra sleep.
>     	 */
>     	msleep(10);
>     }
>     [...]
>
> This should classify your device as non-sticky.
>
> I will find some time to write a patch for that. I would be grateful if
> you can test it then.
>
> Thanks,
> Rong
>
>> mixer_get_cur_broken is not appropriate
>> =======================================
>>
>> I tested the mixer_get_cur_broken quirk.
>>
>> GET_CUR on this device is not broken or constant. It correctly reports
>> host SET_CUR changes after the device delay, and it also reports volume
>> changes caused by the physical headset wheel.
>>
>> Using an internal-only cached value would therefore lose useful hardware
>> state.
>>
>> Local proof-of-concept fix
>> ==========================
>>
>> I built a local snd-usb-audio.ko against the running 7.1.5 kernel.
>>
>> For this specific device, Feature Unit 2, UAC_FU_VOLUME, I:
>>
>> - clamp the unusable minimum from -64 dB to -63 dB
>> - skip the probe-time sticky/resolution checks for this control
>>
>> With that module, ALSA exposes:
>>
>>     Simple mixer control 'PCM',0
>>       Capabilities: pvolume pvolume-joined pswitch pswitch-joined
>>       Playback channels: Mono
>>       Limits: Playback 0 - 63
>>
>> /proc/asound/card*/usbmixer shows:
>>
>>     Unit: 2
>>       Control: name="PCM Playback Volume", index=0
>>       Info: id=2, control=2, cmask=0x0, channels=1, type="S16"
>>       Volume: min=-16128, max=0, dBmin=-6300, dBmax=0
>>
>> Most importantly, no userspace workaround is required once the mixer
>> control is restored.
>>
>> Example before rotating the physical headset wheel:
>>
>>     ALSA:     -27 dB / 57%
>>     PipeWire: 0.35
>>
>> After rotating the headset wheel:
>>
>>     ALSA:     -11 dB / 83%
>>     PipeWire: 0.65
>>
>> KDE system volume follows the physical wheel as expected.
>>
>> I attached the proof-of-concept diff and the measured results. I am happy
>> to test a maintainer-preferred implementation or additional diagnostics.
>>
>> My suspicion is that this device exposes two assumptions in the sticky
>> mixer probe that are not universally safe:
>>
>> 1. GET_CUR is assumed to reflect SET_CUR immediately.
>> 2. advertised min/max values are assumed to be usable test values.
>>
>> Thanks.
>>
>> #regzbot introduced: 86aa1ea1f15ce6b56ac1b4c0d9b88a07a5b9bf03
