Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445A23491FB;
	Fri, 16 Jan 2026 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556569; cv=none; b=Tj9/906ecln5vjGkRT54MWxT2LvAxuy5YJoYSd2W6dIGDK9grwob1mFUDX7b4Rq1esCAzvIHxopn6WWdplW28QmoSvTyBG0mLydeXmQknpr6GRplVZXmbNa/Jh9ui3YSLpiyfVii2RlfJv/YAweGr5UmRCSVvaMDL9WwTgQkfe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556569; c=relaxed/simple;
	bh=mb5z090q94FBleCILspomztiYYsvpJGHIu5iN7NE3MU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y29RggtT6OWyz5d3TY9CuGBaJ5vihsxKNQYfvF1jJQp63/BVHFa1iNMOJaeNhrKuji9G0X2oalHMCOgS0k5zxpYTrFUVifR+iwmy8/KMckcJ5wL7KXT7JcmSQO+j+hGYLWxP0VIXHF6pBBFpoSwwpxSWR9Y5B+zd8ZI0mETQCV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=zhhBtC2+; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="zhhBtC2+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=f8YmAYYQxOcNugQY+kpC0S1XbSkeEgPGFVz3XYzrL78=; t=1768556568;
	x=1768988568; b=zhhBtC2+3Bmixcn4UZgjubBF0IV2W1b/LvevmQeX7L+p7S7klKi2l4ZCQCmoc
	e1QYKVvkuyd020XFg0SuyFQDpWMJU3dY4m5yG/5XdkPUpBENMhbPjKL5EphOq/4CPGx9IT4oNSW46
	7GNnV4j2Py6nj2uSdSUxz5gnb5JE02HxapSdYqBbpsq4oB73HMkxB4mzu8fXVBM6dz7WCPG8KrXKx
	ckA2+D1GKDcBeFuALzwWTeOHqRKSO0UjheFvPC0qNvYLHmTbNV8+eV2+VqCBbV3i4pGZ98/ikiFLa
	bkRvi8JzGvT1GdXgTBm/qJjtZyjOxP9EzCVyAN57+NGEWqssXg==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vggLn-000Q64-14;
	Fri, 16 Jan 2026 10:42:39 +0100
Message-ID: <3c8cac2f-cc01-4b72-8967-e1d4f188d0e0@leemhuis.info>
Date: Fri, 16 Jan 2026 10:42:38 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/30] docs: reporting-issues: outline why reporting is
 complicated
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1761481839.git.linux@leemhuis.info>
 <a6704ef5b3a8dcbaf645ddb5407e8f13553502b0.1761481839.git.linux@leemhuis.info>
 <87ecqonsse.fsf@trenco.lwn.net>
 <ae9a3fec-4872-4cb7-9e9f-dbeafb4daab7@leemhuis.info>
 <80102174-2d5f-4f52-8836-806b61eabd7c@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <80102174-2d5f-4f52-8836-806b61eabd7c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1768556568;644dc6ad;
X-HE-SMSGID: 1vggLn-000Q64-14



On 1/14/26 06:02, Thorsten Leemhuis wrote:
> On 1/13/26 17:07, Thorsten Leemhuis wrote:
> 
>> I thought about this for a while, but in the end I this section and the
>> one from 4/30 are worth it.
> 
> And having slept about this once more, I after my reply yesterday now
> think it might be wise to merge the important parts from 4/30 into this
> patch -- that should get things shorter and still get across chat I care
> about. Sorry, took me a moment to realize that.

FYI, wrote something new (see below) which is even a few lines shorter
than what is in the document right now, yeah. :-D

Ciao, Thorsten

---

Appendix: Why it's harder to report kernel bugs
===============================================

The developers are well aware that reporting Linux kernel bugs is harder
than in other Free/Libre Open Source Projects. Many reasons for that lie
in the nature of the kernel, its development model, and how the world
uses it:

* *Most kernels of Linux distributions are totally unsuitable for
reporting bugs upstream.* The reference section above already explained
this in detail: outdated codebases as well as modifications and add-ons
lead to kernel bugs that were fixed upstream a long time ago or never
happened there in the first place. Developers of other Open Source
software face these problems as well, but the situation is a lot worse
when it comes to the Linux kernel, as the changes and their impact are
much more severe -- which is why many developers expect reports with
kernels built from fresh and nearly unmodified sources.

* *Bugs often only occur in a special environment.* That is because
Linux is mostly drivers and can be used in a multitude of ways.
Developers often do not have a matching setup at hand -- and therefore
frequently have to rely on bug reporters for isolating a bug's cause and
testing proposed fixes.

* *The kernel has hundreds of maintainers, and all-rounders are
extremely rare.* This is also due to the multitude of drivers and
features, which is why many know little about areas related to their
code and even less about unrelated.

* *It is hard finding where to report issues to, among others, due to
the lack of a central bug tracker.* This is something even some kernel
developers dislike, but that's the situation everyone has to deal with
currently.

* *Stable and longterm kernels are primarily maintained by a dedicated
'stable team', which usually is forbidden to fix bugs just there that
happen in mainline, too.* The team thus will almost always want to know
if mainline is also affected when someone reports a bug, say, using
Linux 6.1.2: if it already happened in 6.1 and still occurs with
6.2-rc1, it is best left to the regular developers, as they know the
area best.

* *Kernel developers are free to solely focus on the latest mainline
kernel.* Some developers, therefore, ignore or react coldly to reports
about bugs in, say, Linux 6.1 when 6.2-rc1 is already out; a similar
reaction might occur when it comes to reports with 6.1.1 or 6.1.2, as
the stable team might have caused the breakage.

* *There might be nobody to help.* That can happen due to the lack of
hardware documentation -- for example, when a driver was built using
reverse engineering or taken over by spare-time developers when the
hardware manufacturer left it behind. Other times there is nobody to
even report bugs to: when maintainers move on without a replacement,
their code often remains as long as it's useful.

Some of these aspects could be improved to facilitate bug reporting --
many Linux kernel developers are well aware of this and would be glad if
a few individuals or an entity would make this their mission.

