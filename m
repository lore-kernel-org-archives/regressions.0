Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30D280324
	for <regressions@lists.linux.dev>; Mon, 12 Jan 2026 20:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250905; cv=none; b=ORJ3WXWBAYV6CiNYC/uO/uFdQN1xYM9UaHaBDRYLpXK9daMOMQQWmGvBgrmYvvxQRtPPGUlafFqOyATnD7Km2s3tj/rPluftRursajNat6F7fURpvbAolHr4pdikjW4fA67+mk5FCe3oOWciFfB/CgDdefmmkzvM3B/g1faUkeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250905; c=relaxed/simple;
	bh=9Ghd4y1vzzwmLGCQBkUgixF5wHZfdAbgBykT6GYFYOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/6VjY1mymjw2G9Z0zkqN+pRNNxrWd4g3gQIULvzLTVRQeVsgVh7W1TdRkIwW+N19hxNIuYuisQr1ET9gUfynQo6Rq5MJWG1AyL85/rjFkLIiRY4s/sfBxaZBemUG9TxY7MD9q2ZB79JBe5vkAf7hwrPTHj5zPceoM+bcwPGUcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RSRYgznG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RSRYgznG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so64674495e9.3
        for <regressions@lists.linux.dev>; Mon, 12 Jan 2026 12:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768250902; x=1768855702; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HNofD1HxaC2o6B0ekPYIm3Vf2/HOdfXWeC4iCJl6B/M=;
        b=RSRYgznGdSGvSuu4x/Mm96bP1CgSoYiYIDQeAwhIUjRnhoM2KxhtL1pZ9cc7tPTNzC
         SMKONAnsn0Vv3361mN3JbV09Nz7mwCwVJuPa3CTXVEuZ7oGDKATN8SvH8bf1s0HKNTCP
         U0WQbyj+WFT2PGVTd8wzp3GLaQFPexoHEykJCj3xjyETkS3jSXWbzurQYfJo99aCDHQc
         2mjKnflb8Cmyr5Q3pb1xHoRasUxCGktUgrqBZY1ZJ9NiL54mB3m5sD0upWOd3WJ8kj9W
         Ew8AqYXeh/HbfbhgRsa6ycAoHk+Z+1uyKdJbpR4NfcrCZ8GV48a0jQheAw3rn8RB+LHZ
         pLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768250902; x=1768855702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNofD1HxaC2o6B0ekPYIm3Vf2/HOdfXWeC4iCJl6B/M=;
        b=L4ywNUc0PL009/gVW+aFhITlgFbJ0S04hjwdYCpWHm4d/3bsrs4doRm2TNbNhcVEfJ
         LA1RQSuBjYf8+/CildUNNV13yoNYFX77FTRyi9alT+hHmqYxSIxHis9bUdwfbuBh11pC
         cvKK1D6yFLBYYLYISPwqTzCCJnXFsGJEKhZc/YXuzrl1w5ZfxJQaj/lPJ/JoQzTN8EFN
         2aRb8ZJ71lXD4nmC/kj7ZcYFMIQJ9rx1o7WpkD/fH7gdOX2vX5xMuaKecK/b9+Nal0pi
         d1S9+TvoeuymUdgV+cvbZ5bFvNdf/HOA+aw9g0LqIeTzRqg6nkkYsfv/I/CI09gjjdEp
         qaTg==
X-Gm-Message-State: AOJu0YxGeus1JEFmXffMP1fQ/zBSQUN1NEXzVnUbI0NHJdFJGfHq+zKZ
	9wsdZd8Ws2leYA8WjOJChFY7QRQk+w/tVFt6VwJYkg3ZmGK+AlTlG/mqET98GDjavxM=
X-Gm-Gg: AY/fxX5Fz3j9Y8g4CITMIP/1rUxGDEnpJ3eihJDVjZOdbqZgHtATJSOhQF+yrsg/dGs
	iuFKy4LTUY0uQrAqyHKofIzqKLPrqO8UAgOfT5IgM2XNLGWcHxhMZ/nmNQuFw8DveWp1EmCU/z4
	EvGhAAWbSSxjof4fMmimncTlgNjobMENilR83cdv2IAmRAbE69mJPyhWh15sCcJpS8fwVzwlYYi
	0hEHbJ+VWige/jayZOr7j+6bIPQBqPggUHUFiZET9F9liFLbHom6rtYOx4QscZE76wXX9IKsJrH
	Yaj6ILX5gHDIGM/91S975Shd8G4XBcubR0a3OidCJygfMRmJ6kkTybqa8MBcasghgLzT8w7+wW+
	+cQ+G4p+7cGUShCkPQ7mtSGs3nn8/67Av4EFdTOg0Vj1yn9UqoGU3FEVu5RuI0pKx63n4P80O6X
	WqEmsXMrh9uII3jXEXvSiyQS99SNadrLtZ8ia1+rU=
X-Google-Smtp-Source: AGHT+IH9s93gkmuBttrS+h/XBMHT7i1Su2lrCzfBTYN/NbKyqiB7rnoNQUcvLStIfPiEyeMFbmwjfQ==
X-Received: by 2002:a05:600c:820f:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-47d84b32f09mr194610825e9.22.1768250901940;
        Mon, 12 Jan 2026 12:48:21 -0800 (PST)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a51dsm184311955ad.18.2026.01.12.12.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 12:48:21 -0800 (PST)
Message-ID: <07600bff-a6dc-4b86-9dd6-aa5077ca8b09@suse.com>
Date: Tue, 13 Jan 2026 07:18:14 +1030
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] VirtualBox VM crashes (BSOD) during Windows
 installation on btrfs with kernels 6.18+ (works on 6.12 LTS)
To: jollycar <jollycar@proton.me>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <sT06uA3Gtv1kgeL80ZRMshbw6whJNUom-UxnS06H6eVrB4AqGWuzo0P23AhwOn3WsnAq9QfhFYciSAWK3eBeGaKjNJG1oSQLyclv4d2E0L4=@proton.me>
 <5b466d2f-80ad-4b45-a643-ab64bf2b252d@suse.com>
 <LCM3zm3y1s51pkWBZg6NU-4R6f89SVYSAxtNqq0gM5IlDFZfFjwSqvl-8yAvYcl7VizHjXIENm1vf6b7z2e25YQce7IQCr3Ms-w6vKkOKfY=@proton.me>
 <20c3ba51-fbf1-4de2-b88f-5edf817a24d6@suse.com>
 <FmCqd98aDZ5GTLc-1FUc4NRHRhDEDUDy1ylzO4rrFy_mV1zgC2tnmht5ov8px3ME3pBa6dioALVRD_tDKC3FhdUd4alND6G5g2bx8N7R154=@proton.me>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <FmCqd98aDZ5GTLc-1FUc4NRHRhDEDUDy1ylzO4rrFy_mV1zgC2tnmht5ov8px3ME3pBa6dioALVRD_tDKC3FhdUd4alND6G5g2bx8N7R154=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/1/13 02:03, jollycar 写道:
> Qemu/libvirt test results on kernel 6.18.3:
> 
> Setup:
> - Virtualization: qemu via libvirt (virt-manager)
> - Disk format: qcow2
> - Disk location: /data/virtual-os/win10-qemu-test.qcow2 (same btrfs subvolume as VirtualBox VMs)
> - COW disabled on disk image (chattr +C)
> - ISO: Same Windows 10 ISO used in VirtualBox tests
> - Guest: Windows 10
> 
> Result:
> Windows 10 installation completed successfully without any crashes. Installation proceeded through all phases including multiple reboots and reached the desktop without issues.
> 
> Summary of all tests on kernel 6.18.3:
> - VirtualBox 7.2.4: Crashes during installation (all cache/mtype configurations tested)
> - Qemu via libvirt: No crashes, installation completes successfully
> 
> Both using the same btrfs filesystem, same subvolume location, same Windows ISO, and COW disabled.

Thanks a lot, this looks like there is something wrong related to the 
VBox out-of-tree kernel module.
In that case, the btrfs community is not going to help much unfortunately.

Mind to share how is the out-of-tree kernel module installed?
The pre-compiled one from the distro? The DKMS one or something else?


And just some guesses, can VBox specify what type of CPU (and extensions 
like SSE/AVX) it uses?
If so (like qemu), mind to check if you can specify some CPU types 
without some newer extensions while still meets the minimal CPU 
requirement of Windows 10?

I'm wondering if it's some extension handling not done properly, which 
is commonly utilized by checksums.
Thus triggers the checksum mismatch errors inside Windows.

Thanks,
Qu



> 
> 
> On Sunday, January 11th, 2026 at 8:43 PM, Qu Wenruo <wqu@suse.com> wrote:
> 
>>
>>
>>
>>
>> 在 2026/1/11 21:39, jollycar 写道:
>>
>>> Storage configuration details:
>>>
>>> Storage format: VDI (VirtualBox Disk Image)
>>> Storage location: /data/virtual-os/ (btrfs subvolume with COW disabled, verified with lsattr)
>>
>>
>> OK, this means it's not related to the direct IO changes in newer kernels.
>>
>> When COW is disabled, data checksum is also disables, thus direct IO is
>> still doing the true zero-copy behavior.
>>
>> This ruled out the btrfs direct io change, but this means I have no clue
>> what is going wrong at all now.
>>
>>> Controller: IntelAhci (SATA)
>>> Default configuration: hostiocache on, mtype normal
>>>
>>> Cache and media type testing on kernel 6.18.3:
>>> - Default (hostiocache on, mtype normal): BSOD within 1 minute during installation
>>> - mtype writethrough: Gets much further, BSOD occurs on first VM reboot
>>> - hostiocache off (mtype normal): Gets much further, BSOD occurs on first VM reboot
>>>
>>> None of the configurations provide a working solution - they only delay the crash.
>>>
>>> On kernel 6.12.63 with default settings (hostiocache on, mtype normal), Windows installation completes successfully without any crashes.
>>>
>>> I have not yet tested with qemu/libvirt. Should I proceed with that test?
>>
>>
>> Yes please. Libvirt/qemu is a more common solution among developers.
>> If you can reproduce it using libvirt/qemu, more btrfs developers can
>> try to reproduce it and look into it.
>>
>> And if not, the cause may shift towards vbox other than btrfs.
>>
>> Thanks,
>> Qu
>>
>>> On Sunday, January 11th, 2026 at 10:15 AM, Qu Wenruo wqu@suse.com wrote:
>>>
>>>> 在 2026/1/11 20:33, jollycar 写道:
>>>>
>>>>> #regzbot introduced: v6.12..v6.18
>>>>>
>>>>> [1.] One line summary of the problem:
>>>>> VirtualBox VM crashes with BSOD during Windows installation on kernels 6.18+ (works fine on 6.12 LTS)
>>>>>
>>>>> [2.] Full description of the problem:
>>>>> Windows 10 and Windows 11 installation inside VirtualBox consistently crashes with BSOD within 1-3 minutes on Linux kernels 6.18.3 and 6.19-rc3. The same VirtualBox configuration and VM image work perfectly on kernel 6.12 LTS. The BSOD errors vary each time (most recent: 0x80070470 - "file may be corrupt or missing"). The host system remains completely stable with no logged errors.
>>>>>
>>>>> [3] Kernel & Hardware:
>>>>> - Kernel versions tested:
>>>>> * Working: 6.12.63-1
>>>>> * Broken: 6.18.3-2, 6.19.0-rc3-1
>>>>> - Distribution: Manjaro Linux
>>>>> - Architecture: x86_64
>>>>> - VirtualBox: 7.2.4 r170995 (vboxdrv vermagic: 6.18.3-2-MANJARO SMP preempt mod_unload)
>>>>>
>>>>> [4.] Filesystem and storage:
>>>>> - Root filesystem: btrfs on LUKS encryption
>>>>> - Mount options: zstd compression level 3, SSD optimizations, async discard, free space tree
>>>>> - VM storage: separate btrfs subvolume
>>>>
>>>> What's the storage file configuration? Like what's the cache mode setting?
>>>> I don't know VBox at all, but there may be something similar to
>>>> libvirt's cache mode (none/unsafe/writethrough etc).
>>>>
>>>> More importantly, will tweaking the cache mode change fix the broken
>>>> kernels?
>>>> If so it may point to direct IO related behavior changes.
>>>>
>>>> And what's the storage file format? QCOW2? RAW? Or whatever format
>>>> provided by Vbox?
>>>>
>>>> And one final question, have you tried qemu (or libvirt + qemu) and can
>>>> it still be reproduced with qemu?
>>>> As I'm wondering if the direct IO related change will even affects qemu
>>>>
>>>> Thanks,
>>>> Qu
>>>>
>>>>> - btrfs device stats: all zeros (no errors)
>>>>>
>>>>> [5.] Reproduction:
>>>>> - Boot kernel 6.18.3-2 or 6.19.0-rc3
>>>>> - Start VirtualBox 7.2.4 r170995
>>>>> - Create new Windows 10 or Windows 11 VM
>>>>> - Begin OS installation
>>>>> - BSOD occurs within 1-3 minutes with varying errors (latest: 0x80070470)
>>>>> - Issue is 100% reproducible on 6.18+, never occurs on 6.12
>>>>>
>>>>> Additional context:
>>>>> - Host system remains completely stable during VM crashes
>>>>> - No btrfs errors in dmesg or device stats (all zero)
>>>>> - Issue persists across multiple 6.18/6.19 releases over one month
>>>>> - VirtualBox 7.2.4 modules load successfully on all kernel versions
>>>>>
>>>>> Regards,
>>>>> Jollycar

