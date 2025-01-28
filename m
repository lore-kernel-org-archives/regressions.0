Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6C9A2D
	for <regressions@lists.linux.dev>; Tue, 28 Jan 2025 00:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022688; cv=none; b=dE1PiZT4m10M+fUxyD/oBWaXmCzlZQzH7V89PQZCNANlYqYrIg+1SVg6vFgqU3LN/jFqrNi87KUcqVVlE+DnowaxR0u9xVUCVjtRgIT7GQMG6get//WtLXh/HWGeI4hxeBenekl/g6ctqzFVNnSBUsSfhhvaeW9AU0etr1JsTWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022688; c=relaxed/simple;
	bh=KAoXkSlt8feMSrltKDXWXOGB2MEJXpz7rGCHgc2mJfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMik6PU6MdfT86NPyozHD1JcSCjWxovdcjXrhnkrttncYPwcYASCylEZQ/LY62q5y0qJ3/dL2cw90Fjy2vyxR9vabn9aKOoN6Z5059/ISPNJXGDzIn8aXmg+MGeZxSlhpOUsdR/5/XThPedNfi9Gj7wm9HJuRMOiH8ohL885BQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edaVHAcc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edaVHAcc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so53668865e9.1
        for <regressions@lists.linux.dev>; Mon, 27 Jan 2025 16:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738022685; x=1738627485; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eemsbZ6okcf087qLiLh0gj3mgI7cIF5l0GwYOpi1ILo=;
        b=edaVHAcchVJiZTlIA1MPXpnsb1cJRFFa2bWB97j4yqFLaGphQkA4PobfWxthKdyJht
         gIQjtwTR3Pkfraz1MLKeaB35aM0u0zS+2D8dG2zelMo+NPJrnZKaTsVxjJ/rrZtz1onf
         3kNnqheOGw2pwugUQ+mOp9M7JgeIPzIcxdThZe6Lwtyd+2i6y7bNPEGwxsVcC5baCZtq
         /p7u/9kaFvhYay3aYT8JqsMPne9lUj02b7f4UN0VEITKpvNZqdcm7GQoVsfJzlFa7EWV
         RNOka4oIIiFtv6A4t+9hz14bTPxC9IrfOJ6L5dsgmZsy4LyUM8eQLn9aonXRixXqqV92
         Ggkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738022685; x=1738627485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eemsbZ6okcf087qLiLh0gj3mgI7cIF5l0GwYOpi1ILo=;
        b=jjGisa6n9Nq2a0cxhU+nUq3oRI6YqqmO9MVPrXifw4dKPUWHczU8ghP5sYpbvqlSCj
         5HEG25vl4lv7M0ySjXqJyIuCZSqEh4afHYDTC3k+WJFITaHAAbOF/WVsfHoqvovjlUak
         rZhhJJUcxQZQ0UCA0VahJg4mcXu/b4TqcEx/DTmp0CjgT75t1zs2rqdpfMa8voARSxFU
         M4hVAI8PX437RzyZNs2Rj/uLoO/YEMDWoGPJXesAIlDVe8xqdLclbcyLIhfajODmHCyA
         SrSd0Lj/+LlFMh8ToD7Q1tA/TQONSJcqkU/1NHIkgcWpNMIh7Nla9SkI31bu2JV7Zcye
         LZXA==
X-Forwarded-Encrypted: i=1; AJvYcCVEijOl9S+tcc4UorklHdjpnvElnS0wkpHiO35q18IomejlgCXHrpQjIb3fBqZlGbh6sEvRoa13t12wNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0YTUnvCp3r/tlRty1WxoKyY1Cz9cSvp/cIbmjMpj29nzMb1VK
	3GV1jhd7BS7N3FPe0sMZk/APuyH4dLipsUECNbx0mFnVrh3GWayU
X-Gm-Gg: ASbGncs5qQBIyeYou/i5IOrkOwPa41tG7JMRulpKO8wEjzOrkSZWNeaqigZmtg+NLWk
	4nx4tSpqp8ODVKck9jJx70UAozqKsGQFxi9VhaW39J9dYlHgXIkuzvVHGI3H9QjkNJgt1vlG0kQ
	8fHTCCTh3cjKK7uDlhULEiTQN7SDOmD04ZRYKBFjCVgdXuO7D8yKZqrmpmog863Itgg5dX7EeGq
	Xr6gi/Fn1hLk1VjIuBjZ6DtnorNbBR2j/zQXJZNCF+dAfLfUALQcUl0Iyc8OodlDC5p64BRBPLX
	NXxHb9oqiPrK
X-Google-Smtp-Source: AGHT+IG3Clop1tgKlMpwwSYZCqVDTcwopkBm9/c1BM3OKVdp95GghBpZ6D2AUX9Zc6zxF8d2aoHbaA==
X-Received: by 2002:a05:600c:4e12:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-438913bdcd2mr351880695e9.4.1738022684533;
        Mon, 27 Jan 2025 16:04:44 -0800 (PST)
Received: from [192.168.0.50] ([79.119.240.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48a2f1sm148410705e9.17.2025.01.27.16.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 16:04:43 -0800 (PST)
Message-ID: <585f1075-a662-489b-bd5c-cf9f24291804@gmail.com>
Date: Tue, 28 Jan 2025 02:04:37 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btmtk: Remove resetting mt7921 before
 downloading the fw
To: John Glotzer <jglotzer@gmail.com>, sergio.callegari@unibo.it
Cc: Aaron.Hou@mediatek.com, Chris.Lu@mediatek.com, Deren.Wu@mediatek.com,
 Hao.Qin@mediatek.com, Sean.Wang@mediatek.com, johan.hedberg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, luiz.dentz@gmail.com,
 marc.payne@mdpsys.co.uk, marcel@holtmann.org, regressions@lists.linux.dev,
 steve.lee@mediatek.com, tiwai@suse.de
References: <9ae25475-e8f4-4ee1-8022-7621fbe8ebc6@unibo.it>
 <20250118165840.73110-1-jglotzer@gmail.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20250118165840.73110-1-jglotzer@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2025 18:58, John Glotzer wrote:
> (Note: additional discussion has taken place under
> Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And Hibernate)
> 
> Hi,
> 
> I have dug further into this issue and I think I have a root cause analysis that
> makes sense (at least it does for me :) ).
> The TLDR is that the root cause is the following commit that was introduced with the 6.11 kernel.
> 
> https://github.com/torvalds/linux/commit/d53ab629cff57
> 
> Furthermore, the problem must be the call to usleep_range() in
> drivers/net/wireless/mediatek/mt76/mt792x_core.c as this is the only behavioral change.
> 
> Notice that this commit first shows up in v6.11-rc1 and is present for all subsequent releases,
> which matches perfectly the breakage pattern seen by the user community.
> 
> What, then, is the evidence for this?
> 
> First of all the entire community has been unanimous in the observation that the issue
> started with the 6.11 kernel. The universal experience has been that any kernel prior
> to that had no issues, and all kernels starting with 6.11 were affected. Also no attempts
> to mitigate the issue in code by attacking the problem via the firmware download code paths have
> been fruitful.
> 
> The next piece of solid data is outlined here:
> 
> https://github.com/alimert-t/suspend-freeze-fix-for-mt7921e
> 
> Here the lead paragraph states:
> "A suspend/resume issue occurs on systems with the MediaTek MT7921 Wi-Fi adapter when
> running on Kernel 6.11.-. After suspending, the system fails to resume / freezes and requires a hard
> reset."
> 
> The mitigation for this issue has consisted of one of two approches:
> 
> - rfkill bluetooth and wifi on sleep and reverse the process on wake
> - add the parameter mt7921e.disable_aspm=y to the kernel command line
> (anecdotally I have seen reports of people doing things like turning off bluetooth
>  and/or wifi before suspending or for that matter rmmod mt7921e before suspending).
> 
> I personally have used both of these methods with a sucess rate of 100%.
> 
> The way to unlock the puzzle is to examine the 6.11 code with an eye towards
> - what changed between v6.10 and v6.11?
> - what is the intersection between this changeset and the disable_aspm paramter?
> 
> To cut to the chase the answer to both these questions is just the contents of
> https://github.com/torvalds/linux/commit/d53ab629cff57. I confirmed this by
> diffing v6.10 and v6.11 and then going through the diff looking for disable_aspm.
> 
> The following lines were added to drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> 
> 	if (!mt7921_disable_aspm && mt76_pci_aspm_supported(pdev))
> 		dev->aspm_supported = true;
> 
> The bitfield aspm_supported was added to the struct mt792x_dev in drivers/net/wireless/mediatek/mt76/mt792x.h
> 
> and if this bitfield is true then the call to usleep_range is made in  __mt792xe_mcu_drv_pmctrl()
> in drivers/net/wireless/mediatek/mt76/mt792x_core.c.
> 
> 		if (dev->aspm_supported)
> 			usleep_range(2000, 3000);
> 
> By setting mt7921e.disable_aspm=y on the kernel command line, this code pathway is avoided
> and no crash or lockup happens when the device is woken back up.
> 
> Disclaimers:
> 
> - I don't claim to know the root cause for why the call to usleep_range() leads to a crash or a
>   freeze.
> 
> - I don't know the details of the specific issue the code for commit d53ab629cff57 was designed
>   to fix, hence I don't know the consequences of removing the call to usleep_range(). However,
>   I do know that the user experience has been significantly impacted negatively by the introduction
>   of d53ab629cff57 into the 6.11 kernel.
> 
> Thanks for your attention,
> 
> John Glotzer
> 
> 

John and Sergio, have y'all tried kernel 6.12.8 or newer?
People say the suspend problem is fixed:

https://bugzilla.kernel.org/show_bug.cgi?id=219514#c11
