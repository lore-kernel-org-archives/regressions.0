Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF24B182B7;
	Tue, 13 Jan 2026 16:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320458; cv=none; b=UcUPoLA6MOTzKuAH9LFgwzu2ZbherbzgGxQIk5pxAlu7z5cnfeahZ6HHRnu+ZBku18PGxqOgSnwl39lxi3eUT/Mh9mAibez05rgF2JBeawF2+AduLKTY2yvRWSZ10ukhjXlRPFcvGigf1NdyzUTnt6DJbRNu0spkXgSnzmvD+pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320458; c=relaxed/simple;
	bh=zg0ft9cqjmRzYW+X3fu1ewNm7MEFWIpOC9I7fuZGvp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0qCxhuFtCWw1hxwaAwPIQgcfxNl7C64IzkrDlyoPoCfzYFC2e40BFTbz/nRfLsRvcMB9jW12DmsiPkz1oWZF+qv00Eiu02EE5pOawYYE6SgfcTXK2fs4zgk1RzHLc3jtkqEJ48iCh4oshR7HUp5ib9pSOqPHhqvyNnlNbHhCwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Cjf3p+/n; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Cjf3p+/n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=r06C6AWdFEQD76hIS2J6dGSm+E9B95HsJIQN08cNVHQ=; t=1768320456;
	x=1768752456; b=Cjf3p+/nJYfWguPUBDrkiD47zd9roRA+eA7Un1DxWtW8JKdAyCh9oWM48pxu4
	yMtVEbxt9sgcqY0l9HxX2pARTAnIwDTkhIo8SBc0cD348iWuHvsmz+qSWnd9CwXOV3pm7XcJtN1oj
	S0cPehwkcDyxmpkvstDSbau/XgYR3fVhU7RxCiqEshom11zK5VbUV6m4lheY2L4zUr4n2zmYMwOMU
	DtLzM1iexONuB26h1ENWuVCU/U8rx70sRL0Lb4yE0hUGkxCtCikOrz2sX3m9o4z9fVuWISL9HXUMW
	DUl5J5QpW8r9DQGWXGY0pnfexVpXWGzilwrdnhjfz02SlkVAlg==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vfgve-00959d-1C;
	Tue, 13 Jan 2026 17:07:34 +0100
Message-ID: <ae9a3fec-4872-4cb7-9e9f-dbeafb4daab7@leemhuis.info>
Date: Tue, 13 Jan 2026 17:07:33 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/30] docs: reporting-issues: outline why reporting is
 complicated
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1761481839.git.linux@leemhuis.info>
 <a6704ef5b3a8dcbaf645ddb5407e8f13553502b0.1761481839.git.linux@leemhuis.info>
 <87ecqonsse.fsf@trenco.lwn.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <87ecqonsse.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1768320456;27a130ca;
X-HE-SMSGID: 1vfgve-00959d-1C

On 10/27/25 18:44, Jonathan Corbet wrote:
> Thorsten Leemhuis <linux@leemhuis.info> writes:
> 
>> Replace the closing words with a section that describes why reporting
>> Linux kernel bugs is more complicated than in other FLOSS projects.
>>
>> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
>> ---
>>  .../admin-guide/reporting-issues.rst          | 67 ++++++++++++++++---
>>  1 file changed, 59 insertions(+), 8 deletions(-)
> 
> So the text is OK but ... this is now the second section that is
> essentially a long apology for the kernel process being so difficult.
> It seems redundant with the other text, and I'm not convinced we need
> it.
> 
> Again, length is an impediment to getting people to actually read this
> stuff; we should be trying to be as concise as we can.  Do we really
> need this?

I thought about this for a while, but in the end I this section and the
one from 4/30 are worth it. Let me explain my line of thought:

* Yes, they make the document a longer, but it's in an appendix, which
makes it relatively obvious that these are optional background details
you don't have to read.

* You in your reply to 3/30 asked to "Consider also soliciting patches
to improve it" -- something I in the context had found obvious and not
worth mentioning, as I thought, "everybody that knows how to send
patches will do so without us mentioning it here". But for these two
sections it's different: is stuff that is obvious for us, but not
obvious for many non-developers (at least from what I see when
processing bugs/regressions reports= and relevant for them. That's
because the kernel IMHO is not "an open-source program like any other",
as you mentioned in a reply to 4/30:

- Other FLOSS software is relatively independent, but the kernel is
mostly drivers -- so without the right hardware, there sometimes is
nothing that developers can do in case of bugs. We also normally don't
remove orphaned code due to the "no regressions" rule, unless it's
getting really old and/or in the way, so there is nothing anybody will
do about a bug report -- which is unusual. The stuff in 4/30 explains
such aspects.

- The kernel development model is different in some important aspects,
which can be even confusing for people familiar with FLOSS practices.
Like the "mainline developers might not care about bugs in
stable/longterm kernels, while the stable team will leave things to the
mainline developers if the problem happens there, too". This is rare and
IMHO needs to be explained somewhere, as then we can point people to
this explanation that otherwise will just feel pushed around and become
annoyed by the kernel (some obviously will nevertheless feel that, but
that way we can get at least some people to understand things and/or on
our side).

Ciao, Thorsten
