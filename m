Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F9F481B6
	for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738155002; cv=none; b=oh0sgaPr17iJkDto9XpxdiWqe49whT2lJTpP4fb50VPKvdaYSftyciIAH5paiveQvSKs3T6dfB7QgwZq0jparcfVr8BZyJb/0e49AmGWkccYmhlWSwqrhVHuChn4oqd9prelJO7+w96QdhO6ILIE5gBMEn+Uc7Vmz/k7/D21ZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738155002; c=relaxed/simple;
	bh=2MhrTbBWhqb/rJZbfCQD7yFxdm/y7KJtRIxQhKUacy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyBVdiQsJprz8f+p95zZMEzDhCQqEOJ6gLyfTQVFvGLM5IHQeSaDqNBhu8mIYjk4bRN6uS15PXp6Gi3c2o95tvsrMg2AP3YOd4bbImgxvWPz27lil27lQujtKrPmQfDjEfP4EqS6pkH93iUsu9DiyTgecWc/KO6e5ZU3AlXf+hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JX3nEZgy; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JX3nEZgy"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab2c9b8aecaso1222325366b.0
        for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 04:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738154962; x=1738759762; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P13nDXn0ksUze1YCLpPOQ4mzqk36RMO0+DPY/3Rbc7I=;
        b=JX3nEZgy8ceu5eb2zsR4C67xydxMET0Ow+z3/VDFLg5SE9DNSiXXEzP7NyP822jBmM
         VEenrg/q+M0IhMhbgjhGFCkfLwCIB8bT97dGB1T7lRw1j61A5krF325AKI6B9GJWHNNz
         adDqct9YZTRc4nYtAJhTkJ3NsfT+EcViFNM8jiN22xdlS32OJRRNHBwNCOOg/40jtA5H
         sx/wc/MJLKhg5yqUPG9zt1aQyCwTLrYciTw7Spjieb5UNK2V7J7ldqziOx2o2nfmtYnT
         6sMBDIfjjC4Vo9eUWb2Gfyl19JRA9NwPSiDnI3YhOYwBLlcgmKxqcr+QzF4QsQ+SaYN0
         YOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738154962; x=1738759762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P13nDXn0ksUze1YCLpPOQ4mzqk36RMO0+DPY/3Rbc7I=;
        b=Z+6aOVDhwCyDPSe3W+x7mDZAUop1OxT/wAbGlhptGLBeeaa/v/ikAvF0VwaPsvvo1Z
         mwOoGIyxxPAqjcS27YyYVY7MSJOVukh6uAcOovRWi/++JK2PJEYWUaYjypTOLhY6DYSS
         3FeR/YspZ7hhq2tVZtL2UUyTkziBWiNo9rsgulsLMwTMDHvPgXU2/+sFlURbSyyTTNPE
         qo10yPupsyTNHBve0O279R45u1Dv6ZONiErdQo8sTtSUX75GOViv4U5nBnHHZjK43Peg
         r68VvD4GjlDyPYCQq/nhpBAJec+HnVaph44mv3ScVapwifZelUBSKayxI8LUGw508q0f
         ly8w==
X-Forwarded-Encrypted: i=1; AJvYcCVQLgLYBmua+k7Tl/wNUiPueKESHJq226Jx+66rPo9CVRC+az4zyfDnryvphG9l94FTyc0VT27l7gxtVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3GX+RPcKuHKWp96nLyZGnPQ03FeNmB3mKpub4oBER+5O91yPU
	vfuf4jrKpXvSCuDG3D1NvwSEz+HiOoDtzcrPGywJCRa1Wq84p/WeWRr1HDG3Dw==
X-Gm-Gg: ASbGncsLob5jjiFmv4zvTjXG1IdxJmYqSrDqGnBWMIq0IZwGcmYuSJA4r7uokFQKmtx
	U1OjDdgHZP96gb+55+i7e81S12sWSGoRPnGGo2ZHRSpQkvVQk4au0X/HFAI+CdAC+UuL16eQ3AQ
	OPLbeL20Zb3FFa3J5mA386jAqg7UrJrRlXFmcCOPcwgS/KlsUq9cnryN1BfwMFY558RxRkewK9u
	7SrV3kuTgWQ/4pJug4mX+XaaOMlNYLdd2j6FsxwPjR9u/YPpnPcOsB/cLlDHkvdbZ8Xqrg6ostn
	S6qo4E5h5vDLslxk77VKhZwjRnPJ4f9bZX2+XKKYb3ug4+e24oj3W0nTmUnzKjhbCpwedn/QsIc
	F
X-Google-Smtp-Source: AGHT+IFbOOXBWI8FB+7yf4hzIic7jBHj46Y0AzXKI74CLRhnwt0JFJ60eK4jgC+pdzwi6Ic0HcyRYQ==
X-Received: by 2002:a17:907:7fa1:b0:ab2:ea29:b6 with SMTP id a640c23a62f3a-ab6cfdd851amr290915766b.35.1738154962327;
        Wed, 29 Jan 2025 04:49:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6963743d7sm706321566b.91.2025.01.29.04.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 04:49:22 -0800 (PST)
Message-ID: <4d7ed713-68b5-4e9c-8952-002d21d662d6@suse.com>
Date: Wed, 29 Jan 2025 13:49:20 +0100
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
 <Z5mfA32bvEn6yD-C@mail-itl> <22ad7276-624d-49fb-a2bb-1b7908318a4e@suse.com>
 <Z5oWq4YgMgwWvl2G@mail-itl>
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
In-Reply-To: <Z5oWq4YgMgwWvl2G@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.01.2025 12:53, Marek Marczykowski-Górecki wrote:
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
> Yes, but later (once dom0 starts) it switched back to mmcfg. Now I see
> this:
> (XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
> (XEN) PCI: Using MCFG for segment 0000 bus 00-ff
> 
> Another thing I noticed in the bug report - the reporter says warm
> reboot from 6.11 (where it works) to 6.12 avoids the issue (not sure
> about further reboots). Cold boot directly to 6.12 results in this buggy
> behavior.

Makes things yet more odd, imo.

Jan
