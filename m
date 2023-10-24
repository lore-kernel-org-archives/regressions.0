Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A9273C7
	for <regressions@lists.linux.dev>; Tue, 24 Oct 2023 12:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qvGaR-0007R8-2s; Tue, 24 Oct 2023 14:32:43 +0200
Message-ID: <c36ebd70-0b2c-487f-a7ef-d13256f68c5c@leemhuis.info>
Date: Tue, 24 Oct 2023 14:32:42 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: kernel tried to execute NX-protected page - exploit attempt?
 (uid: 0) (qbittorrent with tx-nocache-copy)
Content-Language: en-US, de-DE
To: Eric Dumazet <edumazet@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 "David S. Miller" <davem@davemloft.net>, Benjamin Poirier
 <bpoirier@suse.de>, Tom Herbert <therbert@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, CM76 <cmaff76@gmail.com>
References: <2bf06faa-a0a7-4dee-90cd-a054b4e4c947@gmail.com>
 <17a017b9-9807-48ef-bc7b-be8f5df750c5@gmail.com>
 <CANn89iJxCqGeEM2sJbs8TU00Rj-iddoyoabvB7x4eEaPwCKTMA@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CANn89iJxCqGeEM2sJbs8TU00Rj-iddoyoabvB7x4eEaPwCKTMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698150772;f98d06ea;
X-HE-SMSGID: 1qvGaR-0007R8-2s

On 24.10.23 11:25, Eric Dumazet wrote:
> On Tue, Oct 24, 2023 at 10:53 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>
>> On 24/10/2023 15:15, Bagas Sanjaya wrote:
>>>
>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>>> I believe this is also an issue with the Broadcom bnx2 drivers since it only seem to happen when I enable "tx-nocache-copy" in ethtool.
>>[...]
>> Thanks.
>
> This has been fixed already two weeks ago.
> 
> commit 71c299c711d1f44f0bf04f1fea66baad565240f1

Eric, thx for letting us know!

#regzbot fix: 71c299c711d1f44f0

Bagas, maybe in a case like this wait with forwarding the report until
the reporter confirmed that the bug happens with a really fresh kernel.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.


