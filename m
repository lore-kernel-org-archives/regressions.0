Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA66D7DA67
	for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738158759; cv=none; b=CGRpvfguQO9qsHE7aA1GmVOog7+BgrtIPZJtzy9BI53lYVbF4v7/rJ8EOcMTpOAl+8zUvhCy2FGvlzhopSboC9MOVJqtMG4ZRcMXpLhPY0JRPLQ/3js4lyenQhxk8gOKN84GdpzGjVKua6P5b1LCIx+t6eXNSjoomaELtX6XT6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738158759; c=relaxed/simple;
	bh=+1xZukUKwXtjex5ct0NGGMDZj25/Cnt/rW7lyksKsm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+hgRC+nSo5AGejnvnhbVaOoq76WbMnn1m0a95TaFuqjCYq499/tHRc2d23vRRSrt3QkXBC9fwcAHwi9AppxgCmyfRaXCpMY350mNOOM6xBcEIHiJks/WEGc++AvQwtQtsD3MtinM4/YdZdLqQpwUyJsq6ewTnQ7sl3/p2RdxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R8FO4HB4; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R8FO4HB4"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaec111762bso1530296566b.2
        for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 05:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738158755; x=1738763555; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8eKaDXN8nT3fRF/O7B9dAo9AcUGAfO6x7aOxDrfogQM=;
        b=R8FO4HB4Y9LKu75FeQ1kKCqwUNY6c4QSg6fLven2G/PEpIWgucHS2ysgSXnW8+QU1C
         RlhOQ9owA1uaXHvTYmdibJX9bDMI6gvARjD0d1aEsfH/GBJ85PEKdQJZoMP9GzTmQlHR
         dZrDm8CAB/FwaE2OhqTvBfshRhic6f1a0YuEfEbmUgtgIOC32JDVu5dNGy3HgyTTghgu
         csGm/ROI2Nsni+BjVKMi27Fuv657Kcq/9jTGRvEGOuysBIkUI8gUPs7dN0wdf/hJ8n/r
         mVeYyNOPLAANAwL/aMOxYhN6GzKwdyECLf7dW+ypfshzNI6T3wG+U/FrzeuBRJlFr+LI
         nnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738158755; x=1738763555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eKaDXN8nT3fRF/O7B9dAo9AcUGAfO6x7aOxDrfogQM=;
        b=d2Db3RNuwWbUSlsH9o9YJRiU/uWy97brjcEDUKLnhWYVwcj4zS5HOOZOimmXYla8Fp
         8cJ1w2m02EYtrosnzjfs8iLbcK1stF98066WrazJ9vmQRmvoAZSgc7vWoPwUL3vIX2GD
         D11Op3I6/ErEeAfBo1vIXieai7XHxkngCpFdo0JGVylk67yKzFwj1On9z8V2C0k/3gmi
         4QUSIE1wayTWkFwVbyNN+PdcdV5iYVOFL063HKzLizrqKIavdMcGb6ssYTT6fFqpEhvv
         VDNmKpn3z96JfZtlBba28oNApJNW1m4JTAV9jnl2YP1LhCkgg30JwMipgaThu1BX3mwQ
         BFdw==
X-Forwarded-Encrypted: i=1; AJvYcCVtOHg6m31JXjvRetYHiM1EBNBG8yvnKNRWX2vUBYAKngYTo9mFagqFRABFyEzaRL40IU4yRWYWl62TOA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3qsbUoWautetMmnF+wPKkf4YP5ZjKSu0JpYRCYlTlNJetNuvq
	WLZc9negQZl4VBd6PoT5aCj8t2yP6r9vL74P+nm+rDsi/omwUhZG835njfb0Vw==
X-Gm-Gg: ASbGncsQCkZIUDo7odpNo/qeWO5CP2Ze29Ayu8Hxtref6FOI5rMwUudqIx1LEESGuZI
	DuhQUjRxfftmt30CqkOuVGLsNbKdl39OJHYv2krvVVqKAGsouUhpUNdKXH0C+FyCLjiQ3gZNSGW
	bUskEETUJ9caV6IQLsQqA8acvYzwIo7syDTBkP6FjmeVb1aA/6lOzvCi+r1v5k2jzgB0L9rASFJ
	I0tvkuDVnKLltgKrfazX6qodL0aArtt59+cKZvs2RlltQ2WQ3dO630ThRzMlyWvCuwP6kpxuNWa
	ueMEltjIF1OPWk4WTzPsZdf73nED41d5uxldSaH543BantrAJHeRrQITPN8p5vD1vi++zEOeU2y
	p
X-Google-Smtp-Source: AGHT+IHcgMv7g287Jp7sQNzuwSuVOp0aN6zu3mmbpSWX1c3/xC3MYcqnhyGJQi8cda92/TBxiW4uDQ==
X-Received: by 2002:a17:907:2d0c:b0:aa6:995d:9ef1 with SMTP id a640c23a62f3a-ab6cfcb39e9mr349160266b.12.1738158754501;
        Wed, 29 Jan 2025 05:52:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760b76acsm975243866b.113.2025.01.29.05.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 05:52:34 -0800 (PST)
Message-ID: <841e1793-4635-4f06-b0c9-37530215c08b@suse.com>
Date: Wed, 29 Jan 2025 14:52:33 +0100
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-pci@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250129133252.GA451735@bhelgaas>
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
In-Reply-To: <20250129133252.GA451735@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.01.2025 14:32, Bjorn Helgaas wrote:
> On Wed, Jan 29, 2025 at 04:47:28AM +0100, Marek Marczykowski-Górecki wrote:
>> On Tue, Jan 28, 2025 at 09:40:18PM -0600, Bjorn Helgaas wrote:
>>> I guess the code at [2] is running in user mode and uses Linux
>>> syscalls for config access?  Is it straceable?
>>
>> Nope, it's running as the hypervisor and mediates Linux's access to the
>> hardware. In fact, Linux PV kernel (which dom0 is by default under Xen)
>> is running in ring 3...
>>
>> But I can add some more logging there.
> 
> So I guess the hypervisor performs the config access on behalf of the
> Linux PV kernel?  Obviously Linux thinks CRS/RRS SV is enabled, but I
> suppose all the lspci output is similarly based on whatever the
> hypervisor does, so how do we know the actual hardware config?

The hypervisor only intercepts config space writes; reads, particularly
when going via mmcfg, ought to be unaffected, and hence what lspci shows
should be "the actual hardware config".

Jan
