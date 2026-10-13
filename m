Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B574EB861
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889158; cv=none; b=o5ZxWFIRaHbTDSeWZyR0sUIzLx6PDBF3oyXzpcJBHkYC2a2G2axEFpcIbMhmWP38Zk0F5Dabz3ApJTEeBN5TE7ZE6ZdRDJsRB/jxaZGQ8kInAGaNcohBqgHiIPiQvYHf8Go09NckrTuwXDdSKVrEL3985RMagWlf2h/SWXUNI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889158; c=relaxed/simple;
	bh=EMqtk7rLrlEN+oO/z60Q+VX375sYj2NZRZgIfos8JWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1YXY74u9AE5yj8pu/bGqoLJLK/TTv+2Ru8S4hRIuCiTrkrXbCYWuz5wjAPykTE/N7GLylzz6DII+WRbJt23fn0EGBRfiah8cc+/OuxwaZFU6JrHBOGzE1ELuL/oS1t4yZuGA9oyvhGsGcQj1uMRvu9EX381rD+Rsf1sowxNcAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SqGYq0cP; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SqGYq0cP"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4j3rsh3CmCz8B8s;
	Tue, 13 Oct 2026 12:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791889096;
	bh=EMqtk7rLrlEN+oO/z60Q+VX375sYj2NZRZgIfos8JWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SqGYq0cPVOEgmHpbMYcEr0O4G3c3R9drk40NTZT0pYzYFWH6kNKj7C5fVngXKTgtl
	 XqLpwtFjLoRd9ZFIZnQ/mXk6k+S6EJKq9IIzp8Pay/y1Pd1OKl0qUPE1bCiGvBOdLW
	 SRxKsI9u5YRcMwTxjLFZxym8vHaj9TYTMmg9kIb9VjkKTJ+buA67+7FF5F+5vsMnzl
	 sa82eSoZdS48zy9557Y4laWkO/TXP+y0Fs2+BhZ11hybnIGdB8RQqvOCfa/3gTT0lu
	 m0LEXbeHoiJWI3T0YnYEXwceRdHcp92vnouCw0lxj0ozwDUSagcwtbl6boYZklg1IJ
	 M4CKZEj6o/y8w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4j3rsh2V5Mz4xGd;
	Tue, 13 Oct 2026 12:58:16 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j3rsg40BMz8sch;
	Tue, 13 Oct 2026 12:58:15 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id CF4D35FA0C;
	Tue, 13 Oct 2026 12:58:14 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <5261c571-ffff-4a32-87af-ceeef22b6e49@leemhuis.info>
Date: Tue, 13 Oct 2026 12:58:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] qcom/qcom-msm8960-samsung-expressatt: SSH over USB
 no longer works
To: Xu Yang <xu.yang_2@oss.nxp.com>, Xu Yang <xu.yang_2@nxp.com>
Cc: Rudraksha Gupta <guptarud@gmail.com>, Peter Chen <peter.chen@kernel.org>,
 Frank Li <Frank.li@oss.nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
References: <8e659c4f-723b-4241-9c2b-8ea42c6c3600@gmail.com>
 <bd839c03-5cd7-48bf-91a7-c8dc51e5f6e5@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <bd839c03-5cd7-48bf-91a7-c8dc51e5f6e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <179188909528.3877442.14332892974642647922@mxe9fb.netcup.net>
X-NC-CID: hR2EzCuTVd69ha0eDe6n/tK1gx1XHYEmmVVN4QQPLkPn/QCrca0=

On 10/1/26 04:39, Rudraksha Gupta wrote:
> On 9/29/26 03:43, Rudraksha Gupta wrote:
>
>> I can no longer SSH in via USB. Reverting
>> dd0c03d685225cb8fc60c477417d1b9c3b05ba9d fixes the issue.

FWIW, that is dd0c03d685225c ("usb: chipidea: udc: support dynamic
gadget add/remove") [v7.2-rc1] from Xu Yang, committed by Greg.

>> Please see below on logs that I captured over UART (v7.3.0-rc5) and
>> USB (v7.3.0-rc5 + revert).
>>
>> Distro is Nura (formerly postmarketOS). Using head of pmbootstrap/
>> pmaports. Instructions for this device:
>> https://wiki.nura.eco/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-
>> expressatt)
> 
> I have identified the culprit:
> 
>> CONFIG_USB_OTG_FSM=y
> 
> If (v7.3.0-rc5 + revert), then regardless of CONFIG_USB_OTG_FSM, SSH
> over USB works.
> 
> If (v7.3.0-rc5), then CONFIG_USB_OTG_FSM cannot be set to y. It must be
> not set.
Well, that is good to know, but shouldn't happen.

@Xu Yang: do you might have any idea what might be wrong here? Is this
something we should revert to "regroup and rethink" the approach and
reapply it later in improved form?

Ciao, Thorsten
