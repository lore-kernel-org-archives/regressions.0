Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DE15CA6
	for <regressions@lists.linux.dev>; Wed,  7 Sep 2022 15:50:18 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oVxJb-0002qv-3b; Wed, 07 Sep 2022 17:50:11 +0200
Message-ID: <8ec8f04c-d93b-c482-6d96-98607e5bad4e@leemhuis.info>
Date: Wed, 7 Sep 2022 17:50:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [Bisected] Disconnecting pendrive with opened files causes
 trouble on 6.0.0-rc3 #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-scsi@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <fbd28a8c-858d-8891-f6be-a5c2ca3131da@o2.pl>
 <59c57de8-580e-a761-e69c-7b1bdbfb8dd4@leemhuis.info>
In-Reply-To: <59c57de8-580e-a761-e69c-7b1bdbfb8dd4@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1662565818;fcb48828;
X-HE-SMSGID: 1oVxJb-0002qv-3b

On 05.09.22 12:27, Thorsten Leemhuis wrote:
>
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]

#regzbot fixed-by: f782201ebc2b5f6

For details see Bart's reply to the reporter.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
