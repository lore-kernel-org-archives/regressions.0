Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866816;
	b=n+BpDk+pOrGbqhBRZJJNFYgi3eoZchwFpcr34tsCavHzREjoXcDRIwn4l/U3S8gd9INo
	 DQipNWwGsqi8g1TtJYbJuCQ9e8p3nETY/aOoEmjutvzaxIUiRCz1b+7rt0eTHYSurHUlo
	 AeJUPvAgzA9uncLpwbQKpwz82yGyUayuSWzF7ZHVnUsVJ1ESlUyxOrdpzZFAfU/p0j5t8
	 vbgc2cKIWJFV+2Ebg6rrtuxi0rkQrYv5vUEBHwNrxe5vX9yo0ZNDymY1bRO22BrfaE1Wx
	 +69jIpyaqzGu+PRUmaacvNdMCSs9W4a6y2LfbUUY7Nrgmb4j74b9bR4SI91CROv/OVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866816;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vsc7QdWwKgQ0PfQnJbRw/cR4lUlNXyZF39QitBUyknA=;
	b=z4UJZfj08JcO3YXayLnT8xWeMAA/ibTA8EH3aw/9UK1JaNJqySKl0Ae0Uno7L6B0qozj
	 vNGqqZt+VBzZvG8pQl+jRll4Q7yXYcwbOQWNYpHzmpByN3bjYpLduN2u60mQ5o0frZ4Xu
	 PtfKpN4afxZz9kXMgAJAHDOeWPezVSYbsmDd24AMrrHj7Z+mQdQigBRgcCjIPCuDzLgi7
	 lckxuoe/fwJ0fLGKxEvKH0Hkdb2SY8UgrSVyiJHTP9zq6xmUMf/UhEeoPlikFzzvXckcH
	 NSdQlzdeFkphw5nInksUtyOkxnM1ItaI/iJIU1YpMnwSoAqu2xJH/gkXL0i/T7l7Ykw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=Of763eXj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hV8+IW5E;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A6606A329
	for <regressions@lists.linux.dev>; Mon, 16 Nov 2026 22:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B3A6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=Of763eXj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hV8+IW5E
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 23EEB7A01B1
	for <regressions@lists.linux.dev>; Mon, 16 Nov 2026 17:06:55 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-04.internal (MEProxy); Mon, 16 Nov 2026 17:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794866812;
	 x=1794953212; bh=vsc7QdWwKgQ0PfQnJbRw/cR4lUlNXyZF39QitBUyknA=; b=
	Of763eXjGwumyQnteF7BPt3bSNwJYxBYa3Ev1ubdkMJgbxaDdyDoru+KwDpp6Kjn
	3J15TwralibmvGbLxoB3jUprbfD7dOWhF8Wqd8kcvonwj1zXOkqANlBgWWBl6H+Q
	x4vdUKkz4Gvqjw3Tbuh95SnOOKujzgd6j2HkoINlXyJra1g81L1/zLzJKZXPElsY
	0HATUZQYE5DkKZ+zFpiEpR4XmLfeOqqX22p1lGqL8GG5S3+3/fAgtxKDyTdftSoW
	gPO0yG1IyurAh6KLuhD4Zfx+0NpgPBgtiFvpnS5hKQN1teBhbVnrWInR/cU4BPbC
	cYyWQ+R3W4J6cAqM29uVFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794866812; x=
	1794953212; bh=vsc7QdWwKgQ0PfQnJbRw/cR4lUlNXyZF39QitBUyknA=; b=h
	V8+IW5EzZMBpWZZTLRayaQ8zWdy176E6AWKIuX5tgYoiYi1MNvSkv/iCUXnlZHEP
	idK5efB5kS1shjR6b7B81P8t/yto4ZAaO0RV8OEFXPB44Xeq6TjhqdhOU2yn6ulS
	Z4h51SETI2MAflXkLbVjqUn0J0tkyCdGCBZ4ci/C7nsGmBVzuPmdrkkI9QYKqCL+
	J26AGHPzCwTUAoUC3eEjZSkr0YzGUPHUQBKPgCsl3FtHWzWE8b8Z78m6g3Ms9O+L
	vynSMUU+Py7/6iH94n0b7mQXSs+9OxovbcugYKyDtpGnWVj/8bsw4xM/qaNAxpag
	TALzoPDk3HK4x3ewFDA0A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794866812; d=pobox.com;
	mf=PGJhcnJ5bkBwb2JveC5jb20+;
	rt=PHJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:T2oN0JSMHb/sldfge9Ym/Z10yOQPiDE5Vj8FCA75rwxwirK
	WMDI9l6ZBJlOWqCFQwiSUSCOGSDs3MsCdT8IYDlt2gQSe0jQnoRoXbR/K1K32Iyh
	sEb3IllK1QEZclpQIPLDPKaehwIA/Tbh9sdyUlksQO36y2TCo+xEgHQT2cxy/OoW
	6KIqHiKTSpzVgOB/vALG+BshT3BylrMa9+O2rzME3tfMWXAa0dXlyoEEiO0TlBsc
	k70YWu5qbvJ26WcWACFWlrjb6SESlwsFgvRUhd5EUFe86wYjw0xEUnQuXKXY+wrl
	O9AL4PAACyqgpRCcw/Kk0vHifGgjnAGoZ+EWFDA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:UyL/Iv80/j5QV7yVFqfIl7cbPB/ppw8/4Va7FOuu8EU=:4j/DMfnc0hdTWO0CRI7hD4D97WMBwHIteEaLnc8xQz0=;
X-ME-Sender: <xms:fH77alNur4u4gJACJ3d_TMQmPcdiHMYoedMX3HflSe1a2NtCi8Sb4A>
    <xme:fH77aob-_vh4Rr8wAU_WoP_xrpMzSFwmm1saRTZ_XL3R91JmBhSNr3UOvUOl0ayia
    K4enhEgrJFY3CJmjkaWlgz9zCdBuvPzHREMNSd51u7msJTON_7zZRof>
X-ME-Received: <xmr:fH77akAzqlWoIEgg5PMO5UDMjqPJDq6_BT_lEjo4nHnJUap_X7LKvzx6wKuWB7S8eR3-W-xq2CzZ04ZVkmRtAWU1TUIR0hiP>
X-ME-Proxy-Cause: dmFkZTFtc41ee/Iidnc/YKyFRrlcbY0qjv7vqTZLN5qT1G/s1A6ODY0jpLG7OyEpYUVtYp
    rxrHQVSxWkmpyGRsz9lunc8LDSpBqe9tsIONdlQ3MpDcLVxPNBosQA61pMRunTuvOsWRK0
    XlAqabvwAjhMKyQyDzm/UFdyEHNWaCwCwWjvl882gkJh451mUafQaBB0yDkAGs/9YPYQL3
    i8GF1w5NLrcOdAemY4lV9Xqv5dH9DyE3gxX++6KPQ6gVwc508qBf7RvoV4KaDZBU2lGdzt
    VawjCYAbC2Usre/a6pEIEddTaKECceSLt9P6H40e0jaAAEzuItvughm0hzu6r4rd8RJ1QZ
    oM4+bIXmMb6cDj57o0CGr6UGHVlHQdBL9mALTfZc5kC48fbdUaH357WhcWWQ7CAqrKDByh
    wsCzY41+N+Auu28QIaqd6IuuLgK8Uu0+VdAnBNh3EUtmD1gPqlYqgeY6oWwsGhYMp+Gabt
    SoZ2SEVwMaT6KRBp8lEv4OYdZpP5e6KK4TTlaT8uDUFFpRmlkdmk4haJI0fKtQlTlsEz6p
    dXmLLIy5ZPD5zDt1GpwH6ywPe04dh8fW5w2QYI6X9KyRsb99oplKk6oIh2GFc0dsIE39LK
    90vn+8HI9Zehkdy1WNoCmZ3uIDeB53vY2RBOKm9ZSRq5S21pjy0Wv1FBnU/A
X-ME-Proxy: <xmx:fH77auEhFXkbc64TI9i3tVfon4gv-mH-eP6aOB-13zMl7bwebge5_w>
    <xmx:fH77anOdhv6zpDgUCj-lZBLkMKmoj0__a5uS7gasdEY2qNdhCtIH6Q>
    <xmx:fH77ani7feRs8uW4UmJVeNoy82Mq0tUG2hfzPrSGsVZAbUI8EsqC-w>
    <xmx:fH77av0p6DYMXP-WghMsthNo2C6TSJno4dSPXYvRcchbOGsU7nIDJg>
    <xmx:fH77auSSAO8p553AhlbtJ0V_FAzfA9yDLSSecJfHSRRMfdLsovFEBgzc>
Feedback-ID: i6289494f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 17:06:50 -0500 (EST)
Message-ID: <2ed04104-e061-47e4-914e-3a2b35b214dc@pobox.com>
Date: Mon, 16 Nov 2026 14:06:49 -0800
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
Subject: Re: [REGRESSION 6.12.117] CPA detected W^X violation:
 0000000000000121 -> 0000000000000123 range: 0xffffffffc0477000 -
 0xffffffffc0477fff PFN 109c1f and WARNING at arch/x86/mm/pat/set_memory.c:665
 __change_page_attr_set_clr+0xf62/0xfb0
To: Sasha Levin <sashal@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, regressions@lists.linux.dev,
 Salvatore Bonaccorso <carnil@debian.org>
References: <avdb9EPXBv2hRCzQ@eldamar.lan>
 <draft-agent5-0008-re-pat-wx-regression-612@kernel.org>
 <2e149d01-c932-42d3-9698-c1555e542cb1@pobox.com> <avpUlHHaimEE_Rib@laps>
Content-Language: en-US
From: "Barry K. Nathan" <barryn@pobox.com>
In-Reply-To: <avpUlHHaimEE_Rib@laps>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 4:55 PM, Sasha Levin wrote:
> On Sun, Nov 15, 2026 at 03:16:20PM -0800, Barry K. Nathan wrote:
>> On 11/14/26 9:42 AM, Sasha Levin wrote:
>>> On 2026-11-13, Salvatore Bonaccorso<carnil@debian.org> wrote:
>>>> One followup to this. Reverting
>>>>
>>>> Fixes: 091c44b2d3c3 ("x86/mm/pat: Use pr_warn() for early W^X warnings")
>>>> Fixes: 11d1ba991c07 ("x86/mm/pat: Fix effective RW computation in lookup_address_in_pgd_attr()")
>>> Thanks for testing. Queued reverts of both for 6.12.
>>
>> I see that in the current stable-queue (commit
>> 3b8ff7f280433e6fb085dbc4f44ac6a138f352a0, "Fixes for all trees"),
>> these two reverts are queued in staging-6.12, not queue-6.12, so
>> queued up for 6.12.119 not 6.12.118 as far as I can tell.
>>
>> I don't know if this was some kind of oversight or if it's
>> intentional, so I just wanted to bring it to your attention.
> 
> It's intentional. I don't want to play with the queue right before the release,
> and we've already shipped this regression so there's no reason to rush.

OK. Thanks for explaining!
-- 
-Barry K. Nathan  <barryn@pobox.com>
