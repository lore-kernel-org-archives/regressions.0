Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2854C5680
	for <regressions@lists.linux.dev>; Sun,  5 May 2024 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714916460; cv=none; b=nvBx/ilMwlzx8tcbmByf+0cDKvRxK/026bsTvh8965JjExnZ6xdFt1suLTdN1OB7uSE4LGDhtje3pD+9T27F6LrzUOIEQ5k+Lw84+pWABUp57VvdiYk7p2rFn0mkcrVYJTA/NWaKUjTUrnUJa04K43YMeW54BFco7+1NFF2ePWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714916460; c=relaxed/simple;
	bh=3Lz3Jz5u53nTHOPFjFs2hZWZn4D0h1NlFC8AFvYy5t4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=lt2zaWr0jb/8HcP+LLbthsIwYzKoplf8o4ztFjZdSFccfDWe1YWwky+IboevadzoDJzAidn7eOdHoP8mCGNt5GFhRP9fMzTSXNxjl6xjEQcdrU0OUwCyH3m4zWSZWqpTmcUQS/h7QWHCWwpF+CWKOZEfW6u9Puv5otwyP+ClIKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Fku64TQ7; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Fku64TQ7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=3Lz3Jz5u53nTHOPFjFs2hZWZn4D0h1NlFC8AFvYy5t4=; t=1714916458;
	x=1715348458; b=Fku64TQ7DRA43hiTujABqjnirj3RADkExNXUniSeQPl/dye4ovvjRtohz+Ox7
	HGsd/BTfNLohOS63zsRDjehWwSwU5aZ01Hb7zgXkKsTd36lhYFQQTLqBwdAnKgnXG631+KX0O4vPK
	na1qIm42oSxjdCb6axxZU5rJ4Us+/xp9Bvgu4GWrTxeef/WjFiwQmMm6rHW8V6OfS9bCMJY3b/IxN
	CuNKhneK9rZd5es+egfTgv6cqEBGaunozr2UJhcEixUif9ZIJhYVuZoQJ/JdK0GBXUOGqkPnoF1Ka
	oelcr3PSbZKIzTytmL9sqWGfZedoC8r291JZaCJXIquAA6hMxA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s3c6k-0005gx-3N; Sun, 05 May 2024 15:40:50 +0200
Message-ID: <fe01d109-392d-4a13-bfec-559a91b95d59@leemhuis.info>
Date: Sun, 5 May 2024 15:40:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1714916458;e27aecfd;
X-HE-SMSGID: 1s3c6k-0005gx-3N



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/ZjcRPelwZP34N42s@gmail.com/
#regzbot introduced: 1d7bae8f8c85
#regzbot summary: kbuild: deb-pkg and bindeb-pkg: build failure (and
slowness, too)
