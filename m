Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C1228151C;
	Fri, 12 Dec 2025 23:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765583679; cv=none; b=e5n2g92A9aezqkSTLYZJtyiYTV/Ck0aJlyohBRIAZVGg5G8ivY+JSP6BQWbgTX0CAbFxxTMc43PnRBNm++nSdCU1OCutjRtkV7vTC9iaxtNpdlCsW8CJsnumc3G25ZG6DrwrQ2k/KIEPUef4wY9f+3EbpSgcYnQvPlsUJvR1Ohs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765583679; c=relaxed/simple;
	bh=rbFoYYCdm5OZyPr+ipmbWLuXMT7EHks1Ycrt+Vp0BKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtUWpz44qsw+oEtZqhqDiqLF8VVyKUHGblr4S6N/6xUbt5FN1n8j8Ij4Ck/4e5OalvcLac6kffxV1Vq9NSgA0KFS2NpIjklR2qUwB7KSkdLjiiLJLlSPVDlx8k3vq4CstfZLnnZyqRbkqtyS48QZwVBVKkgRyM27PPTfqI4tBTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kK7+ySjc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kK7+ySjc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=6EXaQZLb5YPDccfLB5ViaWu5r+6IQcYByRuH+vk2IWU=; b=kK7+ySjc99sV87p8feqZj73z5q
	CQp3FU2IYmMM46GDMfUef9fvoB6tg3uWOhGb5Pbve1MYLsyeq5KzhxYtAiNBa2Pk9UmJI/PJDso29
	35O3rs5hrLiQImOv5DWj4Rcw4VckSCKdJGeJ7aA8sZhX3tml1Z8cvIv1FDvpr01BuydYIlxGMqGHO
	o5RtUOcuI+2ojqwvyOqUXINuuzic3vK7LWQ99yvbPfJrSl1KyJ1H3sw9eD6mRYLivAMfp3TEwgb+B
	0ptFDke1fu/mFk06wOszZocVenvBRMjk19gMgI5fT+CDji08yCADsiELUkV7tpTAsrGqqDwWnyeMj
	PIgeJ1ZA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUCy2-00000001E75-1YUV;
	Fri, 12 Dec 2025 23:54:34 +0000
Message-ID: <0b68a5a4-2f05-43a2-8de2-3efbe8a8b7e4@infradead.org>
Date: Fri, 12 Dec 2025 15:54:25 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel.org tooling update
To: Stephen Hemminger <stephen@networkplumber.org>,
 Thorsten Leemhuis <linux@leemhuis.info>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <f1bb8d04-9949-417d-9726-64787994d40e@leemhuis.info>
 <20251213084827.634cb60f@stephen-xps.local>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251213084827.634cb60f@stephen-xps.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/12/25 3:48 PM, Stephen Hemminger wrote:
> On Wed, 10 Dec 2025 14:30:37 +0100
> Thorsten Leemhuis <linux@leemhuis.info> wrote:
> 
>> he update, much appreciated!
>>
>> On 12/10/25 05:48, Konstantin Ryabitsev wrote:
>>
>>> ### Bugzilla
>>>
>>> It may be time to kill bugzilla:  
>>
>> Thx for bringing this up, as I a few months ago again looked somewhat
>> closer at the state of how well our bugzilla is working for the core
>> kernel. I didn't post the analysis in the end, but to me it looked like
>> the state of things was round the same as it was three years ago -- when
>> it wasn't working well, which was among the reasons why we came close to
>> abandoning bugzilla for kernel bugs[1].
>>
>> [1] for those that don't remember, see https://lwn.net/Articles/910740/
>> and
>> https://lore.kernel.org/all/aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info/
>>
>>
>>
>>>     - despite periodic "we're not dead yet" emails, it doesn't appear very
>>>       active
>>>     - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
>>>       5.2 development branch and continuing with 5.1
>>>     - question remains with what to replace bugzilla,  
>>
>> To me it looks like most subsystems don't care much or at all about
>> bugzilla.kernel.org. This made me wonder (and maybe you could gather
>> some opinions on this in Tokyo):
>>
>> * How many kernel subsystems have a strong interest in a bug tracking
>> solution at all[2]? And how many of those might be happy by using some
>> external issue tracker, like those in github (like Rust for Linux,
>> thesofproject, and a few others do), gitlab (either directly, like
>> apparmor, or self-hosted, like the DRM subsystem)?
>>
>> * Does the kernel as a whole need a bug tracking solution at all to
>> receive reports? We for now require email for patches, so why not for
>> bugs as well, unless a subsystem really wants something (see above)?
> 
> I am the default target for all networking bugzilla submissions.
> Would be very happy to just see bugzilla die.
> Right now, all I do is do a quick scan and respond to the junk submissions
> and forward the rest to the netdev mailing list with a note on the bug
> to go there in the future.
> 
> Issue tracking is not in the workflow for the community.

which can be observed by the number of Categories/Components that don't
have an assignee -- even a mailing list.  Which should be "fixed" IMO.
I.e., we are actively helping bugzilla entries to be ignored.

I don't think it's the tool itself. More likely something else...

-- 
~Randy

