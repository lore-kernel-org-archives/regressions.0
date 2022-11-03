Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D936A2F21
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 11:08:50 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oqY5Y-0006kG-JP; Thu, 03 Nov 2022 12:08:48 +0100
Message-ID: <9114cdb0-9d2a-d863-9157-40f182b110a8@leemhuis.info>
Date: Thu, 3 Nov 2022 12:08:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-mm@kvack.org
References: <20220915094200.139713-1-hch@lst.de>
 <20220915094200.139713-4-hch@lst.de>
 <d20a0a85-e415-cf78-27f9-77dd7a94bc8d@leemhuis.info>
Subject: Re: [REGESSION] systemd-oomd overreacting due to PSI changes for
 Btrfs #forregzbot
In-Reply-To: <d20a0a85-e415-cf78-27f9-77dd7a94bc8d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667473730;8d63a31e;
X-HE-SMSGID: 1oqY5Y-0006kG-JP

On 03.11.22 11:46, Thorsten Leemhuis wrote:
> On 15.09.22 11:41, Christoph Hellwig wrote:
>> btrfs compressed reads try to always read the entire compressed chunk,
>> even if only a subset is requested.  Currently this is covered by the
>> magic PSI accounting underneath submit_bio, but that is about to go
>> away. Instead add manual psi_memstall_{enter,leave} annotations.
>>
>> Note that for readahead this really should be using readahead_expand,
>> but the additionals reads are also done for plain ->read_folio where
>> readahead_expand can't work, so this overall logic is left as-is for
>> now.
> 
> It seems this patch makes systemd-oomd overreact on my day-to-day
> machine and aggressively kill applications. I'm not the only one that
> noticed such a behavior with 6.1 pre-releases:
> https://bugzilla.redhat.com/show_bug.cgi?id=2133829
> https://bugzilla.redhat.com/show_bug.cgi?id=2134971

Great, the kernel's regression tracker reports a regression and forgets
to tell his regression tracking bot about it to ensure it's tracked... :-D

#regzbot ^introduced 4088a47e78f9
#regzbot title mm/btrfs: systemd-oomd overreacting due to PSI changes
for Btrfs
#regzbot ignore-activity

Ciao, Thorsten
