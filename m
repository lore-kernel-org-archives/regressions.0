Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720B113AD6
	for <regressions@lists.linux.dev>; Tue, 31 Oct 2023 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qxktf-0002kf-K2; Tue, 31 Oct 2023 10:18:51 +0100
Message-ID: <5ecf0eac-a089-4da9-b76e-b45272c98393@leemhuis.info>
Date: Tue, 31 Oct 2023 10:18:50 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION]: nouveau: Asynchronous wait on fence
Content-Language: en-US, de-DE
To: "Owen T. Heisler" <writer@owenh.net>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Sasha Levin <sashal@kernel.org>
References: <6f027566-c841-4415-bc85-ce11a5832b14@owenh.net>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <6f027566-c841-4415-bc85-ce11a5832b14@owenh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698743935;109fa59d;
X-HE-SMSGID: 1qxktf-0002kf-K2

On 28.10.23 04:46, Owen T. Heisler wrote:
> #regzbot introduced: d386a4b54607cf6f76e23815c2c9a3abc1d66882
> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/180
> 
> ## Problem
> 
> 1. Connect external display to DVI port on dock and run X with both
>    displays in use.
> 2. Wait hours or days.
> 3. Suddenly the secondary Nvidia-connected display turns off and X stops
>    responding to keyboard/mouse input. In *some* cases it is possible to
>    switch to a virtual TTY with Ctrl+Alt+Fn and log in there. In any
>    case, shutdown/reboot after this happens is *usually* not successful
>    (forced power-off is required).
> 
> This started happening after the upgrade to Debian bullseye, and the
> problem remains with Debian bookworm.
> [...] 

Thanks for your report. With a bit of luck someone will look into this,
But I doubt it, as this report has some aspects why it might be ignored.
Mainly: (a) the report was about a stable/longterm kernel and (b)it's
afaics unclear if the problem even happens with the latest mainline
kernel. For details about these aspects, see:
https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-kernel-bug-reports-are-ignored/

You thus might want to check if the problem occurs with 6.6 -- and
ideally also check if reverting the culprit there fixes things for you.

That might help getting things rolling, but it's a pretty old
regression, which complicates things.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

