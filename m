Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3991D0E28
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 20:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727899986; cv=none; b=m63JvG5UNDlEUzYQ+O5IGC+BkcLBlMZT3P/2+Q8IFXyk1OJWRnuzyRz77KHyOE3twWHBAf2Ac2St6ptpgrjesR/5IrkNgYxoBCC/9lMn7XhyXkFvYQInXCI2ly5bl1szzfggwxpWV/aXVuzz4+q1EcTZSLl1AXFDNMymmumy21M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727899986; c=relaxed/simple;
	bh=rVOLZoEkon0/CnJxRev1d+AVLPZj/+9AKWZ1AT3ycqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YyVB/d38DwjBPGmuxzNZt96+TDuzAEgfqK03LHioMgAEL0wjM5zbx7BLmy4ZLnwSpNYnb+kuPlRUWArlQlxlIg0C1Ag3MFYsv9Pg4X6Spm+fdu8X7IXR0JEuUIkVIGKA5WUW5CpTe37ig9j8YlAEAK749wzKfPuLrqkcGJoN1y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=IvOnVx11; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="IvOnVx11"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=0Di+YB+OJCnIicPUpJVTdPqMYQlFKN3e4DH5uDI8nI8=; t=1727899984;
	x=1728331984; b=IvOnVx11CKrCLD+gsGXF99+EuEK//PSiznRYpj26B+ljkAH6WigjGO6HDYVLQ
	zbIgnSQiCd/LyKZ5Ohi7gq1LICqJnz0iLs+LHMmu5q8ChRimj9qMYMOXS1wmB9A6w/NauETWubmWa
	ORJCSCrfB+rV+HQO+xy4c7vaIxGJsrIgrDXpnL/L0c1nlWYUW1DBoTp2jyQqUZOANQ/N3LG5od5Nx
	o3br2uldgaJPN2YdYQFbgEjxc2hGDVWew26YKMISSfAPrs/9ZFM97HmWxm1IK/INecu4LSJpsT/M9
	gkwn2Mvrd/Q9gAp946x10+wt9aRiwD25S3ZR/XAc/P/8sq/1qQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sw5iY-0004Pj-8K; Wed, 02 Oct 2024 22:13:02 +0200
Message-ID: <57da0956-db6e-47c2-b489-404795c3c6bf@leemhuis.info>
Date: Wed, 2 Oct 2024 22:13:01 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Christian Heusel <christian@heusel.eu>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
 <808b3dae-27ec-4e45-bf29-50fce318411d@heusel.eu>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <808b3dae-27ec-4e45-bf29-50fce318411d@heusel.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727899984;70b42314;
X-HE-SMSGID: 1sw5iY-0004Pj-8K

On 02.10.24 20:57, Christian Heusel wrote:
> On 24/03/09 11:18AM, Thorsten Leemhuis wrote:
>> Hi! This is the start of a thread I'll use for updating minor properties
>> of regressions tracked by regzbot. Consider telling your mailer to
>> ignore this thread, the replies are unlikely to be of relevance for you,
>> but done here to ensure a public paper trail.
> 
> #regzbot report: https://lore.kernel.org/all/cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com
> #regzbot introduced: f1bfb4a6fed64de1771b43a76631942279851744
> #regzbot title: usb/acpi: boot hang on Thinkpad T14

FWIW, it nice to get some help, but if you want to do me a favor, please
wait for at least 24 hours before adding reported issues to the
tracking. Often it will turn out that the regression is know already and
a fix already pending or maybe even mainlined already. And then somebody
has to tell regzbot about the fix as well -- which in the end likely
will fall to me, which right due to the lack of funding and available
time might means that the load gets so high that I might have to give up
with regression tracking completely.

> #regzbot report: https://lore.kernel.org/all/D4LHHUNLG79Y.12PI0X6BEHRHW@mbosch.me
> #regzbot introduced: ee4cdf7ba857a894ad1650d6ab77669cbbfa329e

This is likely such a case -- I even replied (which you might have seen)
and deliberately chose to not add the regression to the tracking,
because I suspect the fix is already pending. At some point in the not
to distant future it might make sense to add such issues to the tracking
nevertheless, but right now it makes things harder without any gain.

And don't worry, if this turns out to be a different issue after all,
then I would have added it to the tracking.

Ciao, Thorsten
