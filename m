Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6141C3304
	for <regressions@lists.linux.dev>; Thu, 10 Oct 2024 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728561989; cv=none; b=TWCdfGGUfF44NJ2AJ0/m+we1s3Ld1ee/ifQZSWUKv1e0bqqdyAWSEExVp6CuhgA4Ob68bhlEFMoAoctSEOcd0Sf+xd0Gw5X9Tjo3VWVwWK0jTE3huljr7+tZNEeYLmkrVEaGa0JYO+bLF+MO3HjTF0nYpq1+7cQ2Y9xpT9n+YS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728561989; c=relaxed/simple;
	bh=RjjDOT8fZDXori5VvxuZaKc3oY12uTee8ZGy8J5UmP0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=QaOudk02EsqZTKNvf2gs7xNr1udrNJo6HHNcQsbF31vT2NCSc1lfddJSIPGeK8Ro5JN+IJVcI0Hkt6sl/M0SRTTP3J7DlGcZcwljapr8zNn4fLUN2zQV1bWNfcglTzj4rmyVia1xHNvNauGEMM03/D/5+zWa8L+qadDXtdaUuEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=twDzXYbz; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="twDzXYbz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=RjjDOT8fZDXori5VvxuZaKc3oY12uTee8ZGy8J5UmP0=; t=1728561987;
	x=1728993987; b=twDzXYbzfGHSHanyMM6Rsd5uqLhhaZHJBfcMZ5D0zmjvxP/JjPx6g+ou0nCT7
	Yj7kfYCs/mFj84IU2SlhVeEeqy0hS9wKFbJIbrG1np6oBRV+8Y6ro6yioJG2K2wh2azdH7AXHYspD
	cyPUGHnhLXXYn93c7Yb7PmyT2JUYXEvbB2zBdudb+u1yRs4l0Zcl7Xyh1ck7/btI3vRV9HG8G4U9j
	2dBggX/WBghyG47gdsCx5xIyq87zkm/4OfGVpd+C3T1Mk4HzCL6OanH8OsZvGbTccgC9BeXOqK/w1
	heA/GWBoqxrlHlIyh8BGkIQJa+5Tut9Bn7h4RphuI/Hr0eADew==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1syrw1-00088j-Is; Thu, 10 Oct 2024 14:06:25 +0200
Message-ID: <4dc5b6fc-0501-43ed-b195-a505af466a40@leemhuis.info>
Date: Thu, 10 Oct 2024 14:06:25 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728561987;70a6356e;
X-HE-SMSGID: 1syrw1-00088j-Is



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219365
#regzbot introduced: 7b05933340f4490ef5
#regzbot summary: Bluetooth: btusb: dongle stop working

#regzbot report: https://lore.kernel.org/lkml/ZvgCdYfKgwHpJXGE@eldamar.lan/
#regzbot fix: Revert "ALSA: hda: Conditionally use snooping for AMD HDMI"

#regzbot report:
https://lore.kernel.org/all/c9feac08-a1fd-4e03-a708-1046793443db@panix.com/
#regzbot resolve: invalid [wrong url]

#regzbot report:
https://lore.kernel.org/all/c9feac08-a1fd-4e03-a708-1046793443db@panix.com/
#regzbot introduced: v6.10.8..v6.10.9
#regzbot summary: thunderbolt: topology changes not detected after
coming out of suspend or hibernate
