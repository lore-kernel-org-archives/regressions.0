Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903170;
	b=KET76IgtRdVWDl6MjZLJ5dDjl3sEho8uQt/uDOx7+eAwL4o45RKfKrgIMIwb2PuMnOJK
	 GdrsfBt74faqYIXZIdJ7uGknPsvt3Fv/wW1MwxHno36n7VXIVRp/VW7ZLK8K/VDYbAEe+
	 aEBC+DwntjIR00HlxQ3yrNo2Qy8q3b+BkNKa34UaiwNes/vq3Dg0bvzQwcce3IMln5sHJ
	 P1uJmrpiHkH4EBF5pkV2jSVM6peygh7XKS+YayCeNbEMiMUt1czG+E66ecTIMI7T/crUK
	 1Op8eRmtJ0yhB2c/kuaH0CcqSIdG+ioyqnY8PKv7Vri2mlYUilXD37DH2WFA/QbeReA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903170;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=A17FHW0l5aWYNBbIFZ2p7+RCziEeWQWBLY66JVjO1i8=;
	b=y+TNmIqno+JPXKs/K4dnkbwyc9OO2SlcWzeEJioV7z7rxl6jKQ/FzA+nEtiEte9m9qNP
	 Pg6jixctSLV6QnDB3Cb08gL4U8YdKD5P+VyJMfdbwfs/xUta4ePxRbovEKsVn2efY5dhu
	 h16Goon963ZKddiHFyb+tlbaTlyuJMHdMZUsmjuiMY2d56zeKMdnawiEPh2qMSzdjQv04
	 rsUUKYAOmXkJttA1OPjeN0hsq9yAmD4h85TzO1RDKDMmQuTAOIYkGjcam8whaoRhbw6wQ
	 qhb1qG57uG+Yh7AoYTZZlm3NpnX58dQJWkslDOTjL+WJ9yfM0bRO07Luk43JNW9EHZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ovcjTw8k;
	arc=none smtp.remote-ip=91.218.175.111
Received: from mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DFB606A323
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 08:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1DFB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ovcjTw8k
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=wmH6SEzwiy6JLTeXdF0JHUyTXTOLz+JUAWQRE3mbqOs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794903167; v=1; x=1795507967;
 b=ovcjTw8kU8+uNhPnRiPJZ524Sa3RVT7lrn5IqMdPJ2qVIvIZC3+QHdpLx7SseXRabGaYKXF4
 sqROZp3BfyTDbura/GLxeHBxQ2lbEOJ2TbWtUs1wV0dB25OWhakEamVvV5JRtlX3pDEJYmup3zV
 MPEFUgAx1MGvomJlCx8HtnEY=
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id bb0b660c2932bdcb;
	Tue, 17 Nov 2026 08:12:47 +0000
X-Mizu-Trace-ID: bb0b660c2932bdcb
X-Migadu-Flow: FLOW_OUT
Message-ID: <d0219acc-0e2d-4bcd-b303-e7edaa236eec@linux.dev>
Date: Tue, 17 Nov 2026 09:11:13 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
To: Ted Vera <tedvera@gmail.com>, linux-sound@vger.kernel.org
Cc: regressions@lists.linux.dev, oder_chiou@realtek.com, lgirdwood@gmail.com,
 broonie@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/16/26 22:24, Ted Vera wrote:
> Summary:
> On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
> kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
> with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
> appears in devices_deferred, no RT5677 ALSA card is registered, and
> only HDMI audio is available.
> 
> The driver’s ACPI GPIO mapping added by commit 0cc00de3dd5b maps GPIO
> resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
> device. Samus’s DSDT uses those resources for codec GPIOs (jack detect
> and mic-present), not Yoga Book-style external reset and power GPIOs.
> The driver requests the mapped GPIOs before registering the codec’s
> GPIO chip, which appears to cause the deferred-probe loop.
> 
> Test and result:
> I built a temporary module against the matching Fedora kernel source
> that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
> that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
> card appeared, and laptop-speaker audio worked. Secure Boot remained
> enabled. This strongly supports the ACPI GPIO mapping as the cause.
> 
> Suggested fix: Restrict the mapping to devices whose ACPI GPIO
> resource layout matches the Yoga Book, rather than applying it to
> every RT5677 ACPI device.

Humm, it's a 2015 device that I used in the past without issues. It was
one of the early SOF devices... See commit bcb43fd.
Is this a commercial version or an early prototype? I don't recall what
EVT2 stands for in Chromebooks.
Also adding Andy in Cc:, he was the one who suggested the GPIO fixes.

