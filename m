Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F3514B94B
	for <regressions@lists.linux.dev>; Sat,  7 Sep 2024 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725698284; cv=none; b=lEsOLR+nogIx/8sITSxtvvqdS2G3YVc1aA64OrvTqo3SpPHesxf9mgEJH5oeYn6OHd//PLnwSrUgiJ9+6VOOwbqyHOp9r5wDk82vZeKvGZDyH2pJoxXNCcoun0Aj0XKLrV/7NfsObiJkWI/PX1hABaQZRxm31rXzcLXEVoX/S/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725698284; c=relaxed/simple;
	bh=RpmwUITAPME0m+dRj+rzi5JOSagbdkLCV0Imp/WsWfY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=KnhIDcaTPvhkIkM7GOZJjho52IzwMJ/OHK8spM7zrVS1RbAYnTroOn+V3t7u8aYyLbJE84sPHZ5BEY+6KmlRUaq/IBmUPnqmEUF1ENO49Oc4SkKpLrDPGdpwOM7XjAIFUiALZ9J1Kytf3z45dXjtokrK+AUR609DdIuYUZsHIaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=FEzQvMyP; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="FEzQvMyP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=RpmwUITAPME0m+dRj+rzi5JOSagbdkLCV0Imp/WsWfY=; t=1725698282;
	x=1726130282; b=FEzQvMyPwSfRlbvNJn4A9bDoYE3NpBzyfu3BfjIfmg9eK2ZkNtvDxBKihpK8X
	N2gQoxWw86xWDqOinNVFCu611ST1ABYHL4ftH0ciF5yREVpbXe2YvVCCT6swXyTJqMfF3MT9ain7j
	5RH6sCPdoYiiKruwIgcxWoWmCwOp+F+DEOOXXfbGzJ4uG/fmEV/ubECj9C+URFJE/DOpkpIEnvc7D
	/6xIiJgTQygngotwRvXoCfaW3mXoCRrHi/fqU62z876eqCnX1lctPwNLACy7kmjXKAYm+Q6eUv4r6
	exWaSb3A17d81RABZDn23WpbiWYbGvu6juS3EoXqtZ096ehzQA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1smqx8-0005Ml-Am; Sat, 07 Sep 2024 10:37:54 +0200
Message-ID: <d52dbc81-b520-44d2-b315-f931260123c2@leemhuis.info>
Date: Sat, 7 Sep 2024 10:37:53 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725698282;0bb3ecbc;
X-HE-SMSGID: 1smqx8-0005Ml-Am



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/ZtsTGp9FounnxZaN@arm.com/
#regzbot introduced: 89add40066f9ed
#regzbot summary: net: booting from nfs root on an arm64 fvp model broke

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219166
#regzbot introduced: af2814149883e2c1851866ea2afcd8eadc040f
#regzbot link: https://lore.kernel.org/all/20240907073522.GW1450@redhat.com/

#regzbot report:
https://lore.kernel.org/lkml/CABXGCsMmtqzBfUykT-JgyhZn-7ZXtftHL35znDdYuTnUOpGnoQ@mail.gmail.com/
#regzbot fix: 11752c013f562a

#regzbot report:
https://lore.kernel.org/linux-fsdevel/792a3f54b1d528c2b056ae3c4ebaefe46bca8ef9.camel@bitron.ch/
#regzbot fix: 76a51ac00ca2a72fe3e168
