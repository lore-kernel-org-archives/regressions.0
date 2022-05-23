Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E36637
	for <regressions@lists.linux.dev>; Mon, 23 May 2022 13:10:00 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nt7os-0004UB-Np; Mon, 23 May 2022 15:09:58 +0200
Message-ID: <04bac239-afd9-5b73-ed46-258f61f9329e@leemhuis.info>
Date: Mon, 23 May 2022 15:09:58 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [regression] dpaa2: TSO offload on lx2160a causes fatal exception
 in interrupt #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <7ca81e6b-85fd-beff-1c2b-62c86c9352e9@leemhuis.info>
In-Reply-To: <7ca81e6b-85fd-beff-1c2b-62c86c9352e9@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1653311401;ea2ea19a;
X-HE-SMSGID: 1nt7os-0004UB-Np

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 04.05.22 09:46, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> Ioana, I noticed a regression report in bugzilla.kernel.org that afaics
> nobody acted upon since it was reported about a week ago. The reporter
> *suspects* it's caused by a recent change of yours. That's why I decided
> to forward it to the lists and all people that seemed to be relevant
> here. To quote from https://bugzilla.kernel.org/show_bug.cgi?id=215886 :

#regzbot fixed-by: 06d129946a71f3159
