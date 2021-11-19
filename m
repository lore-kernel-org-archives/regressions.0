Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5072C80
	for <regressions@lists.linux.dev>; Fri, 19 Nov 2021 11:38:19 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mo2Dh-0004g4-Jz; Fri, 19 Nov 2021 12:38:17 +0100
Message-ID: <3777c646-26ca-1c1b-350c-ddcc7c484483@leemhuis.info>
Date: Fri, 19 Nov 2021 12:38:16 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-BW
To: Niklas Schnelle <schnelle@linux.ibm.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <a627b3cbd2ed4ba5dd75e1163760730187f1416b.camel@linux.ibm.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Regression in v5.16-rc1: Timeout in mlx5_health_wait_pci_up() may
 try to wait 245 million years
In-Reply-To: <a627b3cbd2ed4ba5dd75e1163760730187f1416b.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637321899;23dae24c;
X-HE-SMSGID: 1mo2Dh-0004g4-Jz




On 19.11.21 11:47, Niklas Schnelle wrote:
> Hello Amir, Moshe, and Saeed,
> 
> During testing of PCI device recovery, I found a problem in the mlx5
> recovery support introduced in v5.16-rc1 by commit 32def4120e48
> ("net/mlx5: Read timeout values from DTOR"). It follows my analysis of
> the problem.
>
> [...]
>
> Thanks,
> Niklas Schnelle
> 
> #regzbot introduced: 32def4120e48

Many thx for getting regzbot directly involved. Due to the repost it now
has two entries for this regressions, thus I'm marking this one as a
duplicate of the repost:

#regzbot dup-of:
https://lore.kernel.org/regressions/a627b3cbd2ed4ba5dd75e1163760730187f1416b.camel@linux.ibm.com/
