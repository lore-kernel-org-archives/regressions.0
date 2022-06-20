Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B547E0
	for <regressions@lists.linux.dev>; Mon, 20 Jun 2022 06:45:21 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o3B9z-0000M8-NX; Mon, 20 Jun 2022 08:45:19 +0200
Message-ID: <03314de0-3b04-0726-20a4-c74a02cbb33f@leemhuis.info>
Date: Mon, 20 Jun 2022 08:45:19 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [REGRESSION] VGA output with AST 2600 graphics. #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev
References: <d84ba981-d907-f942-6b05-67c836580542@redhat.com>
 <6077d233-b0ea-f716-bf23-3fd6c16364af@leemhuis.info>
In-Reply-To: <6077d233-b0ea-f716-bf23-3fd6c16364af@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1655707521;2ca8bb79;
X-HE-SMSGID: 1o3B9z-0000M8-NX

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 07.06.22 12:57, Thorsten Leemhuis wrote:
> On 01.06.22 11:33, Jocelyn Falempe wrote:
>>
>> I've found a regression in the ast driver, for AST2600 hardware.
>>
>> before the upstream commit f9bd00e0ea9d
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f9bd00e0ea9d9b04140aa969a9a13ad3597a1e4e
>>
>> The ast driver handled AST 2600 chip like an AST 2500.
>>
>> After this commit, it uses some default values, more like the older AST
>> chip.
> 
#regzbot fixed-by: bcc77411e8a6

https://lore.kernel.org/all/f29a8c60-7f4e-eb93-feb1-863f82ec8f4f@suse.de/
https://lore.kernel.org/all/20220609072242.11721-1-tzimmermann@suse.de/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.


