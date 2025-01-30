Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DF015C0
	for <regressions@lists.linux.dev>; Thu, 30 Jan 2025 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738229439; cv=none; b=ZPnscpmFZEuWun4MpRWwwp3xNka5AwRSVR6BgKAo/lwes3gwtGFuXexvYih1ifB+vikIlLEv8t4MgQVk2/UDikywrBEKyHMBXw84VYzsjRhKhymLEtcRjf/NKVVPa5EXcGeCmq373hFohk9nX5StzJQFXQA23LjDQnGVV6FspKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738229439; c=relaxed/simple;
	bh=X9dWZj4DOifg6j2W5YvbRi0pTVYC3fIHLwZLH1WnbPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G28ZM3W+BEvlkkscFWXuk8ouZUPnOblU+UU+NtNP/OfkjgnjMJXllw+/3IjTRz2wqGHLXWUGwkY0jXfqv3jLaK2desFeSm/jZ/V89RRelyiQLUN+VRNeGToOOwbKS8peGAMQLMZT6pQaJNc6O/0D43q16rM2/X9elxPwCGmW40Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KgjG2QE4; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KgjG2QE4"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so763533a12.2
        for <regressions@lists.linux.dev>; Thu, 30 Jan 2025 01:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738229435; x=1738834235; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DWNKTu1xMedq7YoRUSSpTvvZsiNpq+yhrTRNnSA0368=;
        b=KgjG2QE4i4bIoqc/UNlJFGrUQHa9foSPLaX0J/jalFNJcvFG1uNzHaHaNDNv0Nhea7
         yFjWJT5W+1+TUcVic19cPmivmzjSNukamW82LwpksBiDh2fWV20omP31xuDEDV0kBnfq
         5ZyxlwFJLYpeaSeJH7Fkf5jGxFaE3eNJaXpdSKEQ2dRbKiMFrH02ZOrvJMdhTIdfNsm8
         ghX7pxz2KeNQznbUzR4e7u6rsYVZ5Q4wgpM8MxFv9eQ4+y+CylYDhpaIPA57MyDdDID7
         2F+YMYqBTJRYa3uUwIYwlVDPv1Bkh2xKk3YDfLZljcttbGg1KAy+MKXTWw/rqxWK+14Z
         M1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229435; x=1738834235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWNKTu1xMedq7YoRUSSpTvvZsiNpq+yhrTRNnSA0368=;
        b=J3JQ7ptpcn/zkHk2hMiV75iRE3euJ0qGl8D8v/7Ivkg7kYjtYv5JvCqSf/pCAvURPQ
         w4y6ukMeOApwlTr2l44uIg2d9CrPK1xIhPu4FA3QmF+L7XkLkXKjJfde1ZgBvduB8NZ3
         LdGZhVwFU7A5qY/GJyKqfkYviN1oOY5+yWNSipYurxpPthhm84pwyuCZoY5BkQB7cSnK
         Kx0XUSDqXnQ7unSBP1Z2G8y+pX8K2HurFiULPYSQFSN+dRfKps/fZtukTcjyuigQaF7X
         ieAx3HzVNj38s5lUAAFB5NP92MV4FuagasRhajOV+sT1UCyGXhWpp2PRuiT+zeHhzgQv
         bYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWzGXUQ26SuDU521lUQKfoqENnfLRnoun5LsROA3o6etu+PRhfLig1bJ6yfiv6bl4UsPaNyYuNmEPdvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOEBNS7i1NQOkRvIzVfr/apbtDgTRcFsyn1ExGz4A/GhU+H8r3
	ZSfQJwa3dTn1QQpiWc30nXBAweqUpcvrtfK4PtTyRj5HAqemVsCc16SK9oYn0g==
X-Gm-Gg: ASbGncsJ1QHERuy0RHucVrS268CS2dqPuCeO/bitttwMSwNAUfS9Mb8xBgSak4eRCgv
	cSX5tkuwvlq+FdwLsk6BSPQg+oq8Rjgd4q57+Mc/xrJ719EN/gIws/YwKAsfrBRxMx9P22FRzTF
	0mbeDSoq9WFmYIArjM+4/3yJEu5SxhRbsurYaqsliiwbBD92BNH4g4kzVVZQ+gIx7LSsVtwsW97
	PVXTD2PsLmeJCBQnBcV8ZonsMFW4iSXWFwhH4RbK0IIOI4rXd9d58VLAclKEEIu2v8MgpTP5ZRo
	j+5ZivzHli4eSfLNn8xdgRf4Qr4BAqlAxyQXjxnQo6ps8adaPCD6oYkamOdvMTeOVSwy2W1W3pK
	C
X-Google-Smtp-Source: AGHT+IF0gyawJlcEkylXCscP5ByYoAc8DNLoaGkczxxW7yrMEL0xgpxHngznG1VR9QUPt+Fv9sC/Rw==
X-Received: by 2002:a05:6402:34c8:b0:5d9:84ee:ff31 with SMTP id 4fb4d7f45d1cf-5dc5efa8c21mr15653014a12.3.1738229434702;
        Thu, 30 Jan 2025 01:30:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc7204517csm775702a12.0.2025.01.30.01.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 01:30:34 -0800 (PST)
Message-ID: <cfe0af0e-132b-4390-a3b0-dde0e6326e19@suse.com>
Date: Thu, 30 Jan 2025 10:30:33 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <Z5mOKQUrgeF_r6te@mail-itl> <20250129184825.GA484760@bhelgaas>
 <Z5sGW4b0pMtm38Y-@mail-itl>
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
In-Reply-To: <Z5sGW4b0pMtm38Y-@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.01.2025 05:55, Marek Marczykowski-Górecki wrote:
> I've added logging of all config read/write to this device. Full log at
> [1].
> 
> A little explanation:
> - it's done in pci_conf_read/pci_conf_write in https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/x86/pci.c;h=97b792e578f1093194466081ad3651ade21cae7d;hb=HEAD
> - cf8 means cf8 port value (BDF + register)
> - bytes is read/write size (1/2/4)
> - offset is the offset in the register (on top of cf8), but not in data
> - data is either retrieved value, or written value, depending on
>   function
> - it's logging only accesses to 01:00.0
> 
> interesting part:
> 
> lspci before reset:
> (XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0x61614c3
> (XEN) d0v3 conf read cf8 0x80010004 bytes 4 offset 0 data 0x100000
> (XEN) d0v3 conf read cf8 0x80010008 bytes 4 offset 0 data 0x2800000
> (XEN) d0v3 conf read cf8 0x8001000c bytes 4 offset 0 data 0x10
> (XEN) d0v3 conf read cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v3 conf read cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v3 conf read cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v3 conf read cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x80010028 bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x8001002c bytes 4 offset 0 data 0xe61614c3
> (XEN) d0v3 conf read cf8 0x80010030 bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x80010034 bytes 4 offset 0 data 0x80
> (XEN) d0v3 conf read cf8 0x80010038 bytes 4 offset 0 data 0
> (XEN) d0v3 conf read cf8 0x8001003c bytes 4 offset 0 data 0x1ff
> (XEN) d0v3 conf read cf8 0x80010080 bytes 4 offset 0 data 0x2e010
> (XEN) d0v3 conf read cf8 0x800100e0 bytes 4 offset 0 data 0x18af805
> (XEN) d0v3 conf read cf8 0x800100f8 bytes 4 offset 0 data 0xc8030001
> 
> reset:
> (XEN) d0v1 conf read cf8 0x800100fc bytes 2 offset 0 data 0x8
> (XEN) d0v1 conf read cf8 0x800100fc bytes 2 offset 0 data 0x8
> (XEN) d0v1 conf read cf8 0x8001008c bytes 4 offset 0 data 0x145dc12
> (XEN) d0v1 conf read cf8 0x80010000 bytes 4 offset 0 data 0x61614c3
> (XEN) d0v1 conf read cf8 0x80010004 bytes 4 offset 0 data 0x100000
> (XEN) d0v1 conf read cf8 0x80010008 bytes 4 offset 0 data 0x2800000
> (XEN) d0v1 conf read cf8 0x8001000c bytes 4 offset 0 data 0x10
> (XEN) d0v1 conf read cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v1 conf read cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v1 conf read cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v1 conf read cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x80010028 bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x8001002c bytes 4 offset 0 data 0xe61614c3
> (XEN) d0v1 conf read cf8 0x80010030 bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x80010034 bytes 4 offset 0 data 0x80
> (XEN) d0v1 conf read cf8 0x80010038 bytes 4 offset 0 data 0
> (XEN) d0v1 conf read cf8 0x8001003c bytes 4 offset 0 data 0x1ff
> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
> (XEN) d0v1 conf read cf8 0x80010090 bytes 2 offset 0 data 0x1c2
> (XEN) d0v1 conf read cf8 0x800100a8 bytes 2 offset 0 data 0x400
> (XEN) d0v1 conf read cf8 0x800100b0 bytes 2 offset 0 data 0x2
> (XEN) d0v1 conf read cf8 0x80010004 bytes 2 offset 2 data 0x10
> (XEN) d0v1 conf read cf8 0x80010034 bytes 1 offset 0 data 0x80
> (XEN) d0v1 conf read cf8 0x80010080 bytes 2 offset 0 data 0xe010
> (XEN) d0v1 conf read cf8 0x800100e0 bytes 2 offset 0 data 0xf805
> (XEN) d0v1 conf read cf8 0x800100f8 bytes 2 offset 0 data 0x1
> (XEN) d0v1 conf write cf8 0x80010004 bytes 2 offset 0 data 0x400
> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 2 data 0x9
> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
> (XEN) d0v1 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910

This is the express capability's Link Control 2 Register afaict. As per
the copy of the 6.0 spec that I have the top 4 bits have only two
defined encodings - 0b0000 and 0b0001. 0b1000, as is being set here, is
not defined.

Yet then the earlier questions remain: Why has this suddenly become a
problem? And why would this depend on how the present session was
started, and what was running in the previous session? Is this write
perhaps conditional upon something that has changed?

Jan

> (XEN) d0v2 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf read cf8 0x80010090 bytes 2 offset 0 data 0xffff
> (XEN) d0v2 conf write cf8 0x80010090 bytes 2 offset 0 data 0xfffc
> (XEN) d0v2 conf write cf8 0x80010090 bytes 2 offset 0 data 0xffff
> (XEN) d0v2 conf write cf8 0x80010088 bytes 2 offset 0 data 0x2910
> (XEN) d0v2 conf write cf8 0x80010090 bytes 2 offset 0 data 0x1c2
> (XEN) d0v2 conf write cf8 0x800100a8 bytes 2 offset 0 data 0x400
> (XEN) d0v2 conf write cf8 0x800100b0 bytes 2 offset 0 data 0x2
> (XEN) d0v2 conf read cf8 0x8001003c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001003c bytes 4 offset 0 data 0x1ff
> (XEN) d0v2 conf read cf8 0x80010038 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010038 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010034 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010034 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010030 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010030 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001002c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001002c bytes 4 offset 0 data 0xe61614c3
> (XEN) d0v2 conf read cf8 0x80010028 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010028 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010024 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010024 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010020 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010020 bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x8001001c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001001c bytes 4 offset 0 data 0
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010018 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010014 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x80010010 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
> (XEN) d0v2 conf read cf8 0x8001000c bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x8001000c bytes 4 offset 0 data 0x10
> (XEN) d0v2 conf read cf8 0x80010008 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010008 bytes 4 offset 0 data 0x2800000
> (XEN) d0v2 conf read cf8 0x80010004 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010004 bytes 4 offset 0 data 0x100000
> (XEN) d0v2 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
> (XEN) d0v2 conf write cf8 0x80010000 bytes 4 offset 0 data 0x61614c3
> (XEN) d0v2 conf read cf8 0x80010004 bytes 2 offset 2 data 0xffff
> (XEN) d0v2 conf read cf8 0x80010034 bytes 1 offset 0 data 0xff
> (XEN) d0v2 conf read cf8 0x800100fc bytes 2 offset 0 data 0xffff
> 
> 
> [1] https://gist.github.com/marmarek/b4391c71801145e52590e877c559c5e0
> 

