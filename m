Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F28A80C02
	for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738158886; cv=none; b=aksJNMXwk5sVOTEyXaTzNRBWV5zW3LgGZMRIk9yeU2nhBvPurvzFk5MXWxYuB23EbV82gZkW/13zMbKjKaQebRxQEqxUqzhjIUlhLUFrK0Ad/jwSe6U9JbZqsPSjWrU1PK/WNGttEj8K4lwecZSs8LJeYY1rdZhDzjkXQQvu3b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738158886; c=relaxed/simple;
	bh=Bp8j6cdeU44uJZZirV15PQkOdv67IumSfT+gpLwKhU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQJYS2CrALR+W3vW1g7VJzT09mUUrkamJ/g+5iTL5x45rNzHwMOnaAO6j8yP/mLDukhnilzdDrjh7wq0muEp+vcN6FLTGAA6O09hDmQWjcB0GfaqDSKjhp7xgS6rD6DnvmcTykdKCuCe992VARV4oParonQD4wC4PN9X/2lkNIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=X+jTh11y; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="X+jTh11y"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf57c2e0beso1370063066b.3
        for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 05:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738158882; x=1738763682; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OAzk2HvSci2RB9DJCTTtog02Zihvy8J06+hb0uPWlXE=;
        b=X+jTh11ygZ8zd0FXUtcQ4Uz//MftdHUFeKToLZ6YHfM+DQw45QQj0JhUPcx4gIs1hC
         fTA5JSHGbc2YCQT07gysQXXHLhc5exbs8lj+l5oFvFcfFj+On4aNtFcOa5DIzzvspWht
         rHRX58VKZJZWeK80i++zBXxHBBjpi1pbrqyznrBEYkRL2MZsGdWswPB8U/2eQHbD1ss8
         G3q2uB73lIHd87HaX7ciN+yrKVF7xrrcZyGOv1xEobqJ6Ia7qe23NX5HiymBhQvx2IJY
         43pM6iJfvsSDlHO/YePp+YrVezwaw3tVfwUm7vqLURS1l84hCPlaIBX3gEQNx59mOig0
         ECTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738158882; x=1738763682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAzk2HvSci2RB9DJCTTtog02Zihvy8J06+hb0uPWlXE=;
        b=u3i92bI58NNPT2PE3/ywIg77I9DiV9xs7bF9zCzbbusecNN2IWJdy9Y7Xknoo4C/kc
         RbX+EQ4eM1E/Fvz2P7xIXZh/9s5xYS6QA5lJ/UDHCQeXCXh9rTS5phGTtA2eJRkdw2Xw
         8uzBYxkfEYx1Mn+N3ueqVGp6AnHt4boS3n7BAdWAv1uYdGx1zZGtW8t8H5+572IsehL0
         RX8v9mxqev3tuR0+fz5CS7x+AXmvXxyqip2GUsqX7xtQZCudyBitEnKFnuBqQB/nFfgY
         JgL857k1KWG/XdB3kUzx4w8uaDIOcSvl7xw1VGvBZB8Nugykn4PYjBIWfqGqMJQyLPNP
         9TrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM5ZCe0NLhtW9g4KbkpCzCINphudp//Ni78bYvGjBBSZj7vXerXmcrUEAblUUpMxulFn6cN0fvVyciwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBp4r+g8z7GA0hXvAkVdtm+utldoPtTYnYk4NvBHz5zT2lIhBA
	brJsH0kBnWa5L5I9zj9rRBmHJT3M3Ul3iA3T5zWhygwaL+e/D7lkUBgknvLvjw==
X-Gm-Gg: ASbGnct20W8yKheCfDMJZ+ws9vfat+aVuPlMC8BQeQFxA98sNxTi+QcnOTVawJ0nMIi
	9uTgxdFQV3zHYN7o5HQxvbgKIAVKwImXdIRPsl6+6/WAnOMyDua+V28PqQaZxSKfZAh6VymJomI
	5eTIafCWcrFP9Tp5aouqq2FCOja5tPbtR6DKsZKszmD55VX6mu3gw5XktLMLk8kaxE4IyAAPfJS
	+9x/qpNNm7JFNQkavqiIXUg/oQUF1mBnT10C8bsDEP3ZRifzTqUfXl+pSJ5cc6GQmF4XRtD/Fo0
	N8gi36Tfmw5SJVrOFxGSGpHCWpxgm9HnNR5vAbXYtmloEYMRnI6uE3TiTnYd1Xub8jRJwDgQ77P
	nmofJRZiTu4w=
X-Google-Smtp-Source: AGHT+IFyfwTg1PMxVWwmOGjd5ZetF6IndRyOwzliuiWStKYzttmQsbLKfxXAr/xuK9TPm1p1YNzOiA==
X-Received: by 2002:a17:907:7b85:b0:aa6:81dc:6638 with SMTP id a640c23a62f3a-ab6cfcbb881mr280647966b.16.1738158882265;
        Wed, 29 Jan 2025 05:54:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbb2esm985639866b.140.2025.01.29.05.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 05:54:42 -0800 (PST)
Message-ID: <8acfd9b2-caae-4fe7-8d37-19e2d9be23a8@suse.com>
Date: Wed, 29 Jan 2025 14:54:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-pci@vger.kernel.org
References: <20250129132843.GA451331@bhelgaas>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250129132843.GA451331@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.01.2025 14:28, Bjorn Helgaas wrote:
> On Wed, Jan 29, 2025 at 10:17:20AM +0100, Jan Beulich wrote:
>> On 29.01.2025 04:22, Marek Marczykowski-Górecki wrote:
>>> On Tue, Jan 28, 2025 at 09:03:15PM -0600, Bjorn Helgaas wrote:
>>>> The report claims the problem only happens with Xen.  I'm not a Xen
>>>> person, and I don't know how to find the relevant config accessors.
>>>> The snippets of kernel messages I see at [1] all mention pciback, so
>>>> that's my only clue of where to look.  Bottom line, I have no idea
>>>> what the config accessor path is, and maybe we could learn something
>>>> by looking at whatever it is.
>>>
>>> AFAIK there are no separate config accessors under Xen dom0, the default
>>> ones are used. xen-pcifront takes over PCI config space access (and few
>>> more) only in a domU (and only for PV), when PCI passthrough is used.
>>> Here, it didn't went that far...
>>>
>>> But then, Xen may intercept such access [2]. If I read it right, it
>>> should allow all access (is_hardware_domain(dom0)==true, and also the
>>> device is not on ro_map - otherwise reset wouldn't work at all).
>>
>> The other day you mentioned (on Matrix I think) that you observe mmcfg
>> not being used on that system. Am I misremembering? (Since the capability
>> where the control bit lives is an extended one, that capability would
>> neither be read nor modified when mmcfg is unavailable.)
> 
> If you're referring to the Configuration RRS Software Visibility
> Enable bit, that's in the PCIe Capability Root Control register, which
> is in the PCI-compatible config space (the first 256 bytes), not the
> extended config space.

Oh, I clearly didn't read Marek's earlier mail correctly. I'm sorry for that.

Jan
