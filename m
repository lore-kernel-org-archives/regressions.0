Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0F53CCFB0
	for <regressions@lists.linux.dev>; Wed,  9 Sep 2026 07:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937536; cv=none; b=FdNc4waYC7jFmWg+gj6nL4T4MNivaI5Gc00Lp4c/y4cq35a8q2hrpbelHNCuCx/Vj51mr4QptUCmgcjbljcBzUGRpICux5Fiqg/Q9QJtvuRDkQEmhNrdfc5UPRRpk/+w1TFU0L0bztU6hNB1xBNzQtO7hJxk4ipvRBileYZAlWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937536; c=relaxed/simple;
	bh=6qI9D2RU/2PTHqlNrD1T9klfxiEnpATjjwaUBYs2mq0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EkdLhm1wxhQ/KOb9BVZFkCWDaj2eB6Wvv2a4JU0MQuu3jG99fD5Lz36k8s6+f9N32I4fd4bGgwSHbILi6SD7xlW+GDZrtR/845rrqiX6P7Li0L3bD8hYH0JOg42chOqvoJzg8SrHXxdMpChbwDwMVYlEtwzxntWOCkRNCA0DfBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=O3HogLui; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="O3HogLui"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4hfs5X6nw0z72sS
	for <regressions@lists.linux.dev>; Wed,  9 Sep 2026 08:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788936945;
	bh=6qI9D2RU/2PTHqlNrD1T9klfxiEnpATjjwaUBYs2mq0=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=O3HogLuiYYIJtMumb6iWj58aT6aplxRJQcO9aV7rM1d6qvP5c8QHODqApqdndqKJj
	 u8Ic/L6AUwc0j48NUnTIQ66hBUXeK+O28W+1zJxPeI9JL7vWJLzndziW0iPNKiioZC
	 16OPkNOMgJsBFHDyat3GByWckZWlHCwuWBaqw3aH22cYFahkNtxiRCpC6rcUgePYwi
	 8e2UOOwmxX9nQUJ0Ejk3rc98VSoQyaZBY5YVBH6uqvW7AFDPZTQX1U7+OGC1NWvDQt
	 gg4/uLGr3uc+UPubl0YpUppTGYMTh/fe1WzVgeznLaxsshvcjZu1TdRyZ6tWiqYo3i
	 yMozajo9++Rjg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4hfs5X664Zz72m6
	for <regressions@lists.linux.dev>; Wed,  9 Sep 2026 08:55:44 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hfs5X4YDLz8sZh
	for <regressions@lists.linux.dev>; Wed,  9 Sep 2026 08:55:44 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4E73E5FC32
	for <regressions@lists.linux.dev>; Wed,  9 Sep 2026 08:55:34 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1124b239-cb89-47d6-83c2-7c489ef90e63@leemhuis.info>
Date: Wed, 9 Sep 2026 08:55:33 +0200
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
X-PPP-Message-ID: 
 <178893693450.1190980.10529877111019220059@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 4E73E5FC32
X-NC-CID: +sTLVESLVSjimtvmAn5VPIZTFmrS4z183mScKXqYzuX5pqa5F30=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-btrfs/018a9738-1d4a-43a0-9352-a56d1e541364@gmail.com/
#regzbot dup:
https://lore.kernel.org/all/CAKLYgeL7nrA4nXcewdv9Fqg_s=3GS=vmoypnEiZBKQ7rySZFuQ@mail.gmail.com/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5760
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5786
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5777
#regzbot title: drm: amdgpu: various problems wrt to outputs, apparently
already fixed in 7.3





