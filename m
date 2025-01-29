Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEB816C854
	for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738142245; cv=none; b=sPe2RaWQyyQg7295fKmrqMO+/fJlxX8nIWpHxSpMUrYdW2B5kd7qIGjhThJxHjZfJ+C7EojB4NLhb2M78Hi/8N+uH8kAqzx4irtc7K/aDdBZtxlI5c8mjoSp6CFeZJIjCUPxd9C1YDyv1J21U2nJDupaSUTRSgqQ5rh2b3jIEuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738142245; c=relaxed/simple;
	bh=KnM0SWkHYszZgGl5ocXIt4Nayp4o2tvzsXeokZWmpJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikuwjIwR0WETtwFTpTEZOqamPYhN7+1AN2D/bSNh/y6wAWon/srGs1r7a22K1avcyt3N7sTuAfGo9VWFTiBlYcY+wmgwAfD/WftNbhPPhSJGcg30CbMkVHno5kJy+3eIx7jlwto1R9dkatXXssLWEBgAT1/6l8rTiHmPvMhvKUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MqG0Awxu; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MqG0Awxu"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaec111762bso1463987466b.2
        for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 01:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738142242; x=1738747042; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jY3VwszcUmlCwbph4D/VlW+dI7fVI6uIXSglAodg90E=;
        b=MqG0AwxunODCui1yEteLK8qIG0pmD7TRRQjvKBNcSPeD7uCbyGY7qt/Rqqz4zdbvk4
         yC0+LXJh06tdsDskY0VFAKCoIaZAFJzUB3yJalqR5XdOM81rfPDYRGFj0rjGtTCScoIM
         gX/XYlTDrpl1+LUPWyVNzrPHrhkvWgNHPm3SWsqGTm6QdP4Qf9AU2FPL5hdK9Hu6y+JQ
         5cOc/w7d3aHKBi46vjypRurwUSNk3YSjLLrIdowY59cbNUbXW+C67iZ3TopmLn3/JAMa
         1ph4tToguEsmyPJk0AR/hnBMg74Z4BxSKjnV5UvIbfaw2Pq/Res4DPRSdNMW7BXcvCQM
         L7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738142242; x=1738747042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jY3VwszcUmlCwbph4D/VlW+dI7fVI6uIXSglAodg90E=;
        b=suGxQwHrqEOXOIdNWCJcp1HLKWKBG9Yschlw6Il1XgGYTkxxS4E5heIZa+cwyoYXCt
         e/DP6dphVJvvP/cPZrOBBGY4IKYGo3PU3wHC+mlIQmOOduk04owa4JrEWce8L2MQRMrk
         t3VU15P6CjGQ0W1YIVQdqJZ5YrWgEa/Otfvb7wagIWiep0waSYG1vwpv9+QEOMfOMQ0I
         VGubZJHgq/ZhSsZKJyKftMTI8ZzEXMRoFTUE8XrkR0Lg/6WNfkcSR7oZ5pGEMEV5Eqgq
         4wSA2Anhe40txZ4L/v0ulSJlTp0oIaffleeQb3CjvqTd9/yBKs0xdJ+7+WjRm1xwm0xQ
         szIg==
X-Forwarded-Encrypted: i=1; AJvYcCUFNePXNlOjU2hSRAZmCsf1LKnM4xjsArntszl5SZXjrapEpoaFd4+z8RNbBWpgp+vnx67Ox537P4b24Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQIrUn7J43CIAzKbTCRSKqWk+iPZLzg7qP/N/EzsS/38IVOiZQ
	4A4iiI3x6XyymVx7wZaVCRpobR/i38/JXmCOVYn/2ucy9K0HA5TN+Utj3YtCAw==
X-Gm-Gg: ASbGncvZyvcX3ECwquKBeN9o6j7DpiRME2W8r1fDDlB3swvbW1gnKuX1PaetfQBS16i
	yAfMic62DgCkRFMYKDbwrIQADa0z8/WaO9LuVOSot6/eQ3GNNXgDPskuDbgaQulldlyOrZANdEY
	JIqi8Gl9cVbS1BW4GzC0+jIUhjU4KqdcPUSUmNLozajudSi/T0B/RtE6L2tSPDSKJ7bAU+x2Xb1
	hpdN73B+mbwelt0snF6hUtWihYl1fdcQshRFYCKDR8aJ52AgRe/jHyBbH2/rP0QmV9Q8b3PZ4YG
	eaCWqI95yO3QyHMviMNaQdMzj3RcucUFObKd2NO8UlBWcxmuYa7q78ooTj6umCw3LvcGtPNxnoi
	U
X-Google-Smtp-Source: AGHT+IEptWmgc2PdXVVMpz3zp4lAqX67/4R5WHHT7DJzrvchdkCI70dr1F0VPJ8pj8HJuAcJBfIasw==
X-Received: by 2002:a17:907:1c16:b0:ab6:330c:7af0 with SMTP id a640c23a62f3a-ab6cfcdf591mr214805266b.20.1738142242113;
        Wed, 29 Jan 2025 01:17:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6924486dbsm692004966b.161.2025.01.29.01.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 01:17:21 -0800 (PST)
Message-ID: <22ad7276-624d-49fb-a2bb-1b7908318a4e@suse.com>
Date: Wed, 29 Jan 2025 10:17:20 +0100
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
 linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
References: <Z5mOKQUrgeF_r6te@mail-itl> <20250129030315.GA392478@bhelgaas>
 <Z5mfA32bvEn6yD-C@mail-itl>
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
In-Reply-To: <Z5mfA32bvEn6yD-C@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.01.2025 04:22, Marek Marczykowski-Górecki wrote:
> On Tue, Jan 28, 2025 at 09:03:15PM -0600, Bjorn Helgaas wrote:
>> The report claims the problem only happens with Xen.  I'm not a Xen
>> person, and I don't know how to find the relevant config accessors.
>> The snippets of kernel messages I see at [1] all mention pciback, so
>> that's my only clue of where to look.  Bottom line, I have no idea
>> what the config accessor path is, and maybe we could learn something
>> by looking at whatever it is.
> 
> AFAIK there are no separate config accessors under Xen dom0, the default
> ones are used. xen-pcifront takes over PCI config space access (and few
> more) only in a domU (and only for PV), when PCI passthrough is used.
> Here, it didn't went that far...
> 
> But then, Xen may intercept such access [2]. If I read it right, it
> should allow all access (is_hardware_domain(dom0)==true, and also the
> device is not on ro_map - otherwise reset wouldn't work at all).

The other day you mentioned (on Matrix I think) that you observe mmcfg
not being used on that system. Am I misremembering? (Since the capability
where the control bit lives is an extended one, that capability would
neither be read nor modified when mmcfg is unavailable.)

Jan

