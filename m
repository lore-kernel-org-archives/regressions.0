Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998620E30E
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 06:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729233567; cv=none; b=dUUWIOs6fw5tYsk3f1EVPtO2BStNzyH+/44IyP1JID+k6juIptFuzBDQGQQnCjWFs0M2+7tS00NAfo4wne4BkF6r3TcGw9pFR1lx3+dnPKMftRuI0mIf5HKE5ObnZIXUI2exEDvvsXDHXB8QXQJ42/Vdn8Plmlnehf/IlOeTMkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729233567; c=relaxed/simple;
	bh=aP23ogiHml/v+ftvDGFVaBZkl6aDgBzHlomPPmAo9bg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=PKghb8GDg8Xytn/FKJ0X3QY6ugoRATTN+Db6XSmPJwnv+A3KFJOZwp69Oyd/TVz8qEOayM6D+Ap76WTqtnGVWv4S7c6mXyFAzvxyTYtFtr8MTh8xYLbSGvjeGDUrmBO09XkJPnQD7gOq51iyJQZuZxJte+PGbG+ydM2cQ1h8W9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=UrA6vJZl; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="UrA6vJZl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=cB1e+BtV53zNsFevdKpY7IkESTDAY4oP5iednFgkli8=; t=1729233564;
	x=1729665564; b=UrA6vJZl1lmwVEjLH3uU3I9K5vRtond43RixjkpCNxU1BpP/MXS8Kmo6pNkmd
	UPK9UAsrJtglY/6CcXE6inbScwcoTrUBhvkz0ALmt1eqcnkUJHi11jR/Sv7DJsuVq+JhmjNqndnXD
	qtfDFdR/xdHT8p5TU71hlWc9NNnwE+ZJT2EU8EmAmkAgYrtcRu8COMTpGdgiLH1Zcs4aBAk03jSmg
	JG3JupxoSJmMGmYazBYd3BrOHqe2o2LSEdgryBJ5KDhpXANQGYSgVM+Q6jnG90PaveorLaR3LbRmw
	mu3Dr5jac3lgEnH+c+kEkcVdhUffCFSDtrTdKa79aUt/VJv1EQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t1gdp-0006dD-BQ; Fri, 18 Oct 2024 08:39:17 +0200
Message-ID: <d78d356e-75b7-49d3-afd6-6a107d7c7fed@leemhuis.info>
Date: Fri, 18 Oct 2024 08:39:16 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1729233564;3effe9dc;
X-HE-SMSGID: 1t1gdp-0006dD-BQ



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219388
#regzbot introduced: 0e4851502f84
#regzbot summary: r8169:  PCI error after resuming from suspend
#regzbot monitor:
https://lore.kernel.org/all/b8e7df14-d95e-4aab-b0e3-3b90ae0d3c21@gmail.com/

#regzbot report:
https://lore.kernel.org/all/CAC8uq=Ppnmv98mpa1CrWLawWoPnu5abtU69v-=G-P7ysATQ2Pw@mail.gmail.com/
#regzbot introduced: 8396c793ffdf28bb8aee7cfe0891080f8cab7890
#regzbot summary: mmc: dw_mmc: Unable to handle kernel paging request

#regzbot report:
https://lore.kernel.org/all/ZxFEi1Tod43pD6JC@moon.secunet.de/
#regzbot introduced: ee4cdf7ba857
#regzbot summary: netfs: booting fails due to a list_del corruption

#regzbot report:
https://lore.kernel.org/all/ea1eeb13-c568-4381-812a-dec4246a440e@candelatech.com/
#regzbot resolved: downstream problem in a forked kernel
