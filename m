Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD7633DC
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 11:10:30 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pSc9k-0002AL-T1; Thu, 16 Feb 2023 12:10:28 +0100
Message-ID: <e503afb9-df36-5b98-6b1b-e1ad3a9d13a7@leemhuis.info>
Date: Thu, 16 Feb 2023 12:10:28 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Latest RC causing web browser crash
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Chris McGimpsey-Jones <chrisjones.unixmen@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CAPaMSD3MM2BTW0REi4onUCPCLzz1B=-x0j9Uuvf2NHUOSefQ-w@mail.gmail.com>
 <ee9518a8-64ce-142d-ecfd-f560978352b0@leemhuis.info>
In-Reply-To: <ee9518a8-64ce-142d-ecfd-f560978352b0@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676545831;f33706c8;
X-HE-SMSGID: 1pSc9k-0002AL-T1

On 30.01.23 11:11, Linux kernel regression tracking (Thorsten Leemhuis)
wrote:
> On 28.01.23 02:14, Chris McGimpsey-Jones wrote:
>> Is anyone else with the latest RC having issues with Google Chrome
>> browser, causing it to crash after a couple of minutes?
> FWIW, this is unlikely to get any traction: nearly nobody reads the LKML
> anymore, hence it's unlikely that someone that can help will see it.

FWIW, I pointed to this problem in my weekly reports, but there was no
reaction. That sound like this is something rare which might only happen
on your machine.

Is the problem actually still occuring?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

>> I reverted (temporarily) back to Linux 6.1.0 and it's fine.
>> Tested a couple of times, the issue can be reproduced.
> 
> Are there any crash dumps that might indicate what might cause the problem?
> 
>> I don't know of the relationship between the kernel and web browser
>> and it seems odd the kernel would cause this problem, but there's no
>> disputing it is the cause as I can reproduce the issue.
> 
> Well, things like this don't happen frequently, but they do happen.
> Without more data it's just very hard to get to the root of this issue,
> as it could be caused by all sorts of things (mm and drm are two most
> likely suspects, but it could be something totally different).
> 
> Could you try to bisect the issue? There are various pages on the net
> that explain how to do that.
