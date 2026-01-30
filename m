Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACCE34D3BD
	for <regressions@lists.linux.dev>; Fri, 30 Jan 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794969; cv=none; b=bCu8eKPtgzciIjAEYH7+zoIxBlRwhpa1pVcC5JnM2X36vWp/YXPkq9oMpMtw0rj1zgcbpNeqTuqojj2/kt/0F3lpbo8HEtLkuA+/6kPD+NIu9xth+rums9K1CKl8IOkh0jDuKLGfLCdDYcR1T0uOhCMZuE83iZ3Gk77CvkbDYeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794969; c=relaxed/simple;
	bh=BVDDd45MnXQ6Lz61BNKdqlTn8+mXWN7zMq12kHZb5K0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Vm8V02LQKhxA0ajbKlhJHzWia+/6XgBtfI9arTwXEruPHbU+nQldCNVlwubjT1d7r1KbEOhzY55Pn6AqslwVmixBApj5G8iw2yaKU37rvJZSlspwjIQivz0ycq9Df+YU+CqaSCk83A+9XmbGGq9G2sQfqrvK58d4XX2MQ761x+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YgS7TnSs; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YgS7TnSs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=BVDDd45MnXQ6Lz61BNKdqlTn8+mXWN7zMq12kHZb5K0=; t=1769794967;
	x=1770226967; b=YgS7TnSsFJMGdF/71F1WxtqhmjJihrg3ru/jhNJ9U2CjZdZVU2AmM46u6xX+h
	/lF4yLBEi3NmweG7iJnWEwcgQ8OVoNgAxcaeBQaKuYlEDtUXLP+hK+lPJmH91MM7MRmRKYMTj9f+h
	HlX7wbnky37Qmfwd7MeIBM8sSSy2kR43Bdz/cP9KJ1LMqwFnjR84QteYvtjguVp/nh31pL+84YNNZ
	0sEFGzsmwRe7hwCdujwppDFHSg9kL5bGuYtCjwEnwbTjR+ECJTj6laIOBW5rB/2ijbQMIhMZ+99Kd
	WV+WraYUM/u6/Squ712t/kP4NWAGfRWwRUPaRvcqi5M1GKqMeQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vlsW4-009bws-33;
	Fri, 30 Jan 2026 18:42:45 +0100
Message-ID: <c010bc3c-9f57-4b69-bf4e-63d588cfa9cb@leemhuis.info>
Date: Fri, 30 Jan 2026 18:42:44 +0100
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
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1769794967;5cdb7449;
X-HE-SMSGID: 1vlsW4-009bws-33



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/lkml/aU23brU4lZqIkw4Z@altlinux.org/
#regzbot fix: 09d0900f959154

#regzbot report:
https://lore.kernel.org/lkml/176608738558.457059.16166844651150713799@eldamar.lan/
#regzbot resolve: likely best fixed in debian, as per
https://lore.kernel.org/lkml/6498cffd-5bf9-490a-910d-f64ab9b7f330@leemhuis.info/

#regzbot report: https://lore.kernel.org/all/aXptBPF3L07zJB1O@earendel/
#regzbot fix: drm/amd/display: Clear HDMI HPD pending work only if it is
enabled

#regzbot report:
https://lore.kernel.org/lkml/CAJZ5v0gkhSxWZ9wTY%2B2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com/
#regzbot fix: 3f2de814c0597c


