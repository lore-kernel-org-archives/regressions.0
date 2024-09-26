Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6281D5AA2
	for <regressions@lists.linux.dev>; Thu, 26 Sep 2024 11:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727348409; cv=none; b=JjYCmQ8XKMoEWRJWXZ8IDRcmA6vNrw0mwzIIoSWQjFMEHbNj10P76ZPj+nQwF8BsXskZnAFh6aSGYQuzHyUHZkvUtgRspELBTW/SIKdI0r1u9uai7z3lljdFz0wVW+fJJ5x6zmToKTLdZoEs4g2og5bKk28OAax7uuKFycfa140=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727348409; c=relaxed/simple;
	bh=Y/9rRiwlYdv7nBiRaR+rfDkjQ9mDPZ8FDfWcwF9I+qo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=MZ10DABOhUZe9PbyyXSjizuxi6If3x4QjjWFBmjw4v1wPxrVqVVoAqGJQCvgOlGI4+SxDBbTtdRdGKkpEwX3nOlywlgrlwDdeLf8F5luuy+T0FIN5usvdvoQVEl874UBv+vpjB8c0jV7XGiv4TuOuWdP+yZoyt9p1PG/2XFJEtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=mpFz68VT; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="mpFz68VT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Y/9rRiwlYdv7nBiRaR+rfDkjQ9mDPZ8FDfWcwF9I+qo=; t=1727348407;
	x=1727780407; b=mpFz68VTycks1aSwbqjCOopAafkMNmMWrdfGF5Ynqb5iEh1SAF4nG0PsanW+b
	Y4dz29Ynrc7XSPf7lKnCXKsj0UnpPSg52WT3h+UXZ7YY0fbLR+iR/713ICJLutImjTyUeRs7Hp0Ik
	LAgatoJsDHt9a00PiHqtvv8hygIbCK330TpX+XAnlwfbyXZJdquQhS9WtbUXkPObjgx9agsU7s1O1
	kBv0467Yl7jqZyZvnIJBHqpB3i481YfSKHu4ikhkJiJ0S5pBeiMuOCy/tBSN8Eg02ZIxLGFXMIKuT
	rzF3/7bS9kZ2agfu8m+IEYSjA7y1MBf+RFOvoJV3t8woqkNzUg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1stmE9-0004V1-JO; Thu, 26 Sep 2024 13:00:05 +0200
Message-ID: <042c1dd4-065c-49d6-a6fb-8d3af358ee93@leemhuis.info>
Date: Thu, 26 Sep 2024 13:00:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727348407;92ffc48e;
X-HE-SMSGID: 1stmE9-0004V1-JO



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219283
#regzbot introduced: 0a46ef234756dca04623b7591e8ebb3440622f0b
#regzbot summary: ext4: exercising xattr with stress-ng on ext4 when
it's been created with ea_inode option causes a kernel hang

#regzbot report: c9feac08-a1fd-4e03-a708-1046793443db@panix.com
#regzbot introduced: v6.10.8..v6.10.9
#regzbot summary: thunderbolt: topology changes not detected after
coming out of suspend or hibernate

#regzbot report:
https://lore.kernel.org/all/20240926002533.10153-2-bendhoefs@gmail.com/
#regzbot introduced: 55eaef164174480df6827edeac15620f3cbcd52b
#regzbot summary: drm: i915: 3440x1440@100 stopped with dock
#regzbot fix: i915: Fix HBLANK Expansion Quirk Causing Modeset Failure
on Dell WD19TB Dock at 3440x1440@100Hz

#regzbot report:
https://lore.kernel.org/all/1763151587.3581913.1727224126288@privateemail.com/
#regzbot introduced: f79dc03fe68c
#regzbot summary: kconfig: conf/mconf stuck in endless loop at 100% CPU
#regzbot monitor:
https://lore.kernel.org/all/1763151587.3581913.1727224126288@privateemail.com/
