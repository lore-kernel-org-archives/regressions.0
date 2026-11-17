Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913913;
	b=ckKtJ5OZywPMTzuuZ6MyP6ydpyBWwmFtc5qNOKeP6VphbFX4TkTQ2ZZEHLasllrigr6O
	 CppDzKRPblDITCla3yntS80nVpOqx2IrNosgLsoXXHG7EC9Setr/Gr6rClUfUrs5ZQHhA
	 GS5JkC2a3si49hWbpnkMcIGNMXc8w1MWZrj9T1vvtwLcTFjVujKic1F1y4htnqUtN9bKC
	 gh5fd5Yq8EeHi2xaj74bYEYF7Z8J/m2vi80mRoUCZAjciDdjcxr8TWJwfn1G7KfdX6txw
	 kbhT8NeADaOoXUNktNUE4hcOgK4C5KN5A0/yxqxhs0rcXE2nVZAIoPS4q9eATCxJnuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Kn42LlYA1UZYSbOfHBABnjOJ0sk0wIks9BO0RA5nM0A=;
	b=G0UzPAQ3CHGlc1UrzbDBmEkvdDiADQFN9DwQTKZzk4oW6QADQsqyR9bN+Wmue9/+ZMY6
	 feIR0f22lKVLD4wET1r1HWZDgL/AHQ3OsFx3HYTJ/C4KPNqqV4+aKNzkCF1A2KiI4m+iM
	 QkpgAMO4bnTOK5UcuBNyHzHHYvGbKKTY6bb10J2b4AlLMR4q+FDS1rQ4SmzrNX0fQXn1i
	 4zL6rOBlydKrpiFKp2GHsya+2sQjD61A9ADC+He6Bu90T9pCc+EtHrSwqfuNgpVqyuyqB
	 upeGmMkBrWSdDg4doCXJEYvCBI4qBoLZmwFGnFoXFu95tisLMgFnMLuiLfXAJs9IGmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLIuBgwv;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3385E606A329
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 11:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3385E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLIuBgwv
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso46430335e9.3
        for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 03:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913911; x=1795518711; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kn42LlYA1UZYSbOfHBABnjOJ0sk0wIks9BO0RA5nM0A=;
        b=qLIuBgwvu8HewGkB/6/krSrcMhOuLjT4PBy1dKzynpF54szwtFqWJ1advO2v5urc9l
         SBx8HXunBDM0A61N0eehfitFLQouG6K+9F1pOIxwhv8qObyi/kLUdx3xtEEsrLt64Cma
         Dw+Kj+NPp3sb13LJ4LdfKVfR5D9f6tJE1PlgNijahSsICto0bAzqMpC1MwVUiIasWvtt
         ENjRb09z2CtFTndzfGKwvMENpluGENXhCMZ9o4QPksB2BUIDmzuGGrRJDqYYgd/1BmA1
         wwqC8yMGFRnLM8mTEPCojno6hjUEJDPcrafyEbOpvXrnmTBMSEirusPbb0O4AFZVLf1K
         1kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913911; x=1795518711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kn42LlYA1UZYSbOfHBABnjOJ0sk0wIks9BO0RA5nM0A=;
        b=hGUaDOTjY0zsEUncI4U1q4nxGdlaqZW84T+RMDQ0hVMI6565oTu4s90QxgAUEMJLoh
         WNXJugDgx/9/9lELTZSm0RBWEWm/NQnwDy9ZaaFF4dvpELZXudW6auGiNPsZge0CBhWX
         1XD6+QHSxxMnX+EqPpEMfMQkTEKgFchAytg1Z8ffI/9XQ54718gQ4V6zUa8//k4lDkuv
         wZVoiF9lu9G0jXWf3vA+ViL8eLlQTYRPFTEW5UC+rPp8T1KCDpcKaELqoa1udBHUxs9Y
         PaGVj94CTboTsjXBshtu2qWr8Dtb6vwSk5xwRiI+yc3JKcPlo49Ivg7yFtcyQgZ0s1AH
         3iPw==
X-Forwarded-Encrypted: i=1; AL+hErGglw2LWuFEitjyYf2f4Jml0kVosGGbOEabF60IagbWBKLLFthnfm67lHj1YbR7Ms591jN0M7sC3yvAyw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9AdVqQq89QIkp13XvlmA9SLH1hEautElaXRv3EyoGyzCY94KjV
	fSPd2O8lMzXIcdx/FD/1GF2Gd4KiZbwV6WY3mK+e65hSTLv1YXfnWt1G
X-Gm-Gg: AYBFou3U9LCnQ5swsOkrlnA9VrTPtZpk7h7F0cnBObQbRJuChyyyXZcnnp7E0ZcNNE1
	ED/6XD1KTuhfDJ7UWteIo7n1bdxJ9ioj86IuB6r8PKZ9RtpmgJWC6qhwiLqBrv9RTzXwkXUHBM2
	E83PiXyiSWQWy3x2VxbIHzjTMmDLsRTeRLpOwFsTPojVLSy1VHkuTP+9ULLRPPKAw4NqI/SqEzi
	MsL4Huk9SM+cBEzHhyMsWgkCrbSCO4jVECfK8FYhB9rMeOiKO3JRdee6KID526eSeM8BjBvQpYG
	D1q2kVjadqbdWaaCIJNbPN9HJ4bgniBN/OFuxO997LMZlnyiNRoa2p69bfuLsRVJg4TxIEgfi82
	UVIHCYHAmlasFO1DI9kvXJYV/WPAgOQaUU2c5Uo7png6MmfgDKgZ2T2J2vVu+BZB2/J39kdb2YY
	YA9Ex8jQty8l+CxY2OdMHgm9UqrB/1ChSkpoTQvJ5bRyThO87sUMnTX7tYnBolg7FtwgE2h8QVJ
	/v/+hbK0fWquIXDFEwBRdDMd3BhvGk2Dg9C8IfMOt+Dsw6N51XBIxFouVi3oTjsFXFBHBCWZf8F
	bFK0Lgn4AiGSUbZ88yvO8dUBc1jxGgP+tDzMurJH+7Dxbqi/YKlV9IFFZx3Yz949K+NtXEVPUU3
	nuWLdqYCSN6okS67c8A==
X-Received: by 2002:a05:600c:4ecd:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb5599d31bmr293588205e9.0.1794913911432;
        Tue, 17 Nov 2026 03:11:51 -0800 (PST)
Received: from lima-fedora (eduroam-269-3-018.epfl.ch. [192.33.199.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm20642423f8f.55.2026.11.17.03.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:11:50 -0800 (PST)
Date: Tue, 17 Nov 2026 12:11:48 +0100
From: Mihail Mihov <mihovmihailp@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org, 
	longman@redhat.com, chenridong@huaweicloud.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, tj@kernel.org, 
	hannes@cmpxchg.org, mkoutny@suse.com, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jstultz@google.com, qyousef@layalina.io, 
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] core scheduling latency with idle load
Message-ID: <avwzqWkw9dJMYlkw@lima-fedora>
References: <20260605105513.354837583@infradead.org>
 <20260605124052.227463677@infradead.org>
 <avt_mdiPQ5gwAisa@lima-fedora>
 <add0d6ee-c28d-4274-b8d1-58638abac47a@amd.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <add0d6ee-c28d-4274-b8d1-58638abac47a@amd.com>

Hi Prateek,

On Tue, Nov 17, 2026 at 03:52:15PM +0530, K Prateek Nayak wrote:
> That said, perhaps se_fi_update() could itself be optimized now with
> flattened pick. Could you try below changes a try:

With this on top of v7.4-rc3 the reproducer gives:

  kernel              no cookie  cookie
  v7.4-rc3            53         3290
  v7.4-rc3 + patch    53         54

(p99 in us, same machine and config as in the report.)

Tested-by: Mihail Mihov <mihovmihailp@gmail.com>

Thanks,
Mihail
