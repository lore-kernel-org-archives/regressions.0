Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF332F3F
	for <regressions@lists.linux.dev>; Wed, 22 Feb 2023 15:45:33 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pUrJ7-0002gC-62; Wed, 22 Feb 2023 16:45:25 +0100
Message-ID: <e4f69695-e444-4283-06a5-7a50d01038e0@leemhuis.info>
Date: Wed, 22 Feb 2023 16:45:24 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Latest RC causing web browser crash
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Chris McGimpsey-Jones <chrisjones.unixmen@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CAPaMSD3MM2BTW0REi4onUCPCLzz1B=-x0j9Uuvf2NHUOSefQ-w@mail.gmail.com>
 <ee9518a8-64ce-142d-ecfd-f560978352b0@leemhuis.info>
 <e503afb9-df36-5b98-6b1b-e1ad3a9d13a7@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <e503afb9-df36-5b98-6b1b-e1ad3a9d13a7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1677080733;49b8c79f;
X-HE-SMSGID: 1pUrJ7-0002gC-62

On 16.02.23 12:10, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 30.01.23 11:11, Linux kernel regression tracking (Thorsten Leemhuis)
> wrote:
>> On 28.01.23 02:14, Chris McGimpsey-Jones wrote:
>>> Is anyone else with the latest RC having issues with Google Chrome
>>> browser, causing it to crash after a couple of minutes?
>> FWIW, this is unlikely to get any traction: nearly nobody reads the LKML
>> anymore, hence it's unlikely that someone that can help will see it.
> 
> FWIW, I pointed to this problem in my weekly reports, but there was no
> reaction. That sound like this is something rare which might only happen
> on your machine.
> 
> Is the problem actually still occuring?

Hmm, not reply. In that case I'm going to remove it from the tracking:

#regzbot inconclusive: reporter MIA and likely individual (local?) issue
anyway
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
