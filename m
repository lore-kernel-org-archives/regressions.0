Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5211A7AFD
	for <regressions@lists.linux.dev>; Thu, 24 Oct 2024 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729763928; cv=none; b=t5p6t3LGzs9ysKgHKjUlvXAZoeitxNxC7lgcZCr0ZZliEJroK5Jbw8nh3RueMmtYfkzzdIN7Nj0hoilKesjCXrFVw6tqr2UlwVh4eUAYpuIp3LfruTgMbk5tMbyBFTclEJXWk8UMTCgDL0uQQ3O2AuOLoqUJR730GhBxx4R2VGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729763928; c=relaxed/simple;
	bh=QHXnjOgCPPpa5dlNMKVpMlC0Fl8KAJdep5uCSVlvPbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSr5pEIVKtZmnWrehFhW6NK7R7+9AuMps9KNkiHP1yqtqTFoPrFTgFbGxI7/IO+UBfUfwZGySnRREOjIDVNZkiNV+xCgwsEMG2TlW9wgjfRPKfVZFGQy21i6nxSgujMNGGAfRSvG6ySMvt1pOp2kT8FxCs7lIhVkUAng514TIlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JnuHwcF6; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=TVw3P/pZ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JnuHwcF6; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=TVw3P/pZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JnuHwcF6";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="TVw3P/pZ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JnuHwcF6";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="TVw3P/pZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9DC9D21B62;
	Thu, 24 Oct 2024 09:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1729763923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZntrTTptEiqTMwL6pTNPKXw1ByWsGeunjCMJ5apeUM=;
	b=JnuHwcF6niwKs6WSZOtKmV4ZWu+TtP3BcV+t/7IMV93PyqLhjkUhFCvH+a4XZJSfcNAYn2
	GtYIcp5Uj6jABfCP8kaTn7IG/m1ECaWKU9/dCwfN0kqrR/rBV/aj+CNGSXcmSYIGVL9GRN
	IcEwUz+R0Cv/4RSsImt/4GlhAyF+gbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1729763923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZntrTTptEiqTMwL6pTNPKXw1ByWsGeunjCMJ5apeUM=;
	b=TVw3P/pZjP1aBnRezLWl/ZwgrLtgBdT1zRgOFRIxCSW23Ktpe6UpdHnZATwvaGOqP44IYs
	C7SUbHloUMRBgnCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=JnuHwcF6;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="TVw3P/pZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1729763923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZntrTTptEiqTMwL6pTNPKXw1ByWsGeunjCMJ5apeUM=;
	b=JnuHwcF6niwKs6WSZOtKmV4ZWu+TtP3BcV+t/7IMV93PyqLhjkUhFCvH+a4XZJSfcNAYn2
	GtYIcp5Uj6jABfCP8kaTn7IG/m1ECaWKU9/dCwfN0kqrR/rBV/aj+CNGSXcmSYIGVL9GRN
	IcEwUz+R0Cv/4RSsImt/4GlhAyF+gbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1729763923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZntrTTptEiqTMwL6pTNPKXw1ByWsGeunjCMJ5apeUM=;
	b=TVw3P/pZjP1aBnRezLWl/ZwgrLtgBdT1zRgOFRIxCSW23Ktpe6UpdHnZATwvaGOqP44IYs
	C7SUbHloUMRBgnCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D13E136F5;
	Thu, 24 Oct 2024 09:58:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U3EqHlMaGmcwVAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 24 Oct 2024 09:58:43 +0000
Message-ID: <f81ef5bd-e930-4982-a5a8-cd4aca272912@suse.cz>
Date: Thu, 24 Oct 2024 11:58:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: darktable performance regression on AMD systems caused by "mm:
 align larger anonymous mappings on THP boundaries"
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Rik van Riel <riel@surriel.com>
Cc: Matthias <matthias@bodenbinder.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Yang Shi <yang@os.amperecomputing.com>, Petr Tesarik <ptesarik@suse.com>
References: <2050f0d4-57b0-481d-bab8-05e8d48fed0c@leemhuis.info>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <2050f0d4-57b0-481d-bab8-05e8d48fed0c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9DC9D21B62
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:dkim,suse.cz:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 10/24/24 09:45, Thorsten Leemhuis wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> Rik, I noticed a report about a regression in bugzilla.kernel.org that
> appears to be caused by the following change of yours:
> 
> efa7df3e3bb5da ("mm: align larger anonymous mappings on THP boundaries")
> [v6.7]
> 
> It might be one of those "some things got faster, a few things became
> slower" situations. Not sure. Felt odd that the reporter was able to
> reproduce it on two AMD systems, but not on a Intel system. Maybe there
> is a bug somewhere else that was exposed by this.

It seems very similar to what we've seen with spec benchmarks such as cactus
and bisected to the same commit:

https://bugzilla.suse.com/show_bug.cgi?id=1229012

The exact regression varies per system. Intel regresses too but relatively
less. The theory is that there are many large-ish allocations that don't
have individual sizes aligned to 2MB and would have been merged, commit
efa7df3e3bb5da causes them to become separate areas where each aligns its
start at 2MB boundary and there are gaps between. This (gaps and vma
fragmentation) itself is not great, but most of the problem seemed to be
from the start alignment, which togethter with the access pattern causes
more TLB or cache missess due to limited associtativity.

So maybe darktable has a similar problem. A simple candidate fix could
change commit efa7df3e3bb5da so that the mapping size has to be a multiple
of THP size (2MB) in order to become aligned, right now it's enough if it's
THP sized or larger.

> So in the end it felt worth forwarding by mail to me. Not tracking this
> yet, first waiting for feedback.
> 
> To quote from https://bugzilla.kernel.org/show_bug.cgi?id=219366 :
> 
>> Matthias 2024-10-09 05:37:51 UTC
>> 
>> I am using a darktable benchmark and I am finding that RAW-to-JPG
>> conversion is about 15-25 % slower with kernels 6.7-6.10. The last
>> fast kernel series is 6.6. I also tested kernel series 6.5 and it is
>> as fast as 6.6
>> 
>> I know this sounds weird. What has darktable to do with the kernel?
>> But the numbers are true. And the darktable devs tell me that this
>> is a kernel regression. The darktable github issue is: https://
>> github.com/darktable-org/darktable/issues/17397  You can find more
>> details there.
>> 
>> What do I do to measure the performance?
>> 
>> I am executing darktable on the command line. opencl is disabled so
>> that all activities are only on the CPU:
>> 
>> darktable-cli bench.SRW /tmp/test.jpg --core --disable-opencl -d
>> perf -d opencl --configdir /tmp
>> 
>> ( bench.SRW and the sidecar file can be found here: https://
>> drive.google.com/drive/folders/1cfV2b893JuobVwGiZXcaNv5-yszH6j-N )
>> 
>> This will show some debug output. The line to look for is
>> 
>> 4,2765 [dev_process_export] pixel pipeline processing took 3,811
>> secs (81,883 CPU)
>> 
>> This gives an exact number how much time darktable needed to convert
>> the image. The time darktable needs has a clear dependency on the
>> kernel version. It is fast with kernel 6.6. and older and slow with
>> kernel 6.7 and newer. Something must have happened from 6.6 to 6.7
>> which slows down darktable.
>> 
>> The darktable debug output shows that basically only one module is
>> responsible for the slow down: 'atrous'
>> 
>> with kernel 6.6.47:
>> 
>> 4,0548 [dev_pixelpipe] took 0,635 secs (14,597 CPU) [export]
>> processed 'atrous' on CPU, blended on CPU ... 4,2765
>> [dev_process_export] pixel pipeline processing took 3,811 secs
>> (81,883 CPU)
>> 
>> with kernel 6.10.6:
>> 
>> 4,9645 [dev_pixelpipe] took 1,489 secs (33,736 CPU) [export]
>> processed 'atrous' on CPU, blended on CPU ... 5,2151
>> [dev_process_export] pixel pipeline processing took 4,773 secs
>> (102,452 CPU)
>> 
>> 
>> This is also being discussed here: https://discuss.pixls.us/t/
>> darktable-performance-regression-with-kernel-6-7-and-newer/45945/1 
>> And other users confirm the performance degradation.
> 
> [...]
> 
>> This seems to affect AMD only. I reproduced this performance
>> degradation on two different Ryzen Desktop PCs (Ryzen 5 and Ryzen
>> 9). But I can not reproduce it on my Intel PC (Lenovo X1 Carbon,
>> core i5).
> 
> [...]
> 
>> By the way, there is also a thread in the darktable forum on this topic:
>> https://discuss.pixls.us/t/darktable-performance-regression-with-kernel-6-7-and-newer/45945
>>  
>> Some users reproduced it there as well.
> 
> See the ticket for more details. The reporter is CCed. openZFS is in
> use, but the problem was reproduced on vanilla kernels.
> 
> Ciao, Thorsten
> 

