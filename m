Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB3C20322;
	Wed, 10 Dec 2025 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765373447; cv=none; b=ZLYPDJsc3n2CdHp4rUatSCfZTvGrVlPANzY5G1ezWcgfPXfAHdwwNK5bQ9pKBbpYyM1BgnMDvFvxJzpS65EqtUs4NlM7LB9FOpu/HBeUtA9kT9tUyTMFwmkuqSzrL0KWzDgzsifHbN/tTpQOj3zqr4XGaKQQ375/Ky5OE8g75eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765373447; c=relaxed/simple;
	bh=05yYjy5mrMUyG8FBlX0G1vLs+XKvBoh3o+6q6lApECc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZQpXJyqcSayFAGBnf18CcJjZSyVScxw1i/iplUn/RCw4yCvCss0qQMCy4uj60LtGYFdN45N/8Qkzmoy/4EXxEtuj/xTXZyLz7Xex2OZ6zbnY9MsYziB6SdkSllr+A/Mw5ii9YlR9b4snCiUSY96cTn3s+KAcobQe4/behj3VFvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=MrPQ50em; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="MrPQ50em"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=NxJCdZazrfoG/nCZRMUrPGp6MVF0tbYbSd+fLg7kSXk=; t=1765373445;
	x=1765805445; b=MrPQ50emvdpDWAvJUYL1ntmqU7/LKTwkklGT+xwDGLDugZeMxYz+8/kN9fJk2
	1wOPFj6ZsMwhXtKngvbw+xlzvuZu8c/HMVnEe10MVXMWa9bvb/07Ic+D9nfMuZHql/V5Qfi6cfbfA
	NpGAL5995jpBNk49d2yNCrQmyumYHLRCJiGaSBnP03HrFMx0fgFYvP1S8g3+stX9axa8NBdw6d169
	4vD8q3aKjWDPpDtxWYKF01gvmsk1SwKPLhBQOYbg5p5Qw1PbHirgJQ1tdiwOQyUbdXpX3lN4taItH
	zjgLkI8EcoeZeQLGLqos2YEVI90xMsjBnOggeQ0tVVkQiJkjjQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vTKH8-00BEjC-1I;
	Wed, 10 Dec 2025 14:30:38 +0100
Message-ID: <f1bb8d04-9949-417d-9726-64787994d40e@leemhuis.info>
Date: Wed, 10 Dec 2025 14:30:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel.org tooling update
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20251209-roaring-hidden-alligator-068eea@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1765373445;76b848db;
X-HE-SMSGID: 1vTKH8-00BEjC-1I

Lo! Thx for the update, much appreciated!

On 12/10/25 05:48, Konstantin Ryabitsev wrote:

> ### Bugzilla
> 
> It may be time to kill bugzilla:

Thx for bringing this up, as I a few months ago again looked somewhat
closer at the state of how well our bugzilla is working for the core
kernel. I didn't post the analysis in the end, but to me it looked like
the state of things was round the same as it was three years ago -- when
it wasn't working well, which was among the reasons why we came close to
abandoning bugzilla for kernel bugs[1].

[1] for those that don't remember, see https://lwn.net/Articles/910740/
and
https://lore.kernel.org/all/aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info/



>     - despite periodic "we're not dead yet" emails, it doesn't appear very
>       active
>     - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
>       5.2 development branch and continuing with 5.1
>     - question remains with what to replace bugzilla,

To me it looks like most subsystems don't care much or at all about
bugzilla.kernel.org. This made me wonder (and maybe you could gather
some opinions on this in Tokyo):

* How many kernel subsystems have a strong interest in a bug tracking
solution at all[2]? And how many of those might be happy by using some
external issue tracker, like those in github (like Rust for Linux,
thesofproject, and a few others do), gitlab (either directly, like
apparmor, or self-hosted, like the DRM subsystem)?

* Does the kernel as a whole need a bug tracking solution at all to
receive reports? We for now require email for patches, so why not for
bugs as well, unless a subsystem really wants something (see above)?

[2] Some numbers:
$ for i in "" mailto bugzilla github gitlab; do echo -n "Searching for
'^B:.*${i}': "; grep -c -E "^B:.*${i}" MAINTAINERS; done
Searching for '^B:.*': 70
Searching for '^B:.*mailto': 12
Searching for '^B:.*bugzilla': 23
Searching for '^B:.*github': 17
Searching for '^B:.*gitlab': 11

> but it's a longer discussion topic that I don't want to raise here;

Would like to be involved there.

> it may be a job for
>       the bugspray bot that can extend the two-way bridge functionality to
>       multiple bug tracker frameworks

FWIW, development of my regression tracker (regzbot) and me using it to
track regressions nearly stalled but is slowly restarting. Would be good
if we could work together here, as there is some overlap -- and
regression tracking afaics is something that a lot of people want and
consider important. And regzbot is already capable of monitoring reports
in various places (lore, gitlab, github, bugzilla); so if we decide that
we don't need a tracker for the kernel as a whole, it might already do
nearly everything for the bugs where tracking really helps a lot.

Ciao, Thorsten
