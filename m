Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F1EEC5
	for <regressions@lists.linux.dev>; Sun, 10 Apr 2022 07:27:41 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ndRyy-0003TV-1x; Sun, 10 Apr 2022 09:27:36 +0200
Message-ID: <3ab10248-be14-d161-14e6-bf19ac8cd998@leemhuis.info>
Date: Sun, 10 Apr 2022 09:27:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [regression] 5.15 kernel triggering 100x more inode evictions
Content-Language: en-US
To: Bruno Damasceno Freire <bdamasceno@hotmail.com.br>,
 Filipe Manana <fdmanana@kernel.org>, "dsterba@suse.cz" <dsterba@suse.cz>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 "fdmanana@suse.com" <fdmanana@suse.com>
References: <MN2PR20MB2512314446801B92562E26B5D2169@MN2PR20MB2512.namprd20.prod.outlook.com>
 <07bb78be-1d58-7d88-288b-6516790f3b5d@leemhuis.info>
 <MN2PR20MB251203B4B5445B4B0C4148C9D21D9@MN2PR20MB2512.namprd20.prod.outlook.com>
 <35b62998-e386-2032-5a7a-07e3413b3bc1@leemhuis.info>
 <MN2PR20MB251205164078C367C3FC4166D2E59@MN2PR20MB2512.namprd20.prod.outlook.com>
 <9163b8a9-e852-5786-24fa-d324e3118890@leemhuis.info>
 <20220408145222.GR15609@twin.jikos.cz> <YlBa/Rc0lvJCm5Rr@debian9.Home>
 <74e4cc73-f16d-3e79-9927-1de3beea4a11@leemhuis.info>
 <MN2PR20MB2512CEFB95106D91FD9F1717D2E89@MN2PR20MB2512.namprd20.prod.outlook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <MN2PR20MB2512CEFB95106D91FD9F1717D2E89@MN2PR20MB2512.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1649575661;e0306e02;
X-HE-SMSGID: 1ndRyy-0003TV-1x

On 09.04.22 19:12, Bruno Damasceno Freire wrote:
> On 08.04.22 04:50, Thorsten Leemhuis wrote:
>> First off: David, Filipe, many thx for your answers, that helped me a
>> lot to get a better picture of the situation!
>> On 08.04.22 17:55, Filipe Manana wrote:
>>> On Fri, Apr 08, 2022 at 04:52:22PM +0200, David Sterba wrote:
>>>> On Fri, Apr 08, 2022 at 12:32:20PM +0200, Thorsten Leemhuis wrote:
>
>>> [...]
>>
>>> 6) In short, it is not known what causes the excessive evictions on 5.15
>>>    on his machine for that specific workload - we don't have a commit to
>>>    point at and say it caused a regression. [...]
>>
>> Bruno, under these circumstances I'd say you need to bisect this to get
>> us closer to the root of the problem (and a fix for it). Sadly that how
>> it is sometimes, as briefly explained here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/admin-guide/reporting-regressions.rst#n140
> 
> Ok Thorsten.
> 
> It's not sad at all: I had a great time researching this regression and
> gained a lot of knowledge while doing so. The problem is that I am just a
> simple user at its limits here and additional bisection is probably beyond my
> abilities.

Maybe, but I think you underestimate yourself here. Give it a try, it's
not that hard once you figured out how to build and install a vanilla
kernel (which you did already afaics; and if not: it's not that hard and
you learn new stuff, too) and have some test case to check if the
problem is there or now (which you already have afaics).

Ciao, Thorsten
