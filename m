Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE43432D0DE
	for <regressions@lists.linux.dev>; Sat, 28 Mar 2026 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774695740; cv=none; b=JlH0e1QMPe6Q9aAgmQEYQg/0azSJBk2q0WiEF/yKo7ulHbezUUBEu61W6xZjC0jfRXiEYYOwpHYBJb2CHr5St/CcwEVN5kfuohmO89jVxx7Ddbv7IuiWXEs66/uEF7+P2OaKGoLv0+3A/hBz0LYaU/IqxdBDnSpbd2mSyi9Z++8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774695740; c=relaxed/simple;
	bh=veMyYXhxXpqvvFak3Xu/vibDRr1FACsEnYBpoYLNqLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+69jKmAlUam2QDyrIoSh27kPVw9/cO/xG9gVztYCyD4cjBcpK0X/KncBlp6bBtjOapnWO9mgOg3Um8DiuaYQoeNvlRwHJsGNv6LsJNdzVgKZsQw9ngsE2CWV39WTRfqTP86W73hkeW+XYaqIwtA5b6rCp3klfYoV92KfYv2VSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=knqIx5Ec; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="knqIx5Ec"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fjZ9Q2rrsz44MQ;
	Sat, 28 Mar 2026 11:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1774695178;
	bh=veMyYXhxXpqvvFak3Xu/vibDRr1FACsEnYBpoYLNqLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=knqIx5EcroiKaWY8ciLF1LuHE+KTkc7g4Y2WBgdwXYevr7+oN0foIsDxP0XcF60lQ
	 HcwE4nD4R0aXlWylpe6waV4lZYOyRDWoT7TYWGEMSH0L2b+QA6E13TNp13OTzzH7OW
	 t2LtZ+HRa+T7rHP9LS58Hrkpwe1ATF/q+v5bGsw7Y04Rq88FwRfjZG8q146mRh0BU8
	 ox3W4n1WYS9eoEpulS7YSEMMVeCqXsWtWhc/f1KJyvjYEmfSxqzF8hDmn1wKT7DP2M
	 rDas0TFaoIHUOI+EKLniXcW3/ltozxa8CqSxuaC5lBwI37VG/gAaAvk9xKXpX3JArl
	 D4qaOmDhesExg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fjZ9H5TwBz44k3;
	Sat, 28 Mar 2026 11:52:51 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fjZ9G4f2fz8sZg;
	Sat, 28 Mar 2026 11:52:50 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id CDF6B61741;
	Sat, 28 Mar 2026 11:52:49 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9652ce0b-bb4c-489d-9e32-89c5af5c8101@leemhuis.info>
Date: Sat, 28 Mar 2026 11:52:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Warnings and errors in drm_mode_config_cleanup when booting
 6.19.10 and 7.0-rc5
To: Matt Fagnani <matt.fagnani@bell.net>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <a8f058b3-ea2c-4af1-a19b-9ae2db46754c@bell.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <a8f058b3-ea2c-4af1-a19b-9ae2db46754c@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177469517006.2989398.1210444230681612805@mxe9fb.netcup.net>
X-NC-CID: 3WsP+7u+Zi4gE/cxKm3o5AqJYLfRMSltkqsgs8XAORpOmbx8NME=

Matt, thx for the report.

On 3/28/26 11:30, Matt Fagnani wrote:
> I could try to bisect. The commit
> e493c135980f90c20308d1a98f2e0d1223951e94 drm: Fix use-after-free on
> framebuffers and property blobs when calling drm_dev_unplug was included
> in 6.19.10 and changed drm_mode_config_cleanup https://git.kernel.org/
> pub/scm/linux/kernel/git/stable/linux.git/commit/?
> h=linux-6.19.y&id=e493c135980f90c20308d1a98f2e0d1223951e94

Did a quick search. Turns out this is mainline commit 6bee098b914176
("drm: Fix use-after-free on framebuffers and property blobs when
calling drm_dev_unplug") -- and when searching for that (FWIW, this is
not widely known, but that is really helpful in case like this, as the
mainline commit id is way more relevant) is turns out that is in the
process of getting reverted:

See https://lore.kernel.org/all/20260326082217.39941-2-dev@lankhorst.se/
or 45ebe43ea00d6b ("Revert "drm: Fix use-after-free on framebuffers and
property blobs when calling drm_dev_unplug"") [next-20260327
(pending-fixes)].

Sasha and Greg: you might want to make sure to pick this up.

Ciao, Thorsten


