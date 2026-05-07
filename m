Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AAB40DFB9
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778112898; cv=none; b=sl64ZxvfyZZ+IOWdaAGt1GxIAKi1JrOLv69vtOgwjIwOf7zoIcP3STA2M6KlYyKiLpHQNLGJ9ZFeGJTGfx6IhxipjBYa19IfNKp6GTjq+vQhcfdCh7/Qk5ZRmNDOMUS+1gVpFqyaCEE2S9mCRkK66wNqsOAWn2sW5jp++Jl+NMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778112898; c=relaxed/simple;
	bh=xfaw4SbLzf+eaeycSPwFyC57bv4mI3tCqdQhG+RRAZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ds94c+VHhxqtFed8PY9YFFCN9/xqQALHgf7MckZl1zsd9iUd0ZA/QT+qaH+suhS/VQxMmk6O/wuAzpme4Zg6qiDMcCftU9ZGiFk1T8KSNyetZKfDo+RAAWSk7lwkqCNfXq57ofq4chzDqyyRerDP7aopfzJr4sHeWnZDInR0e1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AJHLtxSV; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AJHLtxSV"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g9t6Z5cfQz9t0p;
	Thu,  7 May 2026 02:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778112886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iRp7Cl2HuKwi7sTsNTqG44nTcqyQXaooqqRcWOa6J1o=;
	b=AJHLtxSVn4xXJfPgf8nVHvnvXvhwn5TLlWmA2R6pRUFW56VqVEg8gnEB3+YaK/5H7KEuKL
	3Q8zYy+EpqIsg+Kw9i17DFZB9/aKIEwlVASFKTiMED/o8B1Slg6zsZs2b1p3OU3uDrz3fF
	u/V5QeYKjIuZlLgfZR5AjOfFM7j/DFH+CYC3GpzkTk/WCVKS+kMCGOzpnxyd2lgCKnm0UT
	PUxXWES+V9OGDhKpkHLl7MOY22NQAbFFfu5XrwQ+rksNEV5joMfArJCGX6XxxSFtSYPFhL
	HcTAghikNYp5YNz3chr6wicIfUyiyQKJc+K6mWkCeoSdqCQt1QdQBIYTw9G5AQ==
Message-ID: <1c62365a-dc47-49c1-8f80-28d459a08073@mailbox.org>
Date: Thu, 7 May 2026 02:14:38 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [Regression in 7.0] OLPC-XO-1.5 will not boot after commit
 157266edcc
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 the arch/x86 maintainers <x86@kernel.org>, David Gow <david@davidgow.net>
References: <f8566380-6a40-435a-bf8c-6c0e0999d434@mailbox.org>
 <7a0c8eec-2e97-4eaf-a8aa-f7e97da93908@mailbox.org>
 <00b05188-c352-42b9-888a-01e9bf00fb34@leemhuis.info>
Content-Language: en-US
From: An <an.m@mailbox.org>
Autocrypt: addr=an.m@mailbox.org; keydata=
 xjMEZ2CKehYJKwYBBAHaRw8BAQdAvfR1JEq0mSlLCQwcOeAl2HJry38Kw1GHol8sPFDi+efN
 FUFuIDxhbi5tQG1haWxib3gub3JnPsKJBBMWCAAxFiEErzG7VMqA+0YshaGzid5SicaPpuwF
 AmdginoCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRCJ3lKJxo+m7EsHAPwISvlSbB1SLXRiA66A
 zlxg6R50geZ6Ifs7qRoSg72AgwEAkF4CtBdvoyzRrYF6neV9upoNmEdR7bjFpM5SomBKKg/O
 OARnYIp6EgorBgEEAZdVAQUBAQdAeD/lXk9E/+te8aCd+lw9CS+MTJ+GWVX51H6+cG3LhTsD
 AQgHwngEGBYIACAWIQSvMbtUyoD7RiyFobOJ3lKJxo+m7AUCZ2CKegIbDAAKCRCJ3lKJxo+m
 7Oh1AP9qHFwpB/ZnofK5G8kcqk8KlmZy7A6iwqsUk7/bNZyp3AEA9kPdrLFPq8S7xvY0m+Ss
 Rm7xGx4z96H9icfVBBWOaA0=
In-Reply-To: <00b05188-c352-42b9-888a-01e9bf00fb34@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5wrdb7hf8m6h7haej4p7gz6wz6cm3qut
X-MBO-RS-ID: 5e7d4d19fccfdf469c4

On 06/05/2026 10.07, Thorsten Leemhuis wrote:
> Lo! Looks like nothing happened since the report (please correct me if
> I'm wrong, it's easy to miss something). Adding a few more people and
> lists to the recipients of this reply, maybe that will things rolling
 > > FWIW, the culprit seems to be 157266edcc5671 ("x86/boot/e820: Simplify
> append_e820_table() and remove restriction on single-entry tables")
> [v7.0-rc1] from Ingo.
> 
> Therefore adding David Gow, who submitted a fix for the culprit -- but
> that didn't make it anywhere afaics, unless I'm missing something. For
> details see:
> https://lore.kernel.org/all/20260416065746.1896647-1-david@davidgow.net/
> 
> Ciao, Thorsten

Thanks Thorsten!

No, nothing happened here.
I have not been able to grok the program flow.
Now reading David's patch, the "initially no entry at all"
bit escaped me. Oh well.

I have compiled and booted mainline (today's git) with
David's patch applied just now. It works for me too.
Thank you David!

And thanks all,
An


> On 4/19/26 22:08, An wrote:
>> On 19/04/2026 10.46, An wrote:
>>> [please keep me in CC, I'm not subscribed]
>>>
>>> Hi Ingo,
>>>
>>> my OLPC XO-1.5 stopped booting when switching from 6.19 to 7.0
>>>
>>> I bisected this to
>>>
>>> commit 157266edcc56715323de1bd60e49194b3b66a174
>>> Author: Ingo Molnar <mingo@kernel.org>
>>> Date:   Thu May 15 14:05:41 2025 +0200
>>>
>>>       x86/boot/e820: Simplify append_e820_table() and remove
>>> restriction on single-entry tables
>>>
>>> The XO boots from a forth environment and is rather quirky.
>>> If I can help with any logs or tests, please let me know.
>>>
>>> I'm compiling a 7.0 kernel with the patch reverted,
>>> but it smells like a plain revert isn't the best idea.
>>>
>>> Thank you,
>>> An Müller
>>>
>>
>> I've tested both 7.0 and current mainline: with this patch reverted,
>> they boot fine, the revert applies cleanly in both cases.
>>
>> Thanks,
>> An
> 

