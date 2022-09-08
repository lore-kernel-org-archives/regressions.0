Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8347C
	for <regressions@lists.linux.dev>; Thu,  8 Sep 2022 13:36:27 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oWHhh-0005pw-9B; Thu, 08 Sep 2022 15:36:25 +0200
Message-ID: <e272ce34-0388-e776-6705-0d2bea8d4e60@leemhuis.info>
Date: Thu, 8 Sep 2022 15:36:24 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [regression] Bug 216388 - On Host, kernel errors in KVM, on
 guests, it shows CPU stalls #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <c27ace0f-7d04-e88b-6e2f-7e4a7ec3c36c@leemhuis.info>
 <161d2c47-6003-0fd2-9826-ca36d75d6f96@leemhuis.info>
In-Reply-To: <161d2c47-6003-0fd2-9826-ca36d75d6f96@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1662644187;2123791c;
X-HE-SMSGID: 1oWHhh-0005pw-9B

On 25.08.22 13:42, Thorsten Leemhuis wrote:
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> On 25.08.22 13:27, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> I noticed a regression reported in bugzilla.kernel.org that seems to be
>> handled there already, nevertheless I'd like to add to the tracking to
>> ensure it's doesn't fall through the cracks in the end:
>>
>> #regzbot introduced: https://bugzilla.kernel.org/show_bug.cgi?id=216388
>> #regzbot ignore-activity
> 
> Argh, stupid me, apparently I forgot the appropriate syntax of the bot I
> wrote myself :-/
> 
> #regzbot introduced: v5.18..v5.19 ^
> https://bugzilla.kernel.org/show_bug.cgi?id=216386
> #regzbot From: Robert Dinse <nanook@eskimo.com>
> #regzbot ignore-activity

#regzbot invalid: fixed as of v6.0-rc4, fix itself sadly unknown (see
bugzilla)

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
