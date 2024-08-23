Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E7B18785B
	for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724413180; cv=none; b=nrxYsOI+PyzAdDXIRgGozMH/ZQ7iKBAbXz9dUWMpJ8NneqBt3bu1ndX/vg+h/WHXaT0a5kRvOHUxR/nuU2uwJOgKevfx1ug8OF0lqGdFPNvl+jiNmLVnuo+gb9KMzyiq+f0C16E+I1A88meUUJB/dE8CHkgmEy5xzug40G4nadE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724413180; c=relaxed/simple;
	bh=idGU/LKScKZal4yu9viR2wHVh4oas8bRwvia/VaV82I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m6P3jnwO6hG5vX+xzNkEgqFjlt6lvjiWeI849sdHJLlU+0vgkV3WvHe8/JaSuE/JV8FWYn5iqgDaoiH+jpJsr8k5FjLwXs9teR2bbtYKn7xIHMBr1xE0aQyTFpLIduErxbfc2m6mg0zSrvI1Ba3lg6rBJglsWxJOWSH5VeVQoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=JLvLgatU; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="JLvLgatU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=idGU/LKScKZal4yu9viR2wHVh4oas8bRwvia/VaV82I=; t=1724413178;
	x=1724845178; b=JLvLgatU88ycy2v8kh0uksb5QbhsS83H4qpa6gQJzSwDQNbZxMezP3JCrmtkm
	DxYF8xTxlKVsXiJI//B/UglO6pNwGPSSqBmQGC3ly6p7ep6g1NKlxUB9e3pHWx0lxjhgCCCV4NQ7L
	Wkuow2Pq9G+LnFt4xkW4+kAiG7SBccgHkPkJ5GS843dlpoIJbfcGO0mQzJilHUWFNK0DqFSUbcA/f
	BhvNCmL725HuLNWWnT8oMEm9b74k2N52XRyZ4t7YAjsOH+url5kGrziGdokFOGUgT6JNOf5tIGVau
	AfXjw2Tq340EeWbkpQiQWWB2GXMBH9mz83r943ejBs81iy0+2w==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1shSdk-00050h-64; Fri, 23 Aug 2024 13:39:36 +0200
Message-ID: <ad9c3a4f-5cfb-4125-af66-38d292266da2@leemhuis.info>
Date: Fri, 23 Aug 2024 13:39:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.8.2->vanilla 6.10.6: regression: oops on heavy compiltons
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, regressions@lists.linux.dev
References: <E0C9932B-A6DC-4644-A51F-A65723B63558@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <E0C9932B-A6DC-4644-A51F-A65723B63558@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1724413178;50c5185b;
X-HE-SMSGID: 1shSdk-00050h-64

On 23.08.24 13:27, Piotr Oniszczuk wrote:
> (also sent to <stable@vger.kernel.org <mailto:stable@vger.kernel.org>>)

In that case: to avoid confusion, please ignore this mail and reply to
the earlier one
(https://lore.kernel.org/all/BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com/
), which I will do now while CCing this list.

Ciao, Thorsten
