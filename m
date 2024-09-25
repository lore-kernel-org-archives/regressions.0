Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22F189F5B
	for <regressions@lists.linux.dev>; Wed, 25 Sep 2024 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268433; cv=none; b=rEM5ihZxIR5CmgiRaQfGUzY2uIPX5FFLGtmf7sdD4zmRPHPY0RCqdqxIdUEW4ufL2RWBvsqdj56fAW9MppOit+QoXcs9XkdX+C7LaEro1JvgSHTlNKb74jz41h6Gwqr7bdecIqimYO42U+lQghaQWjEc7x+uGcpOvZ2wIjFNhbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268433; c=relaxed/simple;
	bh=tBuCYNKSfnpWj3ljXqZeOXI9fyXzrXNZarLY1NT3mjw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=MVNcrUilxQnJXvRtaTw8q7b1bb/9UBA5H//BX9HZsZAHze8QgfV18pKMuU4I96b+ioPPxHpqkxx/M+6fmqfKIOguB/OuseGwiv8XT0sE/pH8Mia3AgyPZvzSfVhasCiwFczHHrhXmW7rLpLqQhD/Z67w8zhGDfmFnEVdSQMNqkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=VvsRldQs; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="VvsRldQs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=tBuCYNKSfnpWj3ljXqZeOXI9fyXzrXNZarLY1NT3mjw=; t=1727268432;
	x=1727700432; b=VvsRldQsmQlCsEN0d3h0gjdT95/2ozwv/lTGwKOybAEL89Y4gSsK7S+3CP4lr
	A9JGhXD6Yzd+pMMnNUomDi3s44978fACwYdBJD2PvlRrJMEFrn30G9DBen8cLbQkLa2uUq8UCwVqn
	Fa1qQM28I0o+yHdlfa3Hi/HIMQQ4uX3n9OYOThGrmttyJpPA2DcRB36FVqNpIFQ5IN8nbCsuMvHgO
	TFa7JohTZEgFzZLnt2Jef7uyVbA9y+NODJa0xeJxprPrQznpIITeC/x2JslAv/7oKXbULAlr3hiKn
	rVAdQOjeYi4qePvfGQnAOyL81qNp7AK0lripWDlWtUV8/LITnQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1stRQE-0002xR-De; Wed, 25 Sep 2024 14:47:10 +0200
Message-ID: <ba6a23cc-2879-4818-86cb-18ad1e9c086e@leemhuis.info>
Date: Wed, 25 Sep 2024 14:47:09 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727268432;a8623d73;
X-HE-SMSGID: 1stRQE-0002xR-De



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/96030dde-6c02-4308-b41b-48aeeba670f3@telus.net/
#regzbot dup:
https://lore.kernel.org/all/c21b734a-1d3d-4286-a3c5-a6ae9b69d847@telus.net/
#regzbot introduced: a171cce57792b0a6206d532050179a381ad74f
#regzbot fix: drm/amd/display: only trigger BIOS related assert for
older ASICs

#regzbot report:
https://lore.kernel.org/all/CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com/
#regzbot introduced: 2003e483a81cc235e29f77da3f6b256cb4b348e7
#regzbot summary: fortify: booting broke when FORTIFY_SOURCE is enabled

#regzbot report:
https://lore.kernel.org/all/CAPX310gmJeYhE2C6-==rKSDh6wAmoR8R5-pjEOgYD3AP+Si+0w@mail.gmail.com/
#regzbot introduced: v6.6.28..v6.6.29
#regzbot summary: Dell WD19TB Thunderbolt Dock stopped working

#regzbot report:
https://lore.kernel.org/all/20240923100508.GA32066@willie-the-truck/
#regzbot introduced: 724a08450f74
#regzbot summary: fs/9p: 'init' reliably fails

#regzbot report:
https://lore.kernel.org/all/7882faa8-d5ec-4868-b158-0b942b669cc0@gmail.com/
#regzbot introduced: aa3998dbeb3abce63653b7f6d4542e7dcd022
#regzbot summary: libata: HDD power switching off and on when
hibernating and resuming
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=219296
