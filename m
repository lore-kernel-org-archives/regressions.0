Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0587C
	for <regressions@lists.linux.dev>; Thu,  8 Sep 2022 11:39:48 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oWFso-00010g-DJ; Thu, 08 Sep 2022 13:39:46 +0200
Message-ID: <91889499-6b15-100d-157a-8d536ad8a18d@leemhuis.info>
Date: Thu, 8 Sep 2022 13:39:46 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0%
 regression #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220420013526.GB14333@xsang-OptiPlex-9020>
 <04c2cb21-a377-d996-8297-16cd7c744063@leemhuis.info>
 <b7593c4a-b232-77d2-6c26-31aacdacbefe@leemhuis.info>
In-Reply-To: <b7593c4a-b232-77d2-6c26-31aacdacbefe@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1662637188;104f6e00;
X-HE-SMSGID: 1oWFso-00010g-DJ



On 13.05.22 10:37, Thorsten Leemhuis wrote:
> On 11.05.22 14:13, Thorsten Leemhuis wrote:
>> TWIMC: this mail is primarily send for documentation purposes and for
>> regzbot, my Linux kernel regression tracking bot. These mails usually
>> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> Picked the wrong commit-id, fixing:
> 
> #regzbot introduced: f26b3fa046116a7

#regzbot invalid: removing: thread faded out, mixed two regressions, and
some tests showed it might be something that doesn't show up in
real-world tests

https://lore.kernel.org/lkml/20220614020930.GA31620@shbuild999.sh.intel.com/

Not totally sure from reading that last messages in the thread if it's
right thing to ignore this, but warming it up now is not worth it afaics.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
