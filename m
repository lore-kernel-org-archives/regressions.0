Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306AB3E1CF3
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054877; cv=none; b=f6bwdx7rLDFqmirx5y8hhudrsAcT91ai8tQIPcahxVZcIBuTigAGjNRYIcCtoV/SMtxT5ZAMez4D+Hc4hXanq5j76bzHhyJDxGKYAtZ3xptG1G0lbcwFuuffoOmwc6kTpgDtaaxMjqymUsDKYboe+vrzGlFBQezvbx18z1RQxA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054877; c=relaxed/simple;
	bh=o794TmHSGyfou6IVoyu8vzy9hgYiBe8ZRTmwQYE3hrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=WotqLOSJTmfzkOG74hMMaMn77E8D4lkDBZD5QRZ6kabwT4oqaYqwOSfvnpN1iyZyWG8M+7eokdbtcaEiUhdsT3pqDTH9BXVmw4JwioFD7nSl1RSsBsh5lB5fvbPf9g1ZNtP9jSxHfgVhLiU2HaDMyvZEJYX6+Efo8tBoOUF0jUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=cm7NTW8i; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="cm7NTW8i"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4g9Sfl5T8Hz3wdY;
	Wed,  6 May 2026 10:07:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778054863;
	bh=o794TmHSGyfou6IVoyu8vzy9hgYiBe8ZRTmwQYE3hrg=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=cm7NTW8iBMi5WuJ3duW9tnkU8kaCVdBt3cxXVqr8PkZX9iyJEXKFW66dBEJWWwEa2
	 kXrlRQiCE62JghpcaPgkRU5Lo+hsiyve+GoJlF7xGJgRud0OQ/zxh7GjsIjDVoCGeb
	 zDyA/vZO/m+Gtoy+LYcXHqSKcA6Jr1ipJE7ELj5GNdRvGIPj88cfZhYmUK3KgIbtOb
	 dUjNuwKXQNIUIoRnBBN+vscdaJAVPADLxuv9d+Z6uXBH882JjOph0tYXuUlq3Gpa1r
	 dbytkGE4Z7cRMcy6HqY7ai/MaWWPCRhjxahuDROEhIsQCsmLufv/4p4EPh4ta2am8o
	 YBmapi+EnKEmA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4g9Sfg4lQ2z41dT;
	Wed,  6 May 2026 10:07:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4g9Sff0mfzz8tZx;
	Wed,  6 May 2026 10:07:37 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4F55D63449;
	Wed,  6 May 2026 10:07:37 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <00b05188-c352-42b9-888a-01e9bf00fb34@leemhuis.info>
Date: Wed, 6 May 2026 10:07:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression in 7.0] OLPC-XO-1.5 will not boot after commit
 157266edcc
To: An <an.m@mailbox.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <f8566380-6a40-435a-bf8c-6c0e0999d434@mailbox.org>
 <7a0c8eec-2e97-4eaf-a8aa-f7e97da93908@mailbox.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 the arch/x86 maintainers <x86@kernel.org>, David Gow <david@davidgow.net>
In-Reply-To: <7a0c8eec-2e97-4eaf-a8aa-f7e97da93908@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177805485774.3692967.1012349254078436911@mxe9fb.netcup.net>
X-NC-CID: 9Ejv8bIagbJkdzI+FwWAiJssPYhMwr1kEkfMfhhQAZhuENdHTms=

Lo! Looks like nothing happened since the report (please correct me if
I'm wrong, it's easy to miss something). Adding a few more people and
lists to the recipients of this reply, maybe that will things rolling.

FWIW, the culprit seems to be 157266edcc5671 ("x86/boot/e820: Simplify
append_e820_table() and remove restriction on single-entry tables")
[v7.0-rc1] from Ingo.

Therefore adding David Gow, who submitted a fix for the culprit -- but
that didn't make it anywhere afaics, unless I'm missing something. For
details see:
https://lore.kernel.org/all/20260416065746.1896647-1-david@davidgow.net/

Ciao, Thorsten

On 4/19/26 22:08, An wrote:
> On 19/04/2026 10.46, An wrote:
>> [please keep me in CC, I'm not subscribed]
>>
>> Hi Ingo,
>>
>> my OLPC XO-1.5 stopped booting when switching from 6.19 to 7.0
>>
>> I bisected this to
>>
>> commit 157266edcc56715323de1bd60e49194b3b66a174
>> Author: Ingo Molnar <mingo@kernel.org>
>> Date:   Thu May 15 14:05:41 2025 +0200
>>
>>      x86/boot/e820: Simplify append_e820_table() and remove
>> restriction on single-entry tables
>>
>> The XO boots from a forth environment and is rather quirky.
>> If I can help with any logs or tests, please let me know.
>>
>> I'm compiling a 7.0 kernel with the patch reverted,
>> but it smells like a plain revert isn't the best idea.
>>
>> Thank you,
>> An Müller
>>
> 
> I've tested both 7.0 and current mainline: with this patch reverted,
> they boot fine, the revert applies cleanly in both cases.
> 
> Thanks,
> An

