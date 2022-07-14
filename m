Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B64517EC
	for <regressions@lists.linux.dev>; Thu, 14 Jul 2022 07:17:47 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oBt6Q-0005b8-Ut; Thu, 14 Jul 2022 09:17:39 +0200
Message-ID: <0b89a7ca-ac6b-5c28-2929-cb5a64d4ddfd@leemhuis.info>
Date: Thu, 14 Jul 2022 09:17:38 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Regression] Resume process hangs for 5-6 seconds starting
 sometime in 5.16 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <81b865bb-be46-cdf7-a49b-fd029de439fb@leemhuis.info>
In-Reply-To: <81b865bb-be46-cdf7-a49b-fd029de439fb@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1657783067;8edcac91;
X-HE-SMSGID: 1oBt6Q-0005b8-Ut

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 29.04.22 14:24, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> Bart, I noticed a regression report in bugzilla.kernel.org that afaics
> nobody acted upon since it was reported about a week ago, that's why I
> decided to forward it to the lists and all people that seemed to be
> relevant here. It's caused by a commit of yours. To quote from
> https://bugzilla.kernel.org/show_bug.cgi?id=215880 :

#regzbot fixed-by: 88f1669019bd62b30
