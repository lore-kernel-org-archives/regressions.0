Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9F82F28
	for <regressions@lists.linux.dev>; Thu, 25 Aug 2022 11:42:22 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oRBFc-0007Tp-H9; Thu, 25 Aug 2022 13:42:20 +0200
Message-ID: <161d2c47-6003-0fd2-9826-ca36d75d6f96@leemhuis.info>
Date: Thu, 25 Aug 2022 13:42:20 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [regression] Bug 216388 - On Host, kernel errors in KVM, on
 guests, it shows CPU stalls #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <c27ace0f-7d04-e88b-6e2f-7e4a7ec3c36c@leemhuis.info>
In-Reply-To: <c27ace0f-7d04-e88b-6e2f-7e4a7ec3c36c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1661427742;76ab737e;
X-HE-SMSGID: 1oRBFc-0007Tp-H9

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 25.08.22 13:27, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I noticed a regression reported in bugzilla.kernel.org that seems to be
> handled there already, nevertheless I'd like to add to the tracking to
> ensure it's doesn't fall through the cracks in the end:
> 
> #regzbot introduced: https://bugzilla.kernel.org/show_bug.cgi?id=216388
> #regzbot ignore-activity

Argh, stupid me, apparently I forgot the appropriate syntax of the bot I
wrote myself :-/

#regzbot introduced: v5.18..v5.19 ^
https://bugzilla.kernel.org/show_bug.cgi?id=216386
#regzbot From: Robert Dinse <nanook@eskimo.com>
#regzbot ignore-activity

Sorry for the noise
