Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67E22C80
	for <regressions@lists.linux.dev>; Fri, 19 Nov 2021 12:17:43 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mo2pq-0002al-6d; Fri, 19 Nov 2021 13:17:42 +0100
Message-ID: <e42c1c04-c503-2833-fa73-1636776512fd@leemhuis.info>
Date: Fri, 19 Nov 2021 13:17:39 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Regression in v5.16-rc1: Timeout in mlx5_health_wait_pci_up() may
 try to wait 245 million years
Content-Language: en-BW
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <a627b3cbd2ed4ba5dd75e1163760730187f1416b.camel@linux.ibm.com>
 <3777c646-26ca-1c1b-350c-ddcc7c484483@leemhuis.info>
In-Reply-To: <3777c646-26ca-1c1b-350c-ddcc7c484483@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637324264;62592772;
X-HE-SMSGID: 1mo2pq-0002al-6d

On 19.11.21 12:38, Thorsten Leemhuis wrote:
> 
> 
> 
> On 19.11.21 11:47, Niklas Schnelle wrote:
>> Hello Amir, Moshe, and Saeed,
>>
>> During testing of PCI device recovery, I found a problem in the mlx5
>> recovery support introduced in v5.16-rc1 by commit 32def4120e48
>> ("net/mlx5: Read timeout values from DTOR"). It follows my analysis of
>> the problem.
>>
>> [...]
>>
>> Thanks,
>> Niklas Schnelle
>>
>> #regzbot introduced: 32def4120e48
> 
> Many thx for getting regzbot directly involved. Due to the repost it now
> has two entries for this regressions, thus I'm marking this one as a
> duplicate of the repost:
> 
> #regzbot dup-of:
> https://lore.kernel.org/regressions/a627b3cbd2ed4ba5dd75e1163760730187f1416b.camel@linux.ibm.com/

Brown paperbag mail:

Ugh, that command told regzbot to mark the regression as a duplicate of
itself, which obviously is stupid. Trying it again:

#regzbot dup-of:
https://lore.kernel.org/regressions/15db9c1d11d32fb16269afceb527b5d743177ac4.camel@linux.ibm.com
