Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A34F5668
	for <regressions@lists.linux.dev>; Sun, 19 Nov 2023 06:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r4ayP-0008P5-IK; Sun, 19 Nov 2023 07:08:01 +0100
Message-ID: <cf3f1056-a0fa-4799-9827-08df8aae1184@leemhuis.info>
Date: Sun, 19 Nov 2023 07:08:00 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Don't clobber fr0/vs0 during fp|altivec register
 save
Content-Language: en-US, de-DE
To: Timothy Pearson <tpearson@raptorengineering.com>,
 Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>,
 christophe leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700374085;0a29001f;
X-HE-SMSGID: 1r4ayP-0008P5-IK

On 19.11.23 00:45, Timothy Pearson wrote:
> During floating point and vector save to thread data fr0/vs0 are clobbered
> by the FPSCR/VSCR store routine.  This leads to userspace register corruption
> and application data corruption / crash under the following rare condition:
> [...]
> Tested-by: Timothy Pearson <tpearson@raptorengineering.com>

Many thx for this, good to see you finally found the problem.

FWIW, you might want to add a

 Closes:
https://lore.kernel.org/all/480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com/

here. Yes, I care about those tags because of regression tracking. But
it only relies on Link:/Closes: tags because they were meant to be used
in the first place to link to backstories and details of a change[1].

And you and Jens did such good debugging in that thread, which is why
it's IMHO really worth linking here in case anyone ever needs to look
into the backstory later.

> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> [..]

Thx again for all your work you put into this.

Ciao, Thorsten

[1] see Documentation/process/submitting-patches.rst
(http://docs.kernel.org/process/submitting-patches.html) and
Documentation/process/5.Posting.rst
(https://docs.kernel.org/process/5.Posting.html)

See also these mails from Linus:
https://lore.kernel.org/all/CAHk-=wjMmSZzMJ3Xnskdg4+GGz=5p5p+GSYyFBTh0f-DgvdBWg@mail.gmail.com/
https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/
https://lore.kernel.org/all/CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com/
