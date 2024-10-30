Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084531E47BA
	for <regressions@lists.linux.dev>; Wed, 30 Oct 2024 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290470; cv=none; b=fBNPjlt/FunYPjG2Y0zekAw8cKQT7vyO06IeRpO8sSW+YDr0H/jZJ/QfrNJ8oantk0aHhHE+YJ6EPZfb4yfJV/JIjbNABm0woFTu3jyLL6um7wVL8mW/A0LyuTxa5QufYv5EUENhvsZIxwgNnj0+TBRmYyNDGLHytIYYkflY1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290470; c=relaxed/simple;
	bh=JyhLdZ6jFcjTPhlHxLE5R+OH5klNc0yKaMTnA1NUxNQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=HQrbx6fUbtg0KK7gS76fBWbJFWTnqQ6BPizqTFGUtlsRaWCRaZE9DMkl2VN9+F7J4+Cnf0ilcbEoJVCu2VfqpR4ugmd9InQmi3GWKfFhetqgfz0yBlT6qpU1mpPA3sdiDDqXZtoZHKhDC1sVZBavJ4/xCWwQCsi0qELT8wAba1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=vlqZ5/Zy; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="vlqZ5/Zy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=JyhLdZ6jFcjTPhlHxLE5R+OH5klNc0yKaMTnA1NUxNQ=; t=1730290468;
	x=1730722468; b=vlqZ5/ZyBDjzyC7L0K83SNmhlxGwXcVzbRWv5RmzGW2Dh2QCpFoJQPtlSmjXv
	pWdvJWI4RWZb+BAxyxMNAmQaRAmO36WwKhuyKYCFEVyOC8gsKfOv0P7KYriOkl0hG0YLS2ZgpxNJL
	4pRC/ooTXTpCXLiOrn8ryQGL4vyRmaN3nsMYV+L4Zyzx+JryJ85JpoaAqg31nU7Y4TYH6PtCTZ4xj
	DKNYJhYbEuABzdXiicdjQlQAgEEhJJbYKLwPb7vzsxd01ZKxMUYQTwc//nht91Liqunj2OCND2saw
	Tz7uIKd263uK02zkNKdAXt+vIu6yypJsugrQijK7xM/DsnF7eA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t67ak-0003h0-6G; Wed, 30 Oct 2024 13:14:26 +0100
Message-ID: <a4643fbb-2b78-4134-8c66-23851748b1c0@leemhuis.info>
Date: Wed, 30 Oct 2024 13:14:25 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1730290468;ca3fe074;
X-HE-SMSGID: 1t67ak-0003h0-6G



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/63d6ceeb-a22f-4dee-bc9d-8687ce4c7355@oracle.com/
#regzbot relate:
https://lore.kernel.org/all/70cb224f-a468-40a0-82c7-735c590bdb43@oracle.com/

#regzbot report:
https://lore.kernel.org/all/88ae633aa910c7e320b89e5f4779d472f7cffffb.camel@gmx.de/
#regzbot introduced: v6.9..v6.10
#regzbot summary: mm: vmscan: RT wakeup latency spikes

#regzbot report:
https://lore.kernel.org/all/20241028062246.10997-1-showrya@chelsio.com/
#regzbot introduced: a1babdb5b615
#regzbot summary: RDMA/iwcm: kernel panics
