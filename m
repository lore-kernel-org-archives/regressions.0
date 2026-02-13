Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C46F35A92B
	for <regressions@lists.linux.dev>; Fri, 13 Feb 2026 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770982164; cv=none; b=jKiC0yEXYygsozbpIHHvlc5tLGWhZL8zEarDYokehG5GD8bHKtgLZBG0kp9ezqGTxFFf/0lZnAA+HLjPu5i6VaJ1v87+arHffLvs0rt5QKxOsE+wgF3bgqUSRiDB70TCA5k+wwQQMB9evJJIvRW0Qau37XBUrpmiTZI6EJOHWyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770982164; c=relaxed/simple;
	bh=9gREkCtA2Yhmhynzu2QXfljnEImroXsUIvbRjWB7Fjs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=LoX3k0e6o+lIk1sO+Cmu13NYTx/WPO4RJ+WwyGRNOnpb7y73ZE6/jGzJt/EI3GNBBe0RR7GhkG7Yq8KWYSITvjaa1NjjDTsMu2yKhuw9px7zSplMLoEqCMHEMWbA2Xl1XdcIvoq0GHAHE0JOXwPVG1gpQxjqBqCm2Ca62uSHvgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fC90m6QHxz4DRr
	for <regressions@lists.linux.dev>; Fri, 13 Feb 2026 12:28:56 +0100 (CET)
Authentication-Results:relay02-mors.netcup.net; dkim=permerror (bad message/signature format)
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fC90m5kvnz7wJm
	for <regressions@lists.linux.dev>; Fri, 13 Feb 2026 12:28:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fC90m1LSwz8sbW
	for <regressions@lists.linux.dev>; Fri, 13 Feb 2026 12:28:56 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 3ED04674C8
	for <regressions@lists.linux.dev>; Fri, 13 Feb 2026 12:28:55 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <cd245f69-a79c-492c-8e48-046a57f3093d@leemhuis.info>
Date: Fri, 13 Feb 2026 12:28:49 +0100
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
X-PPP-Message-ID: <177098213543.1297019.9467398301836631284@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 3ED04674C8
X-NC-CID: fn1bB7PEoD63XJc3DUXb5CHC7D3kukE4u8C+N8SRucWkuk/SfEU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAH2r5mugbrHTwnaQwQiYEUVwbtqmvFYf0WZiLrrJWpgT8iwftw@mail.gmail.com/
#regzbot fix: kbuild: rpm-pkg: Restrict manual debug package creation

