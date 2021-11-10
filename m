Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE3C72
	for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 19:02:18 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mksrP-0003Dy-12; Wed, 10 Nov 2021 20:02:16 +0100
Message-ID: <e0f4c645-3e37-ace2-196a-6230ecf81c87@leemhuis.info>
Date: Wed, 10 Nov 2021 20:02:13 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: 5.15 Linux Regression in sound hda
Content-Language: en-BW
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 scott.branden@broadcom.com
References: <063e2397-7edb-5f48-7b0d-618b938d9dd8@broadcom.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <063e2397-7edb-5f48-7b0d-618b938d9dd8@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1636570938;7fd1cf04;
X-HE-SMSGID: 1mksrP-0003Dy-12

On 09.11.21 22:12, Scott Branden wrote:
> I'm reporting a new WARN_ON in sound/hda/hdac_bus.c that was not present
> in 5.15.  Sorry, I don't have time to bisect this right now but report
> is below.

Scott, thx for CCing me. A fix seem to be on the horizon already, but to
be sure this issue doesn't fall through the cracks unnoticed I'm adding
it to regzbot, the Linux kernel regression tracking bot:

#regzbot ^introduced v5.15..
#regzbot ignore-activity

I removed everyone else from the To or CC, as this mail is meaningless
for the others.

Ciao, Thorsten, your Linux kernel regression tracker.
