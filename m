Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123D91369BB
	for <regressions@lists.linux.dev>; Fri, 31 Jan 2025 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307623; cv=none; b=lMQXYr5iU47zG6QDYVGp6rvMBx2lKKDYa/nbOEpX/8YtX/wLtHagKKscubYaUsscO+CPFH2HoXVyZrxRr87ebrJ5S5uNq9MDlc4NGGYbNFycAbWOFGDm/zfz71szd+A2tYDpfydkTIK6zGokRulZLIimrkpjZgKjtXMuLlhCUJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307623; c=relaxed/simple;
	bh=oCsbKzhgT/KhIVG/z8t0kbZLEi4avOWBM1A6imr3Aog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iM/yuLaupuuELfEk9TObgAEUis3KUoGpWpr4j+NSdtAsaZSHbpsx6dZPTZSZmXDAmFfnFSWj1ZJacAKEAL7VeixYmXWlnen80ehi58Exrjvf0M12FvAaxNWR+w+mmyOvuVRAQOzE2KT1Z8NqcMVhiKG823c/O68MSu6FokGTSlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e8cjU4ZU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e8cjU4ZU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361f796586so17845145e9.3
        for <regressions@lists.linux.dev>; Thu, 30 Jan 2025 23:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738307619; x=1738912419; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ttm6v3FBTzieJ8SUVLl/gOL9EjbKAxhp9vbmf+0aYqQ=;
        b=e8cjU4ZUm19f5f5IRObIJ9lFO5kCfj6LSUA8Td/IuO7PB+qzlAY9PHvAtHlLd7PhLe
         M2iZTXGi11kMrE3+u68u5oHsqZ7cJaigEhOIFXVPOhi42tc9JS8mDn5fdBmC/UnHCTQw
         icsiUbLjjgdZIr41SxQ03IPaWUyN9xKYBius6kltOj4HJMByZtqvXDFmcb7wsOZ9im2o
         /79QQlL4NlXeIEAquHTLmLCqkuQb0xk2asaVyUCodJIY3CCeGbDOFEPNVIrNMH21wipr
         ATiy4tKQKpOTEvKOMbR+O6f/xsf1vq0tiGYBopliyt4qFwo0i5cN/vYU2Vw8o+KpWYmQ
         YXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738307619; x=1738912419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttm6v3FBTzieJ8SUVLl/gOL9EjbKAxhp9vbmf+0aYqQ=;
        b=mO7/T7cKc545ns3j1rXeygVgKBGUdm3nuULop/Twm0V2mrxQOLeHo6iz4yH9fdAbPn
         ZUVtDVPxoVteZhvwwZrPr/fqoiDmp4NtuzqKyvH6q0pqWYUfNAl94DlbPeoe0iWC7c0q
         XUdbu4+fsk7e56CS6CPqUW3g3Va7sO7ohJNwjt3olercUeRkmHul0lzU/d2hR9SzUK3j
         YZJbCmHTteG4C5pG1C1HV3838ymTXc9b0Jv2Vpl3KqsdLGMwoaL90KMPTW4HffCKTvIy
         7tzysgYcUsnNirWbBqikmCe6oP0Y8kL28wLsj/VaJqsTjMBK2mrDjA7EQOyhDrkIdBha
         XMRw==
X-Forwarded-Encrypted: i=1; AJvYcCUGU/Nk0lKjhwQ0UfzWT4XcvJezUBXiAJYpy+YG6smJP7gpRmpar9ELTJ5ky++ZpyimMo5nczASdln4Ng==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZXbjHMIw0Udc963uvwaRvFfNdx8hCUhK5+ezTz1tTlfzYCfn7
	nNAc5DNWlq4JIELgtuvpEWxPVQpf8I9O+iW6XkJP4EYO73xRyChu2FoVjrci7Q==
X-Gm-Gg: ASbGncuPhWMZMWBUaxP4exN02HQ3LKSlHSpms4BfuLPTr437yLuvQASrfWIKJaCf3YF
	JeY/LnvWSR9YTqwD/4y9h0ulQwMac7QjRyOMMYKKEM1ZNk8bXiTkonfEFCmgoxecW+9mon7O9eA
	t19MIquCtj5mvDnN40ygAEE7FK7bqb1VNy8RnTnRWx9O+Yz1sVZsThm17eQR3grvJzpxiVTf55b
	j7fGgm2uoek2kxsxisiZ6rbmINr5r1JfnfZUpG3T9bSTZNjCUh5F546FwKC3JMbk8Q1RK2Y+yvM
	IyalzCClqj1R2rzsHZzjASPR55kT+nLPr9hnqgKw+cPt4oESQr4kzYexBeHGDmKYDRP2ahPanZu
	7AyDsmAu/fGrmJ4d37ndRiJIjwpjGP7sUj+6P+2dtscHt9M8fgw==
X-Google-Smtp-Source: AGHT+IEoTJGWaLKWkydMGgIgEhmfdAzAaGkqn+yNFFfgssg8dqdbKs4HRrJ/OFxj8N4UVjVlH1OMEA==
X-Received: by 2002:a05:600c:1e21:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-438dc3c31ccmr126782315e9.11.1738307619291;
        Thu, 30 Jan 2025 23:13:39 -0800 (PST)
Received: from ?IPV6:2003:ca:b741:f1d0:3123:f9e9:b484:6874? (p200300cab741f1d03123f9e9b4846874.dip0.t-ipconnect.de. [2003:ca:b741:f1d0:3123:f9e9:b484:6874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc263f0sm81274495e9.9.2025.01.30.23.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 23:13:39 -0800 (PST)
Message-ID: <2d5b51e9-db32-4e46-97c8-2644081b7e33@suse.com>
Date: Fri, 31 Jan 2025 08:13:37 +0100
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
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
References: <20250130213123.GA633869@bhelgaas>
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
In-Reply-To: <20250130213123.GA633869@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.01.2025 22:31, Bjorn Helgaas wrote:
> On Thu, Jan 30, 2025 at 10:30:33AM +0100, Jan Beulich wrote:
>> On 30.01.2025 05:55, Marek Marczykowski-Górecki wrote:
>>> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 2 data 0x9
> 
> PCIe Cap at 0x80, PCI_EXP_DEVCTL is 0x08, PCI_EXP_DEVSTA is 0x0a.
> 
> 0x80010088 would be PCI_EXP_DEVCTL (a 2-byte register), maybe offset 2
> gets us to PCI_EXP_DEVSTA?  Not sure.
> 
>   0x0001 PCI_EXP_DEVSTA_CED /* Correctable Error Detected */
>   0x0008 PCI_EXP_DEVSTA_URD /* Unsupported Request Detected */
> 
> Not impossible that these would be set.  Lots of URs happen during
> enumeration and we're not very good about cleaning these up.
> Correctable errors are common for some devices.  lspci -vv would
> decode the PCIe cap registers, including this.
> 
>>> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
> 
> PCI_EXP_DEVCTL:
>   0x2000 PCI_EXP_DEVCTL_READRQ_512B
>   0x0800 PCI_EXP_DEVCTL_NOSNOOP_EN
>   0x0100 PCI_EXP_DEVCTL_EXT_TAG
>   0x0010 PCI_EXP_DEVCTL_RELAX_EN
> 
>>> (XEN) d0v1 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910
> 
> PCI_EXP_DEVCTL:
>   set 0x8000 PCI_EXP_DEVCTL_BCR_FLR
> 
> This looks like the actual FLR being initiated.
> 
>> This is the express capability's Link Control 2 Register afaict.
> 
> Unless I'm missing something this is actually Device Control.  So far
> I think this all looks OK.  The next part:

What you say is very plausible as far as the observed behavior goes,
but: According to the lspci output provided earlier the express
capability is at 58 (hex). Hence here we're 30 (hex) into the
capability, which according to the spec I'm looking at is Link
Control 2. Yet as said - with what you say being plausible, likely
I'm simply getting something very wrong.

Jan
