Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713D93FC7
	for <regressions@lists.linux.dev>; Sat, 25 Sep 2021 17:40:40 +0000 (UTC)
Received: from ip4d14bdef.dynamic.kabel-deutschland.de ([77.20.189.239] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mUBf6-00015f-7n; Sat, 25 Sep 2021 19:40:32 +0200
Message-ID: <6d62738a-b213-dc9c-c13f-7d4eaa7e46b8@leemhuis.info>
Date: Sat, 25 Sep 2021 19:40:31 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-BS
References: <871r5p0x2u.fsf@codeaurora.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
To: regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
In-Reply-To: <871r5p0x2u.fsf@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1632591640;ffd7a42c;
X-HE-SMSGID: 1mUBf6-00015f-7n

On 16.09.21 10:00, Kalle Valo wrote:
> 
> I hate to be the bearer of bad news again :)
> 
> I noticed already a while ago that commit 020d3b26c07a ("bus: mhi: Early
> MHI resume failure in non M3 state"), introduced in v5.13-rc1, broke
> ath11k resume on my NUC x86 testbox using QCA6390. Interestingly enough
> Dell XPS 13 9310 laptop (with QCA6390 as well) does not have this
> problem, I only see the problem on the NUC. I do not know what's causing
> this difference.
> 
> At the moment I'm running my tests with commit 020d3b26c07a reverted and
> everything works without problems. Is there a simple way to fix this? Or
> maybe we should just revert the commit? Commit log and kernel logs from
> a failing case below.
> 
> Kalle
> 
> commit 020d3b26c07abe274ac17f64999bbd3bf3342195

Feel free to ignore this message. I write it to make regzbot track this
issue. Regzbot is the regression tracking bot I'm working on. It's still
in the early stages and this is still one of the first few regression I
make it track to get started and things tested in the field. That also
why I'm sending the mail just to the regressions list (it will do it's
magic nevertheless). For details see:
https://linux-regtracking.leemhuis.info/post/inital-regzbot-running/
https://linux-regtracking.leemhuis.info/post/regzbot-approach/

#regzbot ^introduced 020d3b26c07abe274ac17f64999bbd3bf3342195

Ciao, Thorsten
