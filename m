Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BB129BDB4
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 13:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951559; cv=none; b=kA/Oa1YryqzkuSYNn7cRSCKcgsYzYiqzxwk7BRKrlZcXzwORq5Jjt2QDLPjZAsvsjvO7ocSu5bEp299A7YpXYtfR40lPluKv3FaJDjNCDSS2Y8W3qmMHkYh5GJvtQ+Y3I16jiUQKlWbDakL1ZmlRZgg0diXdIF0WqarIkp2cDm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951559; c=relaxed/simple;
	bh=VHR4iE7ZTo20h+pblcZV7qQ3hDPjsxA9Z2ffOhQanos=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=cvJfJQls7+RUgR5AsdlncMc7Akby9thGCEydQnbyt2xvTAuzZBHUwdMLsIaot92ql28w0mu2qk//ifRBrhtfuw5eWwGD90j8nj0YUKSR2pmlt1kuCI0QpG2SNhMDTRtYhgcVcrjLpDpafC7SNbr62X4Wu16Io7FVReqPC+4LGlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=WAe1yRJY; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="WAe1yRJY"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4g1cd806tCz43c0
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 15:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776951548;
	bh=VHR4iE7ZTo20h+pblcZV7qQ3hDPjsxA9Z2ffOhQanos=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=WAe1yRJYzOvoxhr3ixGjEf+PcSIBq2Ly1Wdj3wD7aLSD8WDVQsKTevTo8sOASchW+
	 deqC5ktOs6qB45ObwrGJs1tAaHHTrfsPxx+WbAysZQpuZhWi5kBoCcUbb2gH/OFyD1
	 2BuNdaNSiWYCE6IApM4f+UfZX91EDRs3lW50tUPkzYdWS2yiZJliXqfO0rMkO98H7O
	 Hh6bp/lRWX7OLwEXm7+Hg56sl1gwfwOUWIsmQim/8XnvERIY6tQkqr3jLg4xSqEOvL
	 43B0k4U+JdpPBCYVARsAam5h/Iw5rM9xEXvOqD4bk0CON4UpNJ/BolymWEh9LinK9T
	 CbGI2Xaa6M3CA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4g1cd76X5Cz435N
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 15:39:07 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g1cd74TFqz8svH
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 15:39:07 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4F296632E5
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 15:39:07 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <5fa92978-69bc-4d4d-b331-74e00ec40b14@leemhuis.info>
Date: Thu, 23 Apr 2026 15:39:07 +0200
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
X-PPP-Message-ID: <177695154748.962137.4726945150451533852@mxe9fb.netcup.net>
X-NC-CID: 0CXzShqS92C/d5TR7xaNS3kwLSSFQjt2H4OwjXrbFkqLNr6ggXo=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/CABXGCsPdTyd_79sXZFJEBqYDXGxH3mXXwvhRCagNWzzNGrKt=w@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/all/af005996-05e9-4336-8450-d14ca652ba5d@intel.com/
#regzbot dup:
https://lore.kernel.org/r/CANDhNCq%3Doizzud3hH3oqGzTrcjB8OwGeineJ3mwZuGdDWG8fRQ%40mail.gmail.com
#regzbot fix: locking/mutex: Fix ww_mutex wait_list operations


#regzbot report:
https://lore.kernel.org/linux-clk/18719902-4b4f-4766-ba92-658f3576f68b@sirena.org.uk/
#regzbot introduced: 672299736af6
#regzbot title: clk: bcm: rpi: boot regression
#regzbot fix: clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
#regzbot monitor:
https://lore.kernel.org/all/20260401111416.562279-2-mcanal@igalia.com/


