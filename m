Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA883314AB
	for <regressions@lists.linux.dev>; Sun, 11 Jan 2026 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768126554; cv=none; b=F4dhdOkwN32lNwIWjhhISR4dWZ3mavBuEKvcgd29CJnRVs6xflARf0NLGKMJ+mvU9yyR60IGRrNITyAaJXbC0LL2LFjrXtnfV7qBfQpVPHw9y63TOs/Gm/T1ajrBHAFmZ1vPk8OfkmHbS5yn7xmkN6GB86Z+m4hxSulgIlS7P/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768126554; c=relaxed/simple;
	bh=1tTqJp6L+Ndt1xsDEEwHPw/wH7LSEp5GBi/YIhe6dVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsZfWKkOlI86P38NZaUw5iYCWMvKLy73sW/3r5EcrLd2Il4ihsdWllgutfdxQClUZ5ceRPfGKNEmzGRIilJr5tRnEobt5lG/qkDqS7i84Nafo7Inj+Q6/2wSD1DyYD5vAjyjtkQ4/zRI2nchFaFVX4U0Qe5eMUf18fCeL0PlnE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eJrV3WDo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eJrV3WDo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477563e28a3so29315785e9.1
        for <regressions@lists.linux.dev>; Sun, 11 Jan 2026 02:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768126549; x=1768731349; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0S+MIMnV3MqLsiqHsODr2T4OiyiFPMHA2hmX0+AB3Ww=;
        b=eJrV3WDovZGfr7YXIcKHoB2fPT6a+GiztXYiwT7d0zCxj4otbNH57FqLk+vhFIFiJU
         of43WrBmhiN1Eaf3TBxUX/P2IPS9zL49ZoLqvv7vAspJ4ucK9GSOWKAyPGTg4I9l6rg9
         66UnQmOr9LQV4lqMqeXmdiuGD3f6vsNppVJ6pkN2bYsCYh0sit8JpE9fNkkB1yIkg/GW
         q91077sgylyWgDbIk4zlAkwKScuhSOcpHXDbXqlyU72qPIXFAXUAccFexSxpybLRfe4O
         okObrTYNIBHyIa6dbfNwGHt+IgeJ2qkXYNyqyeZxBzd5Lg8dYFqIKaWNHmIY+KGVCDeC
         svOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768126549; x=1768731349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0S+MIMnV3MqLsiqHsODr2T4OiyiFPMHA2hmX0+AB3Ww=;
        b=Pqc8oIl6vjU2idLtNZz02jz4rgBsFxEAPWEHaM/03gQV6i4ltbtt+j7lbbfJ8q2d+N
         XV6f6+LFIo88cWNtHYuw9fL6rhAFF5ecazkazGzeNgwxWv4uHteAjK6z7zYFQN8gRErl
         4NahI0xcWo4Rf7jSvpA53yBQbpikrQgC+D0vwt9n2iSjd40luyQMlsQNV4BCx/6YOWW5
         uv5+UjP84EjWFn+s3bRzd/atOF4Mx8g3rPve+2sWOa2sTLHk594GdmUgf8Frds2w6zt9
         cXXpDMEhXU42NOnGfilYIGfkZ/Ah+FAzH8mHfd40b3jL4wnYnkz5ZXWgW0LT9cjXfdbv
         vKTg==
X-Forwarded-Encrypted: i=1; AJvYcCUmifs4XBqDUZ6Py5FLEn174QqkK5vLHWx+IvdqZeATMlVLGjaDYW2liJ+euTbaZpyLslWmCrHYK8B7Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFvwnev2/J42+pa+/pEjCSl4SYG3WRpy907HVa+PTvcOFjOND+
	iwdw00YTDNsbZXX84dUqTBR8uia9XNxxF84Dws9YlRzxG6sX8Fh6a/6oDNSiQaSFVUY=
X-Gm-Gg: AY/fxX7LU4Np4JF/yMm30wXAboO/N9kjnbpCDPk/LhxvGWtS69vYpBBj8jX7YpmiVsj
	QZP3mLQU60zTVc9Eswq6AK+SoTuO26u/4WIQU0I9yyinjpjZ0zSdod5W9AqrUzg5kNXVRf9w21O
	I+EHNamIdzKSE2yMyTjJO82ezAAcGLbWOSHvTGFRNZZG6gzVOOCq8OCpY93ZZb93fVmOlqxQuER
	nALsmHpQMfi84/WbzYPheIQuyFuDU2c+ij5CDlAwAuqhbY0wwCccofzeTLS+EP5/CID05oowBCT
	LJJbvMAk9TIrSdUwaGRl0Ni9StTTXEqSNtpgkuhTPJmywn4/hES9BHmO1H6A+YzZP19SJP4ocAO
	4vZlwtktAVHPstUhYVOcZTur7H+RG1WD/igi4sjlUWTm42bWhogRmnbjSQh9YtE7IaZyJuH6VUm
	ApRF9QSVijTf06XIpbJR6V9c+fDl3uuxWkKpK5hng=
X-Google-Smtp-Source: AGHT+IHkN7y1dxP09+Hd+n6x2PwJaIAbnFRdPDtINtufkIfkwCByqk9fSwJ7WtsItIycPBZWukaXFA==
X-Received: by 2002:a05:600c:55c6:b0:477:75b4:d2d1 with SMTP id 5b1f17b1804b1-47d7f627ca1mr156876725e9.15.1768126548921;
        Sun, 11 Jan 2026 02:15:48 -0800 (PST)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c5ce06sm144483935ad.44.2026.01.11.02.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 02:15:48 -0800 (PST)
Message-ID: <5b466d2f-80ad-4b45-a643-ab64bf2b252d@suse.com>
Date: Sun, 11 Jan 2026 20:45:44 +1030
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] VirtualBox VM crashes (BSOD) during Windows
 installation on btrfs with kernels 6.18+ (works on 6.12 LTS)
To: jollycar <jollycar@proton.me>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <sT06uA3Gtv1kgeL80ZRMshbw6whJNUom-UxnS06H6eVrB4AqGWuzo0P23AhwOn3WsnAq9QfhFYciSAWK3eBeGaKjNJG1oSQLyclv4d2E0L4=@proton.me>
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
In-Reply-To: <sT06uA3Gtv1kgeL80ZRMshbw6whJNUom-UxnS06H6eVrB4AqGWuzo0P23AhwOn3WsnAq9QfhFYciSAWK3eBeGaKjNJG1oSQLyclv4d2E0L4=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/1/11 20:33, jollycar 写道:
> #regzbot introduced: v6.12..v6.18
> 
> [1.] One line summary of the problem:
> VirtualBox VM crashes with BSOD during Windows installation on kernels 6.18+ (works fine on 6.12 LTS)
> 
> [2.] Full description of the problem:
> Windows 10 and Windows 11 installation inside VirtualBox consistently crashes with BSOD within 1-3 minutes on Linux kernels 6.18.3 and 6.19-rc3. The same VirtualBox configuration and VM image work perfectly on kernel 6.12 LTS. The BSOD errors vary each time (most recent: 0x80070470 - "file may be corrupt or missing"). The host system remains completely stable with no logged errors.
> 
> [3] Kernel & Hardware:
>     - Kernel versions tested:
>       * Working: 6.12.63-1
>       * Broken: 6.18.3-2, 6.19.0-rc3-1
>     - Distribution: Manjaro Linux
>     - Architecture: x86_64
>     - VirtualBox: 7.2.4 r170995 (vboxdrv vermagic: 6.18.3-2-MANJARO SMP preempt mod_unload)
> 
> [4.] Filesystem and storage:
>     - Root filesystem: btrfs on LUKS encryption
>     - Mount options: zstd compression level 3, SSD optimizations, async discard, free space tree
>     - VM storage: separate btrfs subvolume

What's the storage file configuration? Like what's the cache mode setting?
I don't know VBox at all, but there may be something similar to 
libvirt's cache mode (none/unsafe/writethrough etc).

More importantly, will tweaking the cache mode change fix the broken 
kernels?
If so it may point to direct IO related behavior changes.


And what's the storage file format? QCOW2? RAW? Or whatever format 
provided by Vbox?


And one final question, have you tried qemu (or libvirt + qemu) and can 
it still be reproduced with qemu?
As I'm wondering if the direct IO related change will even affects qemu

Thanks,
Qu

>     - btrfs device stats: all zeros (no errors)
> 
> [5.] Reproduction:
> - Boot kernel 6.18.3-2 or 6.19.0-rc3
> - Start VirtualBox 7.2.4 r170995
> - Create new Windows 10 or Windows 11 VM
> - Begin OS installation
> - BSOD occurs within 1-3 minutes with varying errors (latest: 0x80070470)
> - Issue is 100% reproducible on 6.18+, never occurs on 6.12
> 
> Additional context:
> - Host system remains completely stable during VM crashes
> - No btrfs errors in dmesg or device stats (all zero)
> - Issue persists across multiple 6.18/6.19 releases over one month
> - VirtualBox 7.2.4 modules load successfully on all kernel versions
> 
> Regards,
> Jollycar
> 

