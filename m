Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039E74E01FE
	for <regressions@lists.linux.dev>; Fri,  9 Oct 2026 12:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547229; cv=none; b=qGOVU0JvfS+/kUSHbb7pLNpOfs63oAZ2jfuP6upP2fLHR8Tp1A+WXZKr0kzQCywo5BTWZKlsIgU/SKtV/RKgfT37BYaOWf1uZ5jOZCb+y7RRm8ZW/OBkaQhI0mC18JPUy2ovpmHL159WWWAla+LL0faL3NBZsA9ujyiyV5/S8dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547229; c=relaxed/simple;
	bh=EEnRXnjEP6SoM/jfJ95g/ZI/xYqXUkuvsgfM2Scg59w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=NSbOe06zMRSwBLlbID46hMfsuIF8xXNSlwO/+Zq9MIUsQ5OhbhcwyFz/8Jza+bMuQFjgxhp/+hJS7Az/eN8yjcMACCVa7FPAHataFpz6A/PnCEpXRkCFE8UywlndX5/fawcsgIIE2CtdzyQniyyocpyn/XLMXMibpR35SCAcQD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Vb+Pe36c; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Vb+Pe36c"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4j1QPB5Dnrz417S
	for <regressions@lists.linux.dev>; Fri,  9 Oct 2026 13:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791547118;
	bh=EEnRXnjEP6SoM/jfJ95g/ZI/xYqXUkuvsgfM2Scg59w=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=Vb+Pe36cTYSYz8vEcHIE/z30esnY70vGx/+HXN3qoTfuHc+XiNNrhF36ltT0dxgzn
	 OiWw+d5ugibZEjEJYqbRbpAmjB9mTQWhdx1z7L9JDgMN0kfB/DRqxZUiseFESwibqI
	 lvdADuF/r9UOqOM8DdklC/nHdYScz1j1FBhtNXQy5o6FqoLamem5dr1bRlSgleMIr7
	 q1UgyYp4+pz92tRjm/C/w/34ng90bO7lTWzttOlLRdTB+UhSwPa5tE+dra7441GP2E
	 vI7E3+egvwtrlO3UB2jc2xuI3+ijZvOGa9H7QBbZq8qLaddY+bwEiGHsA2Jzxj22dG
	 AkWl87i4s7NVg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4j1QPB4Y3Tz4174
	for <regressions@lists.linux.dev>; Fri,  9 Oct 2026 13:58:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j1QP9642yz8tfw
	for <regressions@lists.linux.dev>; Fri,  9 Oct 2026 13:58:37 +0200 (CEST)
Received: from [172.18.73.209] (unknown [185.104.138.134])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 308625FB4C
	for <regressions@lists.linux.dev>; Fri,  9 Oct 2026 13:58:37 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 185.104.138.134) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[172.18.73.209]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b5f51455-9811-43f4-a259-c03a979eef9e@leemhuis.info>
Date: Fri, 9 Oct 2026 13:58:26 +0200
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
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179154711742.3042066.12241491086480413878@mxe9fb.netcup.net>
X-NC-CID: hGuSpRSnJBCk5UO/nc6N80nBLGOXkWbOTGXBIiDVc2YgRI/T6bM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=222095
#regzbot introduced: eddba19b8b5f
#regzbot title: PCI/AER: GPUs fail to initialize


#regzbot report:
https://lore.kernel.org/netdev/CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com/
#regzbot introduced: 447cbe95ebb9
#regzbot title: net: vlan: r8169: TX stall with checksum offload on VLAN
frames with inline tag (REORDER_HDR off)

#regzbot report:
https://lore.kernel.org/netdev/CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com/
#regzbot introduced: ffe8a0c6b55285
#regzbot fix: pinctrl: amd: Clear S4 wake bits when firmware has _AEI

#regzbot report:
https://lore.kernel.org/stable/179104011040.2214689.5921682013387867802@eldamar.lan/
#regzbot introduced: 980084de4d9b
#regzbot title: Bluetooth: btusb: required firmware missing, fallback or
revert needed

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5946
#regzbot introduced: c4a5160e3be079
#regzbot title: drm: amdgpu: DP monitor with conflicting 420-only EDID
declarations reports no signal at 4K120

#regzbot report:
https://lore.kernel.org/all/20261008191626.GA918896@bhelgaas/
#regzbot fix: PCI/AER: Skip error recovery on false alarms


