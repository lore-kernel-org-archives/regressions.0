Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E730D259C9C;
	Tue, 13 Jan 2026 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314641; cv=none; b=PxUTX6+YXSru76l/w2tWzlBd2xMBEYIRf5IHEvIhy/AjNE/JiOyHaDgnFCMCtRSCPPvmQSRc/8jA8zPfF8iCLGV92x0vdg142ekr7i6LY/sseSKH4mVfWsVexpyWdymqxNXNc8uDhm61JKg3Le4opPQmtQfI6vxyvLD/fPnwbYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314641; c=relaxed/simple;
	bh=j52PdzIENv2XLxvMWCdJ+c3e62adqHWubgUdVFqyWPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGRZOOB674cTVRQ3OImtGybs2zuV1xwO5t5fHgJ3iasGTtrMcyLPSq1L+3vs+ylZmW+sYl007DpzUh76Q3gRSJ5++/FnJ0djEnrKrHOmmJwNQoOHkqqCpnFjCfCKw9K2VZIau29UR+9GhjGvKzQZrwactsBZtDZEX7xaBtUQ/XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TNvMx1NT; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TNvMx1NT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=YD/1Io+arbRJx4PEdND+flImAcKUeEptkUACRUXcVZQ=; t=1768314640;
	x=1768746640; b=TNvMx1NTmx9enK7w7yKUlkcfGm+aKZxymVaHkq73kuyW3DGXupyiQKFOgFouM
	qHP3nMZGdRPA1KjjCknQeCYurPU0FaXeJ5beSIZf1NMgczDrIk5voDxmWjjV9+AcnVFjrYKu0Z01a
	Z9TrufNBnzvO+/BYm11zeRzdp/PWlW84jWESsrGaC0EX6IeXG9gm1cDi8bpHavzn500tELBQdC/9e
	PFiaRJrCFjg8Akdy12SjX+F+g41QN+SM92ta2tnJWFe+CAOrf16lGGwl50XNinc/OtjyIdxLS8blZ
	nNesz2FEWu8SAvbUZ6L5ApDoP0kOvHo4qLZbsgRdsmaaIERSlA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vffPp-008uOy-25;
	Tue, 13 Jan 2026 15:30:37 +0100
Message-ID: <acf27b9d-fe11-4650-b525-4a91d1271e25@leemhuis.info>
Date: Tue, 13 Jan 2026 15:30:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/30] docs: reporting-issues: tweak the reference
 section intro
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1761481839.git.linux@leemhuis.info>
 <d94aa32d4a1ed5ef9d0f768d05e64987f4a1ae69.1761481839.git.linux@leemhuis.info>
 <87qzuontlj.fsf@trenco.lwn.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <87qzuontlj.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1768314640;5d949aba;
X-HE-SMSGID: 1vffPp-008uOy-25

On 10/27/25 18:27, Jonathan Corbet wrote:
> Thorsten Leemhuis <linux@leemhuis.info> writes:
> 
>> Small improvements to the intro of the reference section.
> 
> That's a bit uninformative ... what is the purpose of these
> improvements?  That information would be especially helpful in a patch
> that simply replaces that section altogether.

Sorry, yes, of course, changes that to

"""
Fine tuning to the intro of the reference section:

 * Call the step-by-step guide what it is.
 * Reorder the links to the guides on bug reporting to first mention the
  most modern one.
 * Many small changes to streamline the text and slightly shorten it
"""

>> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
>> ---
>>  .../admin-guide/reporting-issues.rst          | 67 +++++++++----------
>>  1 file changed, 31 insertions(+), 36 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
>> index 3bc47afaf85ea0..90b50c27c0d2b6 100644
>> --- a/Documentation/admin-guide/reporting-issues.rst
>> +++ b/Documentation/admin-guide/reporting-issues.rst
>> @@ -244,42 +244,37 @@ The reference section below explains each of these steps in more detail.
> 
> [...]
> 
>> +The step-by-step guide above outlines all the major steps in brief fashion,
>> +which usually covers everything required. But even experienced users will
>> +sometimes wonder how to actually realize some of those steps or why they are
>> +needed; there are also corner cases the guide ignores for readability. That is
>> +what the entries in this reference section are for, which provide additional
>> +information for each of the steps in the detailed guide.
>> +
>> +A few words of general advice:
>> +
>> +* The Linux kernel developers are well aware that reporting bugs to them is
>> +  more complicated and demanding than in other FLOSS projects. Quite a few
>> +  would love to make it simpler. But that would require convincing a lot of
>> +  developers to change their habits; it, furthermore, would require improvements
>> +  on several technical fronts and people that constantly take care of various
>> +  things. Nobody has stepped up to do or fund that work.
> 
> This paragraph ... essentially says "we're making it hard on you because
> kernel developers can't be bothered to work on GitHub".

/me looks puzzled
/me noticed that Jonathan is right
/me looks puzzled in a different way

> I'm not sure this paragraph is needed at all but, if
> you're going to keep it, have it at least reflect that the complexity of
> problem reporting has a lot to do with the complexity of the problem
> domain rather than developers who are stuck in their habits.

Considered dropping it, but in the end decided that I think it's wort it
and changed it to:

* The Linux developers are well aware that reporting bugs to them is
more complicated and demanding than in other FLOSS projects. Some of it
is because the kernel is different, among others due to its mail-driven
development process and because it consists mostly of drivers. Some of
it is because improving things would require work in several technical
areas and people triaging bugs –– and nobody has stepped up to do or
fund that work.

Ciao, Thorsten
