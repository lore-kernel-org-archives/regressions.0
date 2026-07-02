Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183D33C6A2B
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 07:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978672; cv=none; b=LPZLjgSpi5G+bUqa1hVg0aqDd1HcZ3qjHTlK98xYV/REOqwYloLT2nUyJv9UPV7O5QhVfh0y+IFVP849kDrVBfORoAam5CYmdZR+owcu5Ntx0a6jC69gqLa/jvraS6MS78WltsfQ/5JxlN1s2b2irpG6/fierSIUOniBLs+/LZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978672; c=relaxed/simple;
	bh=CiyjAyTeTghQKzTHyi70V0h5uCjSatSdqCmN8rM95eI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=KFVP8ZZS65IVBdW08WqZGQItUNa0xC//r6+UXCWeBLf7MU6WOTiTtt5rNgv6tTAP3x/NkC6wIqh5ab3SuYr/Os7QgnzRRgrTo34xq7NoJ+jtOso6Ohq7It9RMqrkl8AMWFo6Qx8gPU+nD1VB0qvYd3GrL+ytTclWT44OXWWgWow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=aFP4QPpy; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="aFP4QPpy"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4grTb82hw7z768b
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 09:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1782978660;
	bh=CiyjAyTeTghQKzTHyi70V0h5uCjSatSdqCmN8rM95eI=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=aFP4QPpy9iK40rLA3D3ccq+djlUPJ97DwrI41jbI/7HFJtg4jDYMBNd0DKoypP1rY
	 P6QSJGB8yGgndocNhWZ+bngKW1mOD9rgZcmVT9F3IJTFBfMOAFwyvVtiR0/c+DlEtp
	 n0ppdT575SXWGH73ZumzNCh2mYdnmC03xBZ/z1qeJgTj1p0qTeIJwtx2cgb9vlU1sa
	 mJxZbiHAYLrEDYZeS8Av3EtmiD1gMUKiCW+BXSvsuOjk5LUnss5ItyeSj5hnK3l+0z
	 jhAVdjlR+gM876ihrtwPvRelTsCLJSoou6RPDCzJZcizMuOMyO8QeNHSX1QMjEeWnw
	 yPasxIX8KgpXQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4grTb821Drz7680
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 09:51:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4grTb75KC4z8tXR
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 09:50:59 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id EBFB0603F3
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 09:50:58 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a229a113-a235-4f9e-9f7f-be36fb14beee@leemhuis.info>
Date: Thu, 2 Jul 2026 09:50:58 +0200
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
 <178297865912.3308733.12157339201812300914@mxe9fb.netcup.net>
X-NC-CID: N7IFnVb3LtjLWFXpznQGgvVw6kBiRL/pyQIg6GnoVtoa+hoD3bU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/akVnoOYQOrt8k-Gu@karahi.librecast.net/
#regzbot introduced: 1d6e569b7d0c0b2736636749e4be0a27f3cefcb3
#regzbot title: tun/tap & vhost-net: multi-threaded network performance

#regzbot report:
https://lore.kernel.org/oe-lkp/202603112240.f7605968-lkp@intel.com/
#regzbot introduced: f9a48549a15a
#regzbot title: btrfs: 22.6% regression of fio.write_iops
#regzbot fix: btrfs: replace writeback inhibition xarray with a fixed
inline buffer
#regzbot monitor:
https://lore.kernel.org/all/12d3c3f07b8610ca13b0f3f792d420541afb7b33.1782949130.git.loemra.dev@gmail.com/

#regzbot report:
https://lore.kernel.org/all/6eccafaaaa60651ef091257c3439c46b@stwm.de/
#regzbot introduced: 95f9eb19d5e6
#regzbot title: nfs: soft lockup

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221704
#regzbot introduced: v7.1..v7.2-rc1
#regzbot title: ftrace: sys_enter_sched_getaffinity and
sys_enter_sched_setaffinity have a broken format

#regzbot report:
https://lore.kernel.org/all/cb287e3d-3066-4820-b464-6208b947974b@mailbox.org/
#regzbot introduced: d1e280334b7f
#regzbot title: usb: core: Dock stopped working



