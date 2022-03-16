Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7933B23
	for <regressions@lists.linux.dev>; Wed, 16 Mar 2022 17:40:23 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nUXdC-0007y5-Fh; Wed, 16 Mar 2022 18:40:18 +0100
Message-ID: <0238dcae-ee6f-2140-1895-4153c441d333@leemhuis.info>
Date: Wed, 16 Mar 2022 18:40:17 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>, Manish Chopra <manishc@marvell.com>
Cc: buczek@molgen.mpg.de, kuba@kernel.org, netdev@vger.kernel.org,
 aelior@marvell.com, it+netdev@molgen.mpg.de, regressions@lists.linux.dev
References: <20220316111842.28628-1-manishc@marvell.com>
 <5f136c0c-2e16-d176-3d4a-caed6c3420a7@molgen.mpg.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [RFC net] bnx2x: fix built-in kernel driver load failure
In-Reply-To: <5f136c0c-2e16-d176-3d4a-caed6c3420a7@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1647452424;465590bc;
X-HE-SMSGID: 1nUXdC-0007y5-Fh

On 16.03.22 18:09, Paul Menzel wrote:
> Am 16.03.22 um 12:18 schrieb Manish Chopra:
>> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> Fixes: b7a49f73059f ("bnx2x: Utilize firmware 7.13.21.0")
> 
> The regzbot also asks to add the tag below [1].
> 
> Link:
> https://lore.kernel.org/r/46f2d9d9-ae7f-b332-ddeb-b59802be2bab@molgen.mpg.de

For the record: yes, regzbot needs them, but it something old. IOW:
developers should be setting them for years now and quite a few do so,
but some do not. The docs recently got changed to make this aspect
clearer. See 'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst' for details:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html
https://www.kernel.org/doc/html/latest/process/5.Posting.html

Ciao, Thorsten
